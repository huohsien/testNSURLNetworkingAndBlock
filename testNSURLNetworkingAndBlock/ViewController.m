//
//  ViewController.m
//  testNSURLNetworkingAndBlock
//
//  Created by victor on 6/25/15.
//  Copyright (c) 2015 Huohsien Chiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSUInteger counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(receiveGotAllImageNotification:)
//                                                 name:kNotificationGotAllImages
//                                               object:nil];
    
    counter = 0;
    [[PhotoManager sharedManager] getAllPhotosWithSuccess:^{
        NSLog(@"images loaded");
        self.numberOfPhotos = [[PhotoManager sharedManager].images count];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
        [self.view addGestureRecognizer:tapGestureRecognizer];
        [self showAnImage];
    } failure:^{
        NSLog(@"no photos in camera roll");
    }];



}
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAnImage {
    UIImage *image = [[PhotoManager sharedManager].images objectAtIndex:counter++];
    NSLog(@"image width=%f, height=%f", image.size.width, image.size.height);
    [self.imagesView setImage:image];
    [self.imagesView setContentMode:UIViewContentModeScaleAspectFit];
    if (counter >= self.numberOfPhotos) {
        counter = 0;
    }
}
#pragma mark -- callbacks

- (void)imageViewTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"image view got tapped!");
    [self showAnImage];
}
@end
