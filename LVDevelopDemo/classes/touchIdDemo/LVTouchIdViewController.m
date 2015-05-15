//
//  LVTouchIdViewController.m
//  LVDevelopDemo
//
//  Created by PBOC CS on 15/5/8.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//
/**
 *  注意：
 *  1.需要导入LocalAuthentication.framework。
 *  2.iOS8以后才支持的功能。
 *  3.参考资料：http://blog.csdn.net/pucker/article/details/43410585 swift版本
 */

#import "LVTouchIdViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface LVTouchIdViewController ()

@property (nonatomic, strong) LAContext *context;

@property (nonatomic, strong) UIViewController *testVc;

@end

@implementation LVTouchIdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"开启指纹识别" forState:UIControlStateNormal];
    btn.width = self.view.width;
    btn.height = 50;
    btn.x = 0;
    btn.y = 100;
    btn.backgroundColor = [UIColor greenColor];
    btn.layer.cornerRadius = 20;
    [self.view addSubview:btn];
    
    [btn addTarget: self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)click:(UIButton *)btn {
    
    LAContext *authentication = [[LAContext alloc] init];
    NSError *error = nil;
    
    // 1.检查指纹识别是否可用
    BOOL isAviailable = [authentication canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    
    NSLog(@"%@", error);
    if (isAviailable) {
        NSLog(@"指纹识别可以使用");
        
        // 2.获取指纹验证结果
        [authentication evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证已有指纹" reply:^(BOOL success, NSError *error) {
            if (success) {
                NSLog(@"指纹验证成功");
                
                // 登录 演示
                [self loginDemo];
                
            } else {
                
                // 验证3次错误则被锁定 5次错误后需要输入密码
                NSLog(@"指纹验证失败%@", error);
            }
        }];
        
    } else {
        NSLog(@"抱歉，指纹识别不可用");
    }
    
}

- (void)loginDemo {
    UIViewController *testVc = [[UIViewController alloc] init];
    testVc.view.backgroundColor = [UIColor yellowColor];
    testVc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.testVc = testVc;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:testVc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void)close {
    [self.testVc dismissViewControllerAnimated:YES completion:nil];
}


@end
