//
//  ViewController.m
//  weibo
//
//  Created by lh on 15/1/6.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "StatusCell.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *statuses;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 400;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return  YES;
}
-(NSArray *)statuses
{
    if(_statuses == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *statusArray = [NSMutableArray array];
        
        for(NSDictionary* dict in dictArray) {
            Status *status = [Status statusWithDict:dict];
            [statusArray addObject:status];
        }
        _statuses = statusArray;
    }
    
    return _statuses;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"status";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.status = self.statuses[indexPath.row];
    
    return cell;
}
@end
