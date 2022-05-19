//
//  LVArraySepController.m
//  LVDevelopDemo
//
//  Created by liucl on 2022/5/19.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVArraySepController.h"

@interface LVArraySepController ()

@end

@implementation LVArraySepController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arr = @[@1, @2, @3, @4, @5, @6, @7, @8, @9];
    [self sepArray:arr withCount:3];
}


- (void)sepArray:(NSArray *)array withCount:(NSInteger)count {
    if (array.count == 0) {
        return;
    }
    if (count >= array.count) {
        return;
    }
    
    NSMutableArray *totalArrM = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        NSNumber *num = array[i];
        if (i % count == 0) {
            NSMutableArray *arrM = [NSMutableArray array];
            [arrM addObject:num];
            [totalArrM addObject:arrM];
        } else {
            [totalArrM.lastObject addObject:num];
        }
    }
    [totalArrM enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
}

@end
