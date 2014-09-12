//
//  ZSPSViewController.m
//  ZSPhotoScroller
//
//  Created by Raul Ascencio on 9/10/14.
//  Copyright (c) 2014 rscnt. All rights reserved.
//

#import "ZSPSImageScrollView.h"
#import "ZSPSViewController.h"
#import <UIKit/UIColor.h>

@interface ZSPSViewController ()

@end

@implementation ZSPSViewController

-(id)init
{
    self = [super initWithNibName:nil bundle:nil];
    return self;
}

-(instancetype)initWithStringURL:(NSString *)url
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _url = [[NSURL alloc] initWithString:url];
    }
    return self;
};

-(instancetype)initWithURL:(NSURL *)url
{
    self = [super initWithNibName:nil bundle:nil];
    if(self) {
        _url = url;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark lazy getters.

-(ZSPSImageScrollView *) _scrollImage
{
    return _scrollImage;
}

#pragma mark image setters.

-(BOOL)setURLOfImageToScroll:(NSString *)url
{
    _url = [NSURL URLWithString:url];
    return YES;
}

-(BOOL)setUIImageToScroll:(UIImage *)image
{
    [_scrollImage setUIImageToScroll:image];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)loadView
{
    _scrollImage = [[ZSPSImageScrollView alloc] init];
    // Aditional tweaks.
    [_scrollImage setURLOfImageToScroll:_url];
    _scrollImage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view = _scrollImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

-(instancetype) initWithStringURL:(NSString *)url andIndex:(NSUInteger)index
{
    self = [super init];
    if (self) {
        self.index =index;
        _url = [NSURL URLWithString:url];
    }
    return self;
};

@end
