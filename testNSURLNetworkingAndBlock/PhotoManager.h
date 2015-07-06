//
//  PhotoHelper.h
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 6/27/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <AssetsLibrary/AssetsLibrary.h>

@import Photos;

extern NSString * const kNotificationGotAllImages;
@interface PhotoManager : NSObject {
    ALAssetsLibrary *library;
    NSMutableArray *mutableArray;
}
@property (nonatomic, strong) PHFetchResult *fetchResult;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *images;
+ (PhotoManager *)sharedManager;
- (void)allPhotosCollected:(NSArray*)imgArray;
- (void)getAllPhotosWithSuccess:(void (^)(void))success failure:(void (^)(void))failure;
@end
