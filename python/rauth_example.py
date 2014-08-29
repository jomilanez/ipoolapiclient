# https://rauth.readthedocs.org/en/latest/api/#
from rauth import OAuth1Session

# only consumer_key and consumer_secret needs to be defined 
session = OAuth1Session( consumer_key='oauth-key', consumer_secret='oauth-secret')
# it's important to enable header based authentification, URL parameter signature will not work
r = session.get('https://ipool.s.asideas.de/api/v3/search', header_auth=True)
# r is an Response object; if you get <Response [200]> you're good
print r