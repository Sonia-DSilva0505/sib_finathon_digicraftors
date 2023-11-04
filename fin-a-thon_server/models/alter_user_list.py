import pandas as pd 
import json 

def main(cust_id, response, feature): 
#if the response is 0, then move the feature to the end of the list

  most_used_features_dict = {}
  with open('datasets/user_features.json', 'r') as f:
    most_used_features_dict = json.load(f)

  if response == 0:
    most_used_features_dict[cust_id].remove(feature)
    most_used_features_dict[cust_id].append(feature)

  elif response == 1:
    #use lru to move one step forward from initial position
    most_used_features_dict[cust_id].remove(feature)
    most_used_features_dict[cust_id].insert(1, feature)

  else:
    #put at top
    most_used_features_dict[cust_id].remove(feature)
    most_used_features_dict[cust_id].insert(0, feature)  

  # Write updated dict back to JSON file  
  with open('user_features.json', 'w') as f:
    json.dump(most_used_features_dict, f, indent=4)
  

if __name__ == '__main__':
  main(cust_id, response, feature)