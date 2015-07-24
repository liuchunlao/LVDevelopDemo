//
//  LVSearchResultController.m
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/7/24.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVSearchResultController.h"

@interface LVSearchResultController ()

@property (nonatomic, strong) NSArray *result;

@end

@implementation LVSearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {

    // 需要搜索的内容
    NSString *text = searchController.searchBar.text;
    if (text == nil) {
        return;
    }
    
    // 预言、过滤得到需要的数据
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"self contains '%@'", text]];
    self.result = [self.allData filteredArrayUsingPredicate:predicate];
    
    // 将搜索到结果显示到列表里面
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.result.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"result";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSLog(@"%s  %@", __func__, self.result);
    cell.textLabel.text = self.result[indexPath.row];
    
    return cell;
    
}

@end
