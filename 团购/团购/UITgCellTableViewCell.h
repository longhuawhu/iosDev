//
//  UITgCellTableViewCell.h
//  团购
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  Good;

@interface UITgCellTableViewCell : UITableViewCell

@property (nonatomic, copy) Good *good;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
