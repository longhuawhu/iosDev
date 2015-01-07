//
//  StatusCell.m
//  weibo
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "StatusCell.h"
#include "Status.h"

#define  STATUSCELLFONT [UIFont systemFontOfSize:14]

@interface StatusCell ()

@property (nonatomic, weak)UIImageView *iconView;
@property (nonatomic, weak)UILabel *nameView;
@property (nonatomic, weak)UIImageView *vipView;
@property (nonatomic, weak)UILabel *textView;
@property (nonatomic, weak)UIImageView *pictureView;

@end
@implementation StatusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *nameView = [[UILabel alloc] init];
        nameView.font = STATUSCELLFONT;
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        UILabel *textView = [[UILabel alloc] init];
         textView.font = STATUSCELLFONT;
        textView.numberOfLines = 0;
        [self.contentView addSubview:textView];
        self.textView = textView;
        
  
        UIImageView *pictureView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;

    }
    return  self;
}

-(void)setStatus:(Status *)status
{
    _status = status;
    
    [self settingData];
    
    [self settingFrame];
}

-(void)settingData
{
    self.iconView.image = [UIImage imageNamed:self.status.icon];
    self.nameView.text = self.status.name;
  //  NSLog(@"%@", self.nameView.text);
    if(self.status.vip){
        self.vipView.hidden = NO;
        self.vipView.image = [UIImage imageNamed:@"vip"];
    }
    else{
        self.vipView.hidden = YES;
    }
    self.textView.text = self.status.text;
    if(self.status.picture){
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:self.status.picture];
    }
    else
    {
        self.pictureView.hidden = YES;
    }
    
}

-(CGSize)sizeWithText:(NSString *) text font:(UIFont *) font MaxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

-(void)settingFrame
{
    CGFloat padding = 10;
    
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconH = 30;
    CGFloat iconW = 30;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);

    CGSize nameSize = [self sizeWithText:self.status.name font:STATUSCELLFONT MaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameX = CGRectGetMaxX(self.iconView.frame) + padding;
    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
    self.nameView.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    CGFloat vipX = CGRectGetMaxX(self.nameView.frame) + padding;
    CGFloat vipY = nameY;
    CGFloat vipW = 15;
    CGFloat vipH = 15;
    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconView.frame) +padding;
    CGSize textSize = [self sizeWithText:self.status.text font:STATUSCELLFONT MaxSize:CGSizeMake(300, MAXFLOAT)];
    self.textView.frame = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    
    if(self.status.picture)
    {
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(self.textView.frame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        self.pictureView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    }
}

@end
