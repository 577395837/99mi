//
//  PromoteGoods.h
//
//  Created by   on 14-12-13
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PromoteGoods : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double shopPrice;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *goodsThumb;
@property (nonatomic, strong) NSString *marketPrice;
@property (nonatomic, strong) NSString *goodsImg;
@property (nonatomic, strong) NSString *originalImg;
@property (nonatomic, strong) NSString *goodsSubtitle;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *goodsId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
