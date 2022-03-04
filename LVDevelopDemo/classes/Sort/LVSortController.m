//
//  LVSortController.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVSortController.h"

@interface LVSortController ()

@property (nonatomic, assign) int count;

@end

@implementation LVSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableArray *arr = @[@1, @2, @3, @5, @7, @8, @11, @20].mutableCopy;
    [self insertSort2:arr];
    NSLog(@"位置是%@", arr);
}


#pragma mark - 插入排序 优化
/**
 * 二分查找法优化！
 */
- (void)insertSort2:(NSMutableArray *)array {
 
    for (int begin = 1; begin < array.count; begin++) {
        
        // 将begin位置的元素插入到合适位置！
        
        
        
//        int cur = begin;
//        NSNumber *tmp = array[cur];
//        NSLog(@"%@ 前%@",tmp, array);
//        while (cur > 0 && [tmp intValue] < [array[cur - 1] intValue]) {
//            array[cur] = array[cur-1];
//            cur--;
//            NSLog(@"后%@", array);
//        }
//        array[cur] = tmp;
    }
    
}



@end
