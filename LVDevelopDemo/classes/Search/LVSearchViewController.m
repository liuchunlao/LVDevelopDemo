//
//  LVSearchViewController.m
//  LVDevelopDemo
//
//  Created by 刘春牢 on 15/7/10.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVSearchViewController.h"
#import "LVSearchResultController.h"

@interface LVSearchViewController () <UISearchControllerDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UISearchController *searchVc;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation LVSearchViewController

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"1", @"2", @"123", @"sdfs", @"sdfafdassdfsd1213123f"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建用来显示搜索结果的控制器
    LVSearchResultController *resultVc = [[LVSearchResultController alloc] init];
    // 将所有的数据传过去
    resultVc.allData = self.dataArr;
    
    // 搜索控制器
    self.searchVc = [[UISearchController alloc] initWithSearchResultsController:resultVc];
    
    self.searchVc.searchBar.delegate = self;

    // 搜索框文字改变时会调用里面update方法
    self.searchVc.searchResultsUpdater = resultVc;
    
    // 设置搜索框
    [self.searchVc.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchVc.searchBar;
    
    // 指定从当前控制器modal出来，否则就默认为跟控制器
    self.definesPresentationContext = YES;
}



#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
    
}

#pragma mark - UISearchBarDelegate
// 点击了键盘的search按钮时调用
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"sdflsdjf");
}



@end
