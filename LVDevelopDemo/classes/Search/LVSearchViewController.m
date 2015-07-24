//
//  LVSearchViewController.m
//  LVDevelopDemo
//
//  Created by 刘春牢 on 15/7/10.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVSearchViewController.h"
#import "LVSearchResultController.h"

@interface LVSearchViewController () <UISearchControllerDelegate, UITableViewDataSource, UITableViewDelegate>


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
    
    LVSearchResultController *resultVc = [[LVSearchResultController alloc] init];
    resultVc.allData = self.dataArr;
    
    self.searchVc = [[UISearchController alloc] initWithSearchResultsController:resultVc];

    // 搜索框文字改变时会调用里面update方法
    self.searchVc.searchResultsUpdater = resultVc;
    
    [self.searchVc.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchVc.searchBar;
    
    // 指定从当前控制器modal出来，否则就默认为跟控制器
    self.definesPresentationContext = YES;
}


#pragma mark - UISearchControllerDelegate


#pragma mark - UISearchResultsUpdating



- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
//    // 1.显示导航栏
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    
//    // 2.隐藏搜索框右边的取消按钮
//    [searchBar setShowsCancelButton:NO animated:YES];
//    
//    // 3.显示遮盖
//    [UIView animateWithDuration:0.5 animations:^{
//        self.cover.alpha = 0;
//    }];
//    searchBar.text = nil;
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



@end
