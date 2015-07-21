//
//  LVSearchViewController.m
//  LVDevelopDemo
//
//  Created by 刘春牢 on 15/7/10.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVSearchViewController.h"

@interface LVSearchViewController () <UISearchBarDelegate>

/** 搜索框 */
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 遮盖 */
@property (weak, nonatomic) IBOutlet UIButton *cover;

- (IBAction)coverClick:(UIButton *)sender;

@end

@implementation LVSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.searchBar.tintColor = LVColor(32, 191, 179);
    
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    // 1.显示导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    // 2.隐藏搜索框右边的取消按钮
    [searchBar setShowsCancelButton:YES animated:YES];
    
    // 3.显示遮盖
    [UIView animateWithDuration:0.5 animations:^{
        self.cover.alpha = 0.3;
    }];

}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    // 1.显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // 2.隐藏搜索框右边的取消按钮
    [searchBar setShowsCancelButton:NO animated:YES];
    
    // 3.显示遮盖
    [UIView animateWithDuration:0.5 animations:^{
        self.cover.alpha = 0;
    }];
    searchBar.text = nil;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"开始搜索%@", searchBar.text);
}


- (IBAction)coverClick:(UIButton *)sender {
    [self.searchBar resignFirstResponder];
}



@end
