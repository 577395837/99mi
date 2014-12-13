//
//  Data.m
//
//  Created by   on 14-12-13
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Player.h"
#import "PromoteGoods.h"


NSString *const kDataPlayer = @"player";
NSString *const kDataPromoteGoods = @"promote_goods";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize player = _player;
@synthesize promoteGoods = _promoteGoods;


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
    NSObject *receivedPlayer = [dict objectForKey:kDataPlayer];
    NSMutableArray *parsedPlayer = [NSMutableArray array];
    if ([receivedPlayer isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPlayer) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPlayer addObject:[Player modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPlayer isKindOfClass:[NSDictionary class]]) {
       [parsedPlayer addObject:[Player modelObjectWithDictionary:(NSDictionary *)receivedPlayer]];
    }

    self.player = [NSArray arrayWithArray:parsedPlayer];
    NSObject *receivedPromoteGoods = [dict objectForKey:kDataPromoteGoods];
    NSMutableArray *parsedPromoteGoods = [NSMutableArray array];
    if ([receivedPromoteGoods isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPromoteGoods) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPromoteGoods addObject:[PromoteGoods modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPromoteGoods isKindOfClass:[NSDictionary class]]) {
       [parsedPromoteGoods addObject:[PromoteGoods modelObjectWithDictionary:(NSDictionary *)receivedPromoteGoods]];
    }

    self.promoteGoods = [NSArray arrayWithArray:parsedPromoteGoods];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForPlayer = [NSMutableArray array];
    for (NSObject *subArrayObject in self.player) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPlayer addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPlayer addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPlayer] forKey:kDataPlayer];
    NSMutableArray *tempArrayForPromoteGoods = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promoteGoods) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromoteGoods addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromoteGoods addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromoteGoods] forKey:kDataPromoteGoods];

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

    self.player = [aDecoder decodeObjectForKey:kDataPlayer];
    self.promoteGoods = [aDecoder decodeObjectForKey:kDataPromoteGoods];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_player forKey:kDataPlayer];
    [aCoder encodeObject:_promoteGoods forKey:kDataPromoteGoods];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.player = [self.player copyWithZone:zone];
        copy.promoteGoods = [self.promoteGoods copyWithZone:zone];
    }
    
    return copy;
}


@end
