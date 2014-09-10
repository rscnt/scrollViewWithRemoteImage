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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)loadView
{
    ZSPSImageScrollView *v = [[ZSPSImageScrollView alloc]
                              initWithURLOfImage:[NSURL
                                                  URLWithString:@"http://modelsensation.com/wp-content/uploads/2011/03/5-640x640.jpg"]];
    v.backgroundColor = [UIColor colorWithRed:0.696 green:0.655 blue:0.247 alpha:0.640];
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view = v;
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
