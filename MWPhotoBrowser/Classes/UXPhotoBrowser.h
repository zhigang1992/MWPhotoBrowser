//
//  UXPhotoBrowser.h
//  youxin
//
//  Created by Kyle Fang on 5/31/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//


#import <MWPhotoBrowser/MWPhotoBrowser.h>

#import <MWPhotoBrowser/UIView+viewController.h>

@interface UXPhotoBrowser : MWPhotoBrowser <MWPhotoBrowserDelegate>

@property (nonatomic) UIImage *imageSeleceted;

+ (UXPhotoBrowser *)photoBrowserWithImageView:(UIImageView *)imageViewToStretch;

@end
