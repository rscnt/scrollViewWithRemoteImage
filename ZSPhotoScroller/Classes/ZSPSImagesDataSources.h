//
//  ZSPSImagesDataSources.h
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSViewController.h"
#import <Foundation/Foundation.h>

@interface ZSPSImagesDataSources : UIResponder <UIPageViewControllerDataSource>

@property (nonatomic) NSUInteger index;

-(instancetype) initWithArraysOfURLs:(NSArray*)urls;
-(instancetype) initWithArraysOfURLs:(NSArray *)urls atIndex:(NSUInteger)index;
-(ZSPSViewController *) getFirstViewController;
-(ZSPSViewController *) getLastViewController;
-(ZSPSViewController *) getViewControllerAtIndex:(NSUInteger)index;
-(NSUInteger)imageCount;

@end
