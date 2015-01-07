//
//  Status.m
//  weibo
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "Status.h"

@implementation Status

+(instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
   if(self = [super init])
   {
       [self setValuesForKeysWithDictionary:dict];
   }
    return self;
}
@end
