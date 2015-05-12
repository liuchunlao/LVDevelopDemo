//
//  ViewController.m
//  LVDevelopDemo
//
//  Created by PBOC CS on 15/5/8.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "ViewController.h"
#import "LVTouchIdViewController.h"





@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *funcArr;

@end

@implementation ViewController

- (NSArray *)funcArr {
    if (!_funcArr) {
        _funcArr = @[@"指纹识别", @"蓝牙设备扫描、连接", @"打开闪光灯"];
    }
    return _funcArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;

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



}


#pragma mark - 打开闪光灯
- (void)openTheFlash {
    NSLog(@"打开闪光灯");

}




@end
