//
//  LVInfoViewController.m
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/5/14.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVInfoViewController.h"

@interface LVInfoViewController () <CBPeripheralDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) NSArray *servicesArr;
@property (nonatomic, strong) NSArray *characteristicsArr;

@property (nonatomic, weak) UITableView *tableView;
@end

@implementation LVInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.peripheral.delegate = self;
    [self.peripheral discoverServices:nil];

}

@end
