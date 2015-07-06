//
//  PhotoHelper.m
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 6/27/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import "PhotoManager.h"

NSString * const kNotificationGotAllImages = @"NotificationGotAllImages";

@implementation PhotoManager

+ (PhotoManager *)sharedManager {
    static PhotoManager *_manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _manager = [[PhotoManager alloc] init];
    });
    
    return _manager;
}

- (instancetype) init {
    self = [super init];
    self.data = [NSMutableArray new];
    self.images = [NSMutableArray new];
    return self;
}

- (void)getAllPhotosWithSuccess:(void (^)(void))success failure:(void (^)(void))failure {
    
    if (NSClassFromString(@"PHFetchResult")) {  // check if new photo framework exists?
        PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
        PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
        if ([fetchResult countOfAssetsWithMediaType:PHAssetMediaTypeImage] > 0) {
            self.fetchResult = fetchResult;
        }
    }
    NSUInteger numberOfPhotos =[self.fetchResult count];
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, numberOfPhotos)];
    [self.fetchResult enumerateObjectsAtIndexes:indexSet
                                        options:0
                                     usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                         if (obj) {
                                             [self.data addObject:obj];
                                         }
                                     }];
    PHImageRequestID requestID = 0;
    int __block count = 1;
    for (PHAsset *asset in self.data) {
            [[PHImageManager defaultManager] cancelImageRequest:requestID];
        static PHImageRequestOptions *requestOptions;
        if (!requestOptions) {
            requestOptions = [[PHImageRequestOptions alloc] init];
        }
        requestID =
        [[PHImageManager defaultManager] requestImageDataForAsset:asset options:requestOptions resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
//            UIImage *image = [UIImage imageWithData:imageData];
            [self.images addObject:imageData];
            if (count == numberOfPhotos) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationGotAllImages object:self];
                if (success) {
                    success();
                }
            } else if (count == 0) {
                if (failure) {
                    failure();
                }
            }
            count++;
            NSLog(@"count=%d", count);
        }];
    }
    
    

}
- (void)allPhotosCollected:(NSArray*)imgArray
{
    //write your code here after getting all the photos from library...
    NSLog(@"all pictures are %@",imgArray);
}

@end
