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
    NSUInteger index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(receiveGotAllImageNotification:)
//                                                 name:kNotificationGotAllImages
//                                               object:nil];
    
    index = 0;
    self.imagesView = [[SimpleImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.imagesView];
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
//    index = arc4random() % self.numberOfPhotos;
    if (index >= self.numberOfPhotos) {
        index = 0;
    }
    UIImage *image = [UIImage imageWithData:[[PhotoManager sharedManager].images objectAtIndex:index]];
    NSLog(@"image width=%f, height=%f", image.size.width, image.size.height);
    [self.imagesView setImage:image];
//    [self.imagesView setContentMode:UIViewContentModeScaleAspectFit];
    self.indexLabel.text = [NSString stringWithFormat:@"index:%ld", index];
    index++;

}
#pragma mark -- callbacks

- (void)imageViewTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"image view got tapped!");
    [self showAnImage];
}
@end
