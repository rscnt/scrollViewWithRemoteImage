//
//  ZSPSPageControlForYour.m
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/11/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSImagesDataSources.h"
#import "ZSPSPageControlForYour.h"

@implementation ZSPSPageControlForYour

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self  = [super initWithCoder:aDecoder];
    if (self) {
        ZSPSImagesDataSources *datasource = [[ZSPSImagesDataSources alloc]
            initWithArraysOfURLs:@[
                                   [NSURL URLWithString:@"http://kitchen-at-camont.com/wp-content/uploads/2011/12/iphone-spain+-076-640x640.jpg"],
                                   [NSURL URLWithString:@"http://www.dertz.in/wallpapers/files/640x640%20Aurora%20Professional-33.jpg"],
                                   [NSURL URLWithString:@"http://www.designandhype.com/wp-content/uploads/2012/05/new-3-640x640.jpeg"],
                                   [NSURL URLWithString:@"http://www.umnet.com/pic/diy/screensaver/10/0b8f188e-6346.jpg"],
                                   [NSURL URLWithString:@"http://www.umnet.com/pic/diy/screensaver/10/7aaac97b-5458.jpg"],
                                   [NSURL URLWithString:@"http://tel.by/uploads/posts/2011-09/1317253203_set-640x640-31.jpg"]
                                   ]];
        self.dataSource_ = datasource;
        self.dataSource = self.dataSource_;
        [self setViewControllers:@[[datasource getFirstViewController]]
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:NULL];
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

@end
