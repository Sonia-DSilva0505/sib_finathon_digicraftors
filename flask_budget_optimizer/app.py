import pandas as pd
import numpy as np
from flask import Flask, request, jsonify

app = Flask(__name__)

# Load the dataset
data_file = "data/person.xlsx"
transactions = pd.read_excel(data_file)


@app.route("/optimize", methods=["POST"])
def optimize_budget():
    if not request.json:
        return jsonify({"error": "Input data must be provided as JSON"}), 400

    # Extract input from JSON request
    input_data = request.json
    target_balance = input_data.get("target_balance")
    time_period = input_data.get("time_period")

    # Step 3 - Analyze historical spending
    transactions["Date"] = pd.to_datetime(transactions["DATE"])
    transactions["SpendingCategory"] = np.where(
        transactions["WITHDRAWAL AMT"] > 0, transactions["TRANSACTION DETAILS"], None
    )
    category_spend = transactions.groupby("SpendingCategory")["WITHDRAWAL AMT"].sum()
    category_spend_monthly_avg = category_spend / len(transactions["Date"].unique())

    # Step 4 - Forecast total spending
    total_forecast = category_spend_monthly_avg * time_period

    # Step 5 - Calculate spending gap
    current_balance = transactions["Balance"].iloc[-1]
    forecast_balance = current_balance - total_forecast
    gap = target_balance - forecast_balance

    # Step 6 - Rank categories
    fixed_costs = ["Rent", "Utility"]  # consider rent, utility as fixed
    discretionary = [c for c in category_spend.index if c not in fixed_costs]
    discretionary = sorted(discretionary, key=category_spend.get, reverse=True)

    # Step 7 - Suggest reductions for discretionary categories only
    discretionary = [c for c in discretionary if c not in fixed_costs]

    reduction_suggestions = []
    for category in discretionary:
        if gap.all() <= 0:
            break
        proposed_reduction = category_spend_monthly_avg[category] * 0.10
        reduction_suggestions.append(
            f"Reduce {category} spending by {proposed_reduction}"
        )
        gap -= proposed_reduction

    return jsonify({"reduction_suggestions": reduction_suggestions})


if __name__ == "__main__":
    app.run(debug=True)
