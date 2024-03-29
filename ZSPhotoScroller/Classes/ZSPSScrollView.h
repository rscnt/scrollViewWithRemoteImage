//  ZSPSMainViewController.h
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSPSScrollView : UIScrollView

@property (strong, nonatomic) UIImage *image;

-(instancetype)initWithUIImage:(UIImage *)image;
-(instancetype)initWithURLOfImage:(NSURL *)url;

@end
