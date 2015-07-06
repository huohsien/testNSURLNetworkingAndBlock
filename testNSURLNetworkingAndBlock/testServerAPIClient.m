//
//  testServerAPIClient.m
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 6/27/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import "testServerAPIClient.h"

NSString * const kTestServerBaseURLString= @"vhc.dyndns-home.com";
@implementation testServerAPIClient

+ (instancetype)sharedClient {
    static testServerAPIClient *_client = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _client = [[testServerAPIClient alloc] init];
    });
    return _client;

}
@end
