//
//  ZSPSImagesDataSources.m
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//
#import "ZSPSViewController.h"
#import "ZSPSPageControlForYour.h"
#import "ZSPSImagesDataSources.h"


@interface ZSPSImagesDataSources()
{
    NSArray *_urls;
}
@end

@implementation ZSPSImagesDataSources

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


#pragma mark getters for controllers

-(ZSPSViewController *)getViewControllerAtIndex:(NSUInteger)index
{
    if (index < [self imageCount]) {
        ZSPSViewController *vc = [[ZSPSViewController alloc] initWithURL:[self getUrlAtIndex:index]];
        return vc;
    }
    return nil;
}

-(ZSPSViewController *)getFirstViewController
{
    return [self getViewControllerAtIndex:_index++];
}

-(ZSPSViewController *)getLastViewController
{
    return [self getViewControllerAtIndex:[self imageCount]];
}

-(ZSPSViewController *) getAfterViewController
{
    _index++;
    return [self getViewControllerAtIndex:_index];
}

-(ZSPSViewController *) getBeforeViewController
{
    _index--;
    return  [self getViewControllerAtIndex:_index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(ZSPSViewController *)viewController
{
    return [self getAfterViewController];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(ZSPSViewController *)viewController
{
    return [self getBeforeViewController];
}

@end