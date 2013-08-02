//
//  MWViewController.m
//  MWCustomSegmentController
//
//  Created by meway on 13-8-2.
//  Copyright (c) 2013年 meway. All rights reserved.
//

#import "MWViewController.h"
#import "MWCustomSegementView.h"

@interface MWViewController ()
<MWCustomSegementViewDelegate>

@end

@implementation MWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	MWCustomSegementView *_segementView = [[MWCustomSegementView alloc]initWithFrame:CGRectMake(0, 100, 320, 49) segementSize:CGSizeMake(75, 29.f)];
    _segementView.delegate = self;
    _segementView.items = @[@"公司详情",@"产品中心",@"代理意向",@"产品中心"];
    _segementView.headImage = MWImageMake(@"gs_intro", @"gs_intro-");
    _segementView.midImage = MWImageMake(@"gs_pro", @"gs_pro-");
    _segementView.trailImage = MWImageMake(@"gs_agent", @"gs_agent-");
    [self.view addSubview:_segementView];
    
    MWCustomSegementView *_segementView2 = [[MWCustomSegementView alloc]initWithFrame:CGRectMake(0, 200, 320, 44) segementSize:CGSizeMake(75, 34.f)];
    _segementView2.delegate = self;
    _segementView2.backgroundImage = [UIImage imageNamed:@"selectedbg"];
    _segementView2.items = @[@"展馆导览",@"展馆平面",@"展位图"];
    
    _segementView2.headImage = MWImageMake(@"leftbuta", @"leftbut");
    _segementView2.midImage = MWImageMake(@"midla", @"midl");
    _segementView2.trailImage = MWImageMake(@"ritbuta", @"ritbut");
    
    [self.view addSubview:_segementView2];
    
    MWCustomSegementView *_segementView3 = [[MWCustomSegementView alloc]initWithFrame:CGRectMake(0, 300, 320, 44) segementSize:CGSizeMake(75, 34.f)];
    _segementView3.delegate = self;
    _segementView3.backgroundImage = [UIImage imageNamed:@"selectedbg"];
    _segementView3.items = @[@"",@"",@""];
    _segementView3.headImage = MWImageMake(@"Com_leftbg.png", @"Com_lefta.png");
    _segementView3.midImage = MWImageMake(@"Com_midlbg", @"Com_midla.png");
    _segementView3.trailImage = MWImageMake(@"Com_rightbg.png", @"Com_righta.png");
    [self.view addSubview:_segementView3];
}

- (void)segementClickedAtIndex:(NSInteger)index
{
    NSLog(@"index = %d",index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
