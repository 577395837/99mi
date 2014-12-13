//
//  Status.m
//
//  Created by   on 14-12-13
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Status.h"


NSString *const kStatusSucceed = @"succeed";


@interface Status ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Status

@synthesize succeed = _succeed;


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
            self.succeed = [[self objectOrNilForKey:kStatusSucceed fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.succeed] forKey:kStatusSucceed];

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

    self.succeed = [aDecoder decodeDoubleForKey:kStatusSucceed];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_succeed forKey:kStatusSucceed];
}

- (id)copyWithZone:(NSZone *)zone
{
    Status *copy = [[Status alloc] init];
    
    if (copy) {

        copy.succeed = self.succeed;
    }
    
    return copy;
}


@end
