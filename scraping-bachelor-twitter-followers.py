import twitter
import pandas as pd

# initialize the twitter api module with your keys
api = twitter.Api(consumer_key='consumer-key-here',
                  consumer_secret='consumer-secret-here',
                  access_token_key='access-token-key-here',
                  access_token_secret='access-token-secret-here',
                  sleep_on_rate_limit=True
                 )

# read in the contestant data set
df = pd.read_csv('bachelor_data.csv')

# only grab non-null twitter handles to grab followers
handles = [handle for handle in df['twitter_handle'].values if not pd.isnull(handle) and handle != '-']

# create a connections dict - key: handle; value: list of following (friends)
connections_dict = {}

# iterate through all the twitter handles - wrap in try/catch in case user is private
for handle in handles:
    try:
        # get the friends via twitter api & save to connections dict
        friends = api.GetFriends(screen_name=handle)
        connections_dict[handle] = friends
        print('success: ' + handle)
    except:
        print('error: ' + handle)
        continue

# create the output dataframe. each row will be a follower output
relationship_df = pd.DataFrame(columns = ["who", "following"])

# for each handle in connections, dict - add each individual to the row
for key, value in connections_dict.items():
    
    # if they are following someone!
    if len(value) > 0:
        # create a temp df w this handle's info
        temp = pd.DataFrame(value)
        temp['who'] = key
        temp.columns = ["following", "who"]
        temp["following"] = temp["following"].apply(lambda x: x.screen_name)
        
        # append this to the relationship (output) df
        relationship_df = pd.concat([relationship_df, temp])

# save file to csv
relationship_df[['who', 'following']].to_csv('MASTER-DATA-TWITTER-RELATIONSHIP.csv', index = False)