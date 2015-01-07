//
//  ViewController.m
//  团购
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"
#import "good.h"
#import "UITgCellTableViewCell.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray* tgs;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 80;
    
//    UIButton *footBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    footBtn.frame = CGRectMake(0, 0, 0, 44);
//    footBtn.backgroundColor = [UIColor orangeColor];
//    [footBtn setTitle:@"加载更多团购" forState:UIControlStateNormal];
    UINib *nib = [UINib nibWithNibName:@"foot" bundle:nil];
    UIView * footerView = [[nib instantiateWithOwner:nil options:nil] lastObject];
    
    self.tableView.tableFooterView = footerView;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)tgs
{
    if (_tgs == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *dictArry = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tgsArray = [NSMutableArray array];
        
        for(NSDictionary *dict in dictArry)
        {
            Good *good = [Good goodWithDict:dict];
            [tgsArray addObject:good];
        }
        
        _tgs = tgsArray;
    }
    
    return _tgs;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITgCellTableViewCell *cell = [UITgCellTableViewCell cellWithTableView:tableView];
    
    cell.good = self.tgs[indexPath.row];
    
    return cell;
}
@end
