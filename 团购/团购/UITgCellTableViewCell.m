//
//  UITgCellTableViewCell.m
//  团购
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "UITgCellTableViewCell.h"
#import "good.h"

@interface UITgCellTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *buyCount;

@end

@implementation UITgCellTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"goodCell";
    UITgCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {
        //   cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

-(void)setGood:(Good *)gd
{
    _good = gd;
    
    self.icon.image = [UIImage imageNamed:gd.icon];
    self.title.text = gd.title;
    self.price.text = [NSString stringWithFormat:@"¥ %@", gd.price];
    self.buyCount.text = [NSString stringWithFormat:@"已有%@人购买", gd.buyCount];
}

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
