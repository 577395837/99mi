//
//  MainViewController.m
//  99mi
//
//  Created by wxb on 14-12-13.
//  Copyright (c) 2014年 bei. All rights reserved.
//

#import "MainViewController.h"
#import "HomePageViewController.h"
#import "ClassifyViewController.h"
#import "InformationViewController.h"
#import "ShopBusViewController.h"
#import "UserCenterViewController.h"
#import "LeveyTabBarController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];


    HomePageViewController * homeVC = [[HomePageViewController alloc]init];
    UINavigationController * homeNC = [[UINavigationController alloc]initWithRootViewController:homeVC];
    [homeVC release];
    
    ClassifyViewController * classVC = [[ClassifyViewController alloc]init];
    UINavigationController * classNC = [[UINavigationController alloc]initWithRootViewController:classVC];
    [classVC release];
    
    InformationViewController * infoVC = [[InformationViewController alloc]init];
    UINavigationController * infoNC = [[UINavigationController alloc]initWithRootViewController:infoVC];
    [infoVC release];
    
    ShopBusViewController * shopVC = [[ShopBusViewController alloc]init];
    UINavigationController * shopNC = [[UINavigationController alloc]initWithRootViewController:shopVC];
    [shopVC release];
    
    UserCenterViewController * userVC = [[UserCenterViewController alloc]init];
    UINavigationController * userNC = [[UINavigationController alloc]initWithRootViewController:userVC];
    [userVC release];
    
    NSArray * array = [NSArray arrayWithObjects:homeNC,classNC,infoNC,shopNC,userNC, nil];
    [homeNC release];
    [classNC release];
    [infoNC release];
    [shopNC release];
    [userNC release];
    
    NSMutableDictionary * imageDC1 = [NSMutableDictionary dictionaryWithCapacity:2];
    [imageDC1 setObject:[UIImage imageNamed:@"footer_home_icon@2x"] forKey:@"Default"];
    [imageDC1 setObject:[UIImage imageNamed:@"footer_home_active_icon@2x"] forKey:@"Seleted"];
    
    NSMutableDictionary * imageDC2 = [NSMutableDictionary dictionaryWithCapacity:2];
    [imageDC2 setObject:[UIImage imageNamed:@"footer_search_icon@2x"] forKey:@"Default"];
    [imageDC2 setObject:[UIImage imageNamed:@"footer_search_active_icon@2x"] forKey:@"Seleted"];
    
    NSMutableDictionary * imageDC3 = [NSMutableDictionary dictionaryWithCapacity:2];
    [imageDC3 setObject:[UIImage imageNamed:@"footer_zixun_icon@2x"] forKey:@"Default"];
    [imageDC3 setObject:[UIImage imageNamed:@"footer_zixun_active_icon@2x"] forKey:@"Seleted"];
    
    NSMutableDictionary * imageDC4 = [NSMutableDictionary dictionaryWithCapacity:2];
    [imageDC4 setObject:[UIImage imageNamed:@"footer_shopping_cart_icon@2x"] forKey:@"Default"];
    [imageDC4 setObject:[UIImage imageNamed:@"footer_shopping_cart_active_icon@2x"] forKey:@"Seleted"];
    
    NSMutableDictionary * imageDC5 = [NSMutableDictionary dictionaryWithCapacity:2];
    [imageDC5 setObject:[UIImage imageNamed:@"footer_user_icon@2x"] forKey:@"Default"];
    [imageDC5 setObject:[UIImage imageNamed:@"footer_user_active_icon@2x"] forKey:@"Seleted"];
    
    NSArray * imgArray = [NSArray arrayWithObjects:imageDC1,imageDC2,imageDC3,imageDC4,imageDC5, nil];
    
    LeveyTabBarController * leveyTabBar = [[LeveyTabBarController alloc]initWithViewControllers:array imageArray:imgArray];
    [self.view addSubview:leveyTabBar.view];
    
    
}



@end








