# https://rauth.readthedocs.org/en/latest/api/#
from rauth import OAuth1Session

# only consumer_key and consumer_secret needs to be defined 
session = OAuth1Session(consumer_key='hackathon', consumer_secret='33f3fb11-59b4-4a38-a549-27bb4628d1af')
# it's important to enable header based authentification, URL parameter signature will not work
# to ignore SSL certificate verify failed error by setting verify parameter to False
r = session.get('https://ipool.s.asideas.de/api/v3/search', header_auth=True, verify=False)
# r is an Response object; if you get <Response [200]> you're good
# have a look at https://github.com/kennethreitz/requests
print r