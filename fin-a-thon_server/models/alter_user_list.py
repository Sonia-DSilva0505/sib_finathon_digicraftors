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
    print(most_used_features_dict[cust_id])
  elif response == 1:
    #use lru to move one step forward from initial position
    most_used_features_dict[cust_id].remove(feature)
    most_used_features_dict[cust_id].insert(1, feature)
    print(most_used_features_dict[cust_id])
  else:
    #put at top
    most_used_features_dict[cust_id].remove(feature)
    most_used_features_dict[cust_id].insert(0, feature)   

if __name__ == '__main__':
  main(cust_id, response, feature)