//
//  RequestManager.h
//  99mi
//
//  Created by wxb on 14-12-13.
//  Copyright (c) 2014年 bei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject
+ (void)getBigScrollAndFireGoods:(void (^) (BOOL isSuccessed,NSDictionary * dict))completeBlock
;
@end
