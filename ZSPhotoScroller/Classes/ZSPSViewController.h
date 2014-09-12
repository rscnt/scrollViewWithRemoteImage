//
//  ZSPSViewController.h
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSImageScrollView.h"
#import <UIKit/UIKit.h>

@interface ZSPSViewController : UIViewController

@property (nonatomic) NSUInteger index;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) ZSPSImageScrollView *scrollImage;

-(instancetype) initWithStringURL:(NSString *)url;
-(instancetype) initWithStringURL:(NSString *)url andIndex:(NSUInteger)index;
-(instancetype) initWithURL:(NSURL *)url;
-(BOOL) setURLOfImageToScroll:(NSString *)string;
-(BOOL) setUIImageToScroll:(UIImage *)image;

@end
