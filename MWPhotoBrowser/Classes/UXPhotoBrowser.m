//
//  UXPhotoBrowser.m
//  youxin
//
//  Created by Kyle Fang on 5/31/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//

#import "UXPhotoBrowser.h"

#import <MWPhotoBrowser/UIView+viewController.h>

#import "UXStatusBarNotifierManager.h"

@implementation UXPhotoBrowser

+ (UXPhotoBrowser *)photoBrowserWithImageView:(UIImageView *)imageViewToStretch{
    
    UIView *rootView = [UIApplication sharedApplication].keyWindow;
    CGRect imageRectInView = [imageViewToStretch.superview convertRect:imageViewToStretch.frame toView:rootView];
    
    
    UIImageView *selfCloneImg = [[UIImageView alloc] initWithFrame:imageRectInView];
    selfCloneImg.image = imageViewToStretch.image;
    selfCloneImg.clipsToBounds = YES;
    selfCloneImg.contentMode = UIViewContentModeScaleAspectFill;
        
	// Create browser

    UXPhotoBrowser *browser = [[UXPhotoBrowser alloc] initWithDelegate:nil];
    [browser setInitialPageIndex:0];
    [browser hideControlsAfterDelay];
    
    browser.imageSeleceted = imageViewToStretch.image;

    // Hide tapped image from screenshot
    imageViewToStretch.hidden = YES;
    browser.screenshot = [UIView screenshotForScreen];
    imageViewToStretch.hidden = NO;
    
    browser.entranceImg = selfCloneImg;
    browser.entranceImg.clipsToBounds = YES;
    return browser;
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return 1;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithImage:self.imageSeleceted];
    return photo;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

@end
