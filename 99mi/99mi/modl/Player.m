//
//  Player.m
//
//  Created by   on 14-12-13
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Player.h"


NSString *const kPlayerAdCode = @"ad_code";
NSString *const kPlayerAdLink = @"ad_link";
NSString *const kPlayerActionId = @"action_id";
NSString *const kPlayerAction = @"action";


@interface Player ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Player

@synthesize adCode = _adCode;
@synthesize adLink = _adLink;
@synthesize actionId = _actionId;
@synthesize action = _action;


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
            self.adCode = [self objectOrNilForKey:kPlayerAdCode fromDictionary:dict];
            self.adLink = [self objectOrNilForKey:kPlayerAdLink fromDictionary:dict];
            self.actionId = [[self objectOrNilForKey:kPlayerActionId fromDictionary:dict] doubleValue];
            self.action = [self objectOrNilForKey:kPlayerAction fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adCode forKey:kPlayerAdCode];
    [mutableDict setValue:self.adLink forKey:kPlayerAdLink];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actionId] forKey:kPlayerActionId];
    [mutableDict setValue:self.action forKey:kPlayerAction];

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

    self.adCode = [aDecoder decodeObjectForKey:kPlayerAdCode];
    self.adLink = [aDecoder decodeObjectForKey:kPlayerAdLink];
    self.actionId = [aDecoder decodeDoubleForKey:kPlayerActionId];
    self.action = [aDecoder decodeObjectForKey:kPlayerAction];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adCode forKey:kPlayerAdCode];
    [aCoder encodeObject:_adLink forKey:kPlayerAdLink];
    [aCoder encodeDouble:_actionId forKey:kPlayerActionId];
    [aCoder encodeObject:_action forKey:kPlayerAction];
}

- (id)copyWithZone:(NSZone *)zone
{
    Player *copy = [[Player alloc] init];
    
    if (copy) {

        copy.adCode = [self.adCode copyWithZone:zone];
        copy.adLink = [self.adLink copyWithZone:zone];
        copy.actionId = self.actionId;
        copy.action = [self.action copyWithZone:zone];
    }
    
    return copy;
}


@end
