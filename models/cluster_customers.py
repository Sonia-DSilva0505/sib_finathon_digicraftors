import pandas as pd 
import json

def main(): 
  
  df = pd.read_csv('datasets/sib_finathon_dataset.csv')
  """
  Returns sorted feature list for a given user_id
  """
  event_list = df['event'].unique().tolist()
  user_features = {}
  with open('datasets/user_features.json', 'r') as f:
    user_features = json.load(f)
  cluster_dict = {}
  for event in event_list:
      cluster = []
      for user_id, most_used_features in user_features.items():
        if len(most_used_features) > 0 and most_used_features[0] == event:
          cluster.append(user_id)
      cluster_dict[event] = cluster

  return cluster_dict
  
if __name__ == '__main__':
  main()
  