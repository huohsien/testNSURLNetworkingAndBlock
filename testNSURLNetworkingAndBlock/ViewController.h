//
//  ViewController.h
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 6/25/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoManager.h"
#import "SimpleImageView.h"
@interface ViewController : UIViewController

@property (nonatomic) SimpleImageView *imagesView;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (nonatomic) NSUInteger numberOfPhotos;

@end

