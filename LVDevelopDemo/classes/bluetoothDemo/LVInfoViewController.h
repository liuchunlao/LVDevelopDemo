//
//  LVInfoViewController.h
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/5/14.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//  蓝牙设备信息

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
@interface LVInfoViewController : UIViewController

/** 蓝牙设备 */
@property (nonatomic, strong) CBPeripheral *peripheral;

@property (nonatomic, strong) CBCentralManager *manager;

@end
