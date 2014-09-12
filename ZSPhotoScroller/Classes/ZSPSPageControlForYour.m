//
//  ZSPSPageControlForYour.m
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/11/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSImagesDataSources.h"
#import "ZSPSPageControlForYour.h"
#import "UIImage+ImageEffects.h"

@interface ZSPSPageControlForYour()
{
    NSArray *_urls;
}
@end

@implementation ZSPSPageControlForYour

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self  = [super initWithCoder:aDecoder];

    if (self) {
        [self setArrayOfURLs:@[
                                   [NSURL URLWithString:@"http://kitchen-at-camont.com/wp-content/uploads/2011/12/iphone-spain+-076-640x640.jpg"],
                                   [NSURL URLWithString:@"http://www.dertz.in/wallpapers/files/640x640%20Aurora%20Professional-33.jpg"],
                                   [NSURL URLWithString:@"http://www.designandhype.com/wp-content/uploads/2012/05/new-3-640x640.jpeg"],
                                   [NSURL URLWithString:@"http://www.umnet.com/pic/diy/screensaver/10/0b8f188e-6346.jpg"],
                                   [NSURL URLWithString:@"http://tel.by/uploads/posts/2011-09/1317253203_set-640x640-31.jpg"]
                                   ]];
        self.dataSource = self;
        [self setViewControllers:@[[self getFirstViewController]]
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:NULL];
        self.view.backgroundColor = [[UIColor alloc] initWithWhite:0.000 alpha:0.070];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) setArrayOfURLs:(NSArray *)urls
{
    _urls = urls;
    _index = 0;
}


-(instancetype)initWithArraysOfURLs:(NSArray *)urls
{
    self = [super init];
    if (self) {
        _urls = urls;
        _index = 0;
    }
    return self;
};

-(instancetype)initWithArraysOfURLs:(NSArray *)urls atIndex:(NSUInteger)index
{
    self = [super init];
    if (self) {
        _urls = urls;
        _index = index;
    }
    return self;
}

#pragma mark index for _urls array.

-(NSUInteger)imageCount
{
    return _urls.count;
}

-(NSURL *)currentURL
{
    return _urls[_index];
}

-(NSURL *)getUrlAtIndex:(NSUInteger)index
{
    return _urls[index];
}

- (UIImage*)getDarkBlurredImageWithTargetView:(UIView *)targetView
{
    CGSize size = targetView.frame.size;
    UIGraphicsBeginImageContext(size);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(c, 0, 0);
    [targetView.layer renderInContext:c]; // view is the view you are grabbing the screen shot of. The view that is to be blurred.
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image applyDarkEffect];
}

#pragma mark getters for controllers

-(ZSPSViewController *)getViewControllerAtIndex:(NSUInteger)index
{
    if (index < [self imageCount]) {
        ZSPSViewController *vc = [[ZSPSViewController alloc] initWithURL:[self getUrlAtIndex:index]];
        vc.index = index;
        return vc;
    }
    return nil;
}

-(ZSPSViewController *)getFirstViewController
{
    return [self getViewControllerAtIndex:0];
}

-(ZSPSViewController *)getLastViewController
{
    return [self getViewControllerAtIndex:[self imageCount]];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(ZSPSViewController *)viewController
{
    _index = viewController.index;
    return [self getViewControllerAtIndex:_index + 1];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(ZSPSViewController *)viewController
{
    _index = viewController.index;
    return [self getViewControllerAtIndex:_index - 1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self imageCount];
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return _index;
}

@end
