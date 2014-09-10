//
//  ZSPSMainViewController.m
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImageDownloader.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "ZSPSScrollView.h"
#import "TilingView.h"

@interface ZSPSScrollView () <UIScrollViewDelegate>
{
    UIImageView *_zoomView;
    CGSize _imageSize;
    TilingView *_tillingView;
    CGPoint _pointToCenterAfterResize;
    CGFloat _scaleToRestoreAfterResize;
}
@end

@implementation ZSPSScrollView

-(instancetype)initWithUIImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

-(instancetype)initWithURLOfImage:(NSURL *)url
{
    _zoomView = [UIImage init];
    [_zoomView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"Error for image fetching: %@", error);
        }
        NSLog(@"IMAGE URL : %@", imageURL);
    }];
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
