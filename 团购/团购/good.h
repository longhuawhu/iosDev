//
//  good.h
//  团购
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Good : NSObject

/** 商品名称 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *buyCount;


@property (nonatomic, copy) NSString *icon;


+(instancetype) goodWithDict:(NSDictionary *)dict;

-(instancetype) initWithDict:(NSDictionary *)dict;
@end
