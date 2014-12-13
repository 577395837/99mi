//
//  RequestManager.m
//  99mi
//
//  Created by wxb on 14-12-13.
//  Copyright (c) 2014年 bei. All rights reserved.
//

#import "RequestManager.h"
#import "ASIHTTPRequest.h"

@implementation RequestManager

//首页大滚动视图和本周爆品
+ (void)getBigScrollAndFireGoods:(void (^) (BOOL isSuccessed,NSDictionary * dict))completeBlock
{
    NSString * str = [NSString stringWithFormat:@"http://www.99mi.com/server/?url=home/data"];
    NSURL * url = [NSURL URLWithString:str];
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
//        NSString * responseStr = [request responseString];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"成功 %@",dict);
        completeBlock(YES,dict);
    }];
    [request setFailedBlock:^{
        NSLog(@"失败 %@",[request error]);
        completeBlock(NO,nil);
    }];
    [request startAsynchronous];
}

@end



