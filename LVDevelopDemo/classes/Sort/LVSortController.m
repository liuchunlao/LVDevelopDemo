//
//  LVSortController.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVSortController.h"
#import "LVPivotSort.h"
#import "LVHanoi.h"
#import "LVStairs.h"

@interface LVSortController ()

@property (nonatomic, assign) int count;

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation LVSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self climbStairs];

}

#pragma mark - 跳台阶
- (void)climbStairs {
    int count = [LVStairs climbStairs:10];
    NSLog(@"%@", @(count).description);
}

#pragma mark - 快速排序
- (void)pivotSort {
    self.arr = @[@1, @3, @9, @2, @8, @17].mutableCopy;
    [LVPivotSort sortBegin:0 end:(int)self.arr.count arr:_arr];
//
//    NSLog(@"%@", self.arr);
}

#pragma mark - 汉诺塔
- (void)hanoi {
    [LVHanoi hanoiCount:10 from:@"1" through:@"2" to:@"3"];
}


#pragma mark - 奇偶数分组
- (void)sortArr:(NSMutableArray *)array {
    
    int idx = -1;
    for (int i = 0; i < array.count; i++) {
        if (([array[i] intValue] % 2) == 0) {
            // 第一个偶数的位置
            idx = i;
            break;
        }
    }
    if (idx == -1) {
        NSLog(@"没有偶数");
        return;
    }
    NSLog(@"%d", idx);
    
    for (int j = idx + 1; j < array.count; j++) {
        if (([array[j] intValue] % 2) != 0) {
            // 碰到奇数 交换位置，并将索引 + 1  不稳定
//            NSNumber *tmp = array[idx];
//            array[idx] = array[j];
//            array[j] = tmp;
//            idx++;
            
            // 碰到奇数 将idx至j-1的位置数据后移一位。再将奇数赋值到idx位置。 稳定
            NSNumber *tmp = array[j];
            for (int k = j; k >= idx; k--) {
                array[k] = array[k - 1];
            }
            array[idx] = tmp;
        }
    }
}

@end



