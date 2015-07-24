//
//  ViewController.m
//  LVDevelopDemo
//
//  Created by PBOC CS on 15/5/8.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "ViewController.h"
#import "LVTouchIdViewController.h"
#import "LVBlueToothViewController.h"
#import "LVOpenFlashViewController.h"
#import "LVViewController.h"
#import "LVDragViewController.h"
#import "LVSearchViewController.h"




@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *funcArr;

@end

@implementation ViewController

- (NSArray *)funcArr {
    if (!_funcArr) {
        _funcArr = @[@"指纹识别", @"蓝牙设备扫描、连接", @"打开闪光灯", @"AES加密",@"下拉放大效果", @"搜索框Demo"];
    }
    return _funcArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    

}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.funcArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.funcArr[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
            [self touchIdDemo];
            break;
        case 1:
            [self blueToothDemo];
            break;
        case 2:
            [self openTheFlash];
            break;
        case 3:
#pragma mark - AES加密
            [self.navigationController pushViewController:[[LVViewController alloc] init] animated:YES];
            break;
#pragma mark - 下拉放大
        case 4:
            [self.navigationController pushViewController:[[LVDragViewController alloc] init] animated:YES];
            break;
#pragma mark - 搜索框
        case 5:
            [self.navigationController pushViewController:[[LVSearchViewController alloc] init] animated:YES];
            
            
        default:
            break;
    }

}

#pragma mark - 指纹识别演示
- (void)touchIdDemo {
    LVTouchIdViewController *touchIdVc = [[LVTouchIdViewController alloc] init];
    touchIdVc.view.backgroundColor = self.view.backgroundColor;
    [self.navigationController pushViewController:touchIdVc animated:YES];
}

#pragma mark - 蓝牙设备扫描检测演示
- (void)blueToothDemo {

    LVBlueToothViewController *blueToothVc = [[LVBlueToothViewController alloc] init];
    [self.navigationController pushViewController:blueToothVc animated:YES];

}


#pragma mark - 打开闪光灯
- (void)openTheFlash {
    NSLog(@"打开闪光灯");
    LVOpenFlashViewController *openFlashVc = [[LVOpenFlashViewController alloc] init];
    [self.navigationController pushViewController:openFlashVc animated:YES];

}

#pragma mark - 设置cell的分割线样式
-(void)viewDidLayoutSubviews {
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
