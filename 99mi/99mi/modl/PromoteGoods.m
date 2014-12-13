//
//  PromoteGoods.m
//
//  Created by   on 14-12-13
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "PromoteGoods.h"


NSString *const kPromoteGoodsShopPrice = @"shop_price";
NSString *const kPromoteGoodsUnit = @"unit";
NSString *const kPromoteGoodsGoodsThumb = @"goods_thumb";
NSString *const kPromoteGoodsMarketPrice = @"market_price";
NSString *const kPromoteGoodsGoodsImg = @"goods_img";
NSString *const kPromoteGoodsOriginalImg = @"original_img";
NSString *const kPromoteGoodsGoodsSubtitle = @"goods_subtitle";
NSString *const kPromoteGoodsGoodsName = @"goods_name";
NSString *const kPromoteGoodsGoodsId = @"goods_id";


@interface PromoteGoods ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PromoteGoods

@synthesize shopPrice = _shopPrice;
@synthesize unit = _unit;
@synthesize goodsThumb = _goodsThumb;
@synthesize marketPrice = _marketPrice;
@synthesize goodsImg = _goodsImg;
@synthesize originalImg = _originalImg;
@synthesize goodsSubtitle = _goodsSubtitle;
@synthesize goodsName = _goodsName;
@synthesize goodsId = _goodsId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.shopPrice = [[self objectOrNilForKey:kPromoteGoodsShopPrice fromDictionary:dict] doubleValue];
            self.unit = [self objectOrNilForKey:kPromoteGoodsUnit fromDictionary:dict];
            self.goodsThumb = [self objectOrNilForKey:kPromoteGoodsGoodsThumb fromDictionary:dict];
            self.marketPrice = [self objectOrNilForKey:kPromoteGoodsMarketPrice fromDictionary:dict];
            self.goodsImg = [self objectOrNilForKey:kPromoteGoodsGoodsImg fromDictionary:dict];
            self.originalImg = [self objectOrNilForKey:kPromoteGoodsOriginalImg fromDictionary:dict];
            self.goodsSubtitle = [self objectOrNilForKey:kPromoteGoodsGoodsSubtitle fromDictionary:dict];
            self.goodsName = [self objectOrNilForKey:kPromoteGoodsGoodsName fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kPromoteGoodsGoodsId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shopPrice] forKey:kPromoteGoodsShopPrice];
    [mutableDict setValue:self.unit forKey:kPromoteGoodsUnit];
    [mutableDict setValue:self.goodsThumb forKey:kPromoteGoodsGoodsThumb];
    [mutableDict setValue:self.marketPrice forKey:kPromoteGoodsMarketPrice];
    [mutableDict setValue:self.goodsImg forKey:kPromoteGoodsGoodsImg];
    [mutableDict setValue:self.originalImg forKey:kPromoteGoodsOriginalImg];
    [mutableDict setValue:self.goodsSubtitle forKey:kPromoteGoodsGoodsSubtitle];
    [mutableDict setValue:self.goodsName forKey:kPromoteGoodsGoodsName];
    [mutableDict setValue:self.goodsId forKey:kPromoteGoodsGoodsId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.shopPrice = [aDecoder decodeDoubleForKey:kPromoteGoodsShopPrice];
    self.unit = [aDecoder decodeObjectForKey:kPromoteGoodsUnit];
    self.goodsThumb = [aDecoder decodeObjectForKey:kPromoteGoodsGoodsThumb];
    self.marketPrice = [aDecoder decodeObjectForKey:kPromoteGoodsMarketPrice];
    self.goodsImg = [aDecoder decodeObjectForKey:kPromoteGoodsGoodsImg];
    self.originalImg = [aDecoder decodeObjectForKey:kPromoteGoodsOriginalImg];
    self.goodsSubtitle = [aDecoder decodeObjectForKey:kPromoteGoodsGoodsSubtitle];
    self.goodsName = [aDecoder decodeObjectForKey:kPromoteGoodsGoodsName];
    self.goodsId = [aDecoder decodeObjectForKey:kPromoteGoodsGoodsId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_shopPrice forKey:kPromoteGoodsShopPrice];
    [aCoder encodeObject:_unit forKey:kPromoteGoodsUnit];
    [aCoder encodeObject:_goodsThumb forKey:kPromoteGoodsGoodsThumb];
    [aCoder encodeObject:_marketPrice forKey:kPromoteGoodsMarketPrice];
    [aCoder encodeObject:_goodsImg forKey:kPromoteGoodsGoodsImg];
    [aCoder encodeObject:_originalImg forKey:kPromoteGoodsOriginalImg];
    [aCoder encodeObject:_goodsSubtitle forKey:kPromoteGoodsGoodsSubtitle];
    [aCoder encodeObject:_goodsName forKey:kPromoteGoodsGoodsName];
    [aCoder encodeObject:_goodsId forKey:kPromoteGoodsGoodsId];
}

- (id)copyWithZone:(NSZone *)zone
{
    PromoteGoods *copy = [[PromoteGoods alloc] init];
    
    if (copy) {

        copy.shopPrice = self.shopPrice;
        copy.unit = [self.unit copyWithZone:zone];
        copy.goodsThumb = [self.goodsThumb copyWithZone:zone];
        copy.marketPrice = [self.marketPrice copyWithZone:zone];
        copy.goodsImg = [self.goodsImg copyWithZone:zone];
        copy.originalImg = [self.originalImg copyWithZone:zone];
        copy.goodsSubtitle = [self.goodsSubtitle copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.goodsId = [self.goodsId copyWithZone:zone];
    }
    
    return copy;
}


@end
