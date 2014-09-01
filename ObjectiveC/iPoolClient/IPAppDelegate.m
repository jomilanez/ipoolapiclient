//
//  IPAppDelegate.m
//  iPoolClient
//
//  Created by Lehrack, Sebastian on 01.09.14.
//  Copyright (c) 2014 Lehrack, Sebastian. All rights reserved.
//

#import "IPAppDelegate.h"

#import "GCOAuth.h"

@implementation IPAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // setting service host and endpoint
    
    NSString* baseUrl = @"ipool.s.asideas.de:443";
    NSString* path = @"/api/v3/search";
    
    // building query parameters

    NSMutableDictionary* parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[NSString stringWithFormat:@"%@", @"2014-08-30T10:13:10.0Z"] forKey:@"startDate"];
    [parameters setObject:[NSString stringWithFormat:@"%@", @"dateCreated"] forKey:@"sortBy"];
    [parameters setObject:[NSString stringWithFormat:@"%@", @"desc"] forKey:@"order"];
    [parameters setObject:[NSString stringWithFormat:@"%d", 100] forKey:@"limit"];
    [parameters setObject:[NSString stringWithFormat:@"\"%@\"", @"fingerpost"] forKey:@"sources"];
    [parameters setObject:[NSString stringWithFormat:@"%d", 2] forKey:@"min_urgency"];

    // setting oauth key and token
    
    NSString* oauthKey = @"musichackday2014";
    NSString* oauthToken = @"276ea410-29fb-11e4-8c21-0800200c9a66";
    
    NSString* userID = [[NSUUID UUID] UUIDString];

    NSURLRequest *request = [GCOAuth URLRequestForPath:path
                                         GETParameters:parameters
                                                  host:baseUrl
                                           consumerKey:oauthKey
                                        consumerSecret:oauthToken
                                           accessToken:nil
                                           tokenSecret:nil
                                                  uuid:userID];
    
    NSURLConnection *urlConn = [[NSURLConnection alloc] init];
    
    // sending asynchronous request with response handler
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data,
                                               NSError *error)
     {
         
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
         
         if ([response respondsToSelector:@selector(allHeaderFields)]) {
             NSDictionary *dictionary = [httpResponse allHeaderFields];
         }
         
         if(error!=nil) {
             NSLog(@"Connection error: %@", error.description);
             return;
         }
         
         
         NSError *data_error = nil;
         id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         
         NSArray *jsonArray = nil;
         
         if ([jsonObject isKindOfClass:[NSArray class]]) {
             
             jsonArray = (NSArray *)jsonObject;
             
         } else if ([jsonObject isKindOfClass:[NSDictionary class]]) {
             
             NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
             jsonArray = [NSArray arrayWithObjects:jsonDictionary, nil];
             
         } else {
             
             if (error != nil) {
                 NSLog(@"JSON parsing error: %@", data_error.description);
             }
             
             return;
             
         }
         
         [self handleResponse:jsonArray];
         
     }];
}

- (void) handleResponse:(NSArray *)resultArray {
    
    // processing result array
    
}

@end
