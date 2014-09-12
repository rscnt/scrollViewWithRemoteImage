//
//  ZSPSPageControlForYour.h
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/11/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSImagesDataSources.h"
#import <UIKit/UIKit.h>

@interface ZSPSPageControlForYour : UIPageViewController <UIPageViewControllerDataSource>

@property (nonatomic) NSUInteger index;

-(instancetype) initWithArraysOfURLs:(NSArray*)urls;
-(instancetype) initWithArraysOfURLs:(NSArray *)urls atIndex:(NSUInteger)index;
-(ZSPSViewController *) getFirstViewController;
-(ZSPSViewController *) getLastViewController;
-(ZSPSViewController *) getViewControllerAtIndex:(NSUInteger)index;
-(NSUInteger)imageCount;

@end
