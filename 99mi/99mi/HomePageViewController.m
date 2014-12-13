//
//  HomePageViewController.m
//  99mi
//
//  Created by wxb on 14-12-13.
//  Copyright (c) 2014年 bei. All rights reserved.
//

#import "HomePageViewController.h"
#import "RequestManager.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];


    self.title = @"首页";

    [RequestManager getBigScrollAndFireGoods];

    
}


@end








