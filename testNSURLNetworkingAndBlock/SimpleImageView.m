//
//  SimpleImageView.m
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 7/6/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import "SimpleImageView.h"

@implementation SimpleImageView {
    UIImage *image;
}

- (instancetype)init {
    self = [super init];

    return self;
}
- (void)setImage:(UIImage *)anImage {
    if (image)
        image = nil;
    image = anImage;
    [self recalculateViewSize];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [image drawInRect:rect];
}

- (void)recalculateViewSize {
    CGFloat screenWidth;
    CGFloat screenHeight;
    if ([[self superview] isKindOfClass:[UIView class]]) {
        screenWidth = [self superview].frame.size.width;
        screenHeight = [self superview].frame.size.height;
        NSLog(@"screen width=%f height=%f", screenWidth, screenHeight);
    }

    CGFloat screenAspectRatio = screenWidth / screenHeight;
    NSLog(@"image orient=%ld width=%f height=%f", image.imageOrientation, image.size.width, image.size.height);
    CGFloat imageAspectRatio = (image.size.width / image.size.height);
    if (image.imageOrientation == UIImageOrientationLeft ||image.imageOrientation == UIImageOrientationLeftMirrored ||image.imageOrientation == UIImageOrientationRight ||image.imageOrientation == UIImageOrientationRightMirrored) {
//        imageAspectRatio = 1.0 / imageAspectRatio;
        NSLog(@"flip!");
    }
    if (imageAspectRatio >= screenAspectRatio) {
        self.frame = CGRectMake(0, (screenHeight - screenWidth / imageAspectRatio) / 2.0, screenWidth, screenWidth / imageAspectRatio);
    } else if (imageAspectRatio < screenAspectRatio) {
        self.frame = CGRectMake((screenWidth - screenHeight * imageAspectRatio) / 2.0, 0, screenHeight * imageAspectRatio, screenHeight);
    }
}

@end
