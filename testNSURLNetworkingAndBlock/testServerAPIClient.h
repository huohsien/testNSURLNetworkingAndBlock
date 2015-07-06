//
//  testServerAPIClient.h
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 6/27/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kServerBaseURLString;

@interface testServerAPIClient : NSObject

+(testServerAPIClient *)sharedClient;

@end
