//
//  ZSPSImagesDataSources.m
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSViewController.h"
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
        if (index <= _urls.count) {
            _index = index;
        }
    }
    return self;
}

#pragma mark index for _urls array.

-(NSUInteger)imageCount
{
    return _urls.count - 1;
}

-(NSURL *)currentURL
{
    return _urls[_index];
}

-(NSUInteger)decreaseIndex
{
    return _index--;
}

-(NSUInteger)increaseIndex
{
    return _index++;
}

-(NSURL *)getUrlAtIndex:(NSUInteger)index
{
    return _urls[index];
}


#pragma mark getters for controllers

-(ZSPSViewController *)getViewControllerAtIndex:(NSUInteger)index
{
    ZSPSViewController *vc = [[ZSPSViewController alloc] initWithURL:[self getUrlAtIndex:index]];
    return vc;
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
    [self increaseIndex];
    return [[ZSPSViewController alloc] initWithURL:[self currentURL]];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(ZSPSViewController *)viewController
{
    [self decreaseIndex];
    return [[ZSPSViewController alloc] initWithURL:[self currentURL]];
}

@end