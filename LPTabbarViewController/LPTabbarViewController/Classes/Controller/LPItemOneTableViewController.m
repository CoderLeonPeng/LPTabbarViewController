//
//  LPItemOneTableViewController.m
//  LPTabbarViewController
//
//  Created by 彭利民 on 15/5/9.
//  Copyright (c) 2015年 彭利民. All rights reserved.
//

#import "LPItemOneTableViewController.h"

@interface LPItemOneTableViewController ()

@end

@implementation LPItemOneTableViewController

static NSString * const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];

}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"one --- %zd", indexPath.row];
    return cell;
}

@end
