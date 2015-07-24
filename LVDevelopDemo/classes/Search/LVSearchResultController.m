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

    NSLog(@"%@", searchController.searchBar.text);
    NSString *text = searchController.searchBar.text;
    NSLog(@"%@", text);
    if (text == nil) {
        return;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"self contains '%@'", text]];
    self.result = [self.allData filteredArrayUsingPredicate:predicate];
    
    NSLog(@"self.result = %@", self.result);
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%zd", self.result.count);
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
