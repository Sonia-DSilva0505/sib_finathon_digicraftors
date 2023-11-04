import pandas as pd
import json

def get_list():

    PATH = 'datasets/sib_finathon_dataset.csv'
    df = pd.read_csv(PATH)
    """
    Returns dict of {user_id: sorted feature list} 
    """

    user_features = {}
    for user_id, group in df.groupby('customer_id'):
        event_counts = group['event'].value_counts()
        feature_list = event_counts.index.tolist()
        
        if feature_list[0] == 'app_login':
            feature_list.pop(0)
            
        user_features[user_id] = feature_list
    
    with open('datasets/user_features.json', 'w') as f:
        json.dump(user_features, f)
        
    return user_features

def main(uid): 
    """
    Returns sorted feature list for a given user_id
    """
    user_features = get_list()
    return user_features[uid]
        
if __name__ == '__main__':
    main(uid)