//
//  Player.h
//
//  Created by   on 14-12-13
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Player : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *adCode;
@property (nonatomic, strong) NSString *adLink;
@property (nonatomic, assign) double actionId;
@property (nonatomic, strong) NSString *action;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
