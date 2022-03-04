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
    NSMutableArray *arr = @[@1, @3, @2, @8, @6, @34, @20, @12].mutableCopy;
    [self insertSort2:arr];
    NSLog(@"%@", arr);
}


#pragma mark - 插入排序 优化
/**
 * 二分查找法优化！
 */
- (void)insertSort2:(NSMutableArray *)array {
 
    for (int begin = 1; begin < array.count; begin++) {
        
        int cur = begin;
        NSNumber *tmp = array[cur];
        // 使用二分查找法找到元素的合适位置
        int dest = [self searchArray:array index:cur];
        NSLog(@"%d", dest);
        for (int i = cur; i > dest; i--) {
            array[i] = array[i - 1];
        }
        array[dest] = tmp;
        NSLog(@"%@", array);
    }
}

- (int)searchArray:(NSMutableArray *)array index:(int)idx {
    
    int begin = 0;
    int end = idx;
    
    int destValue = [array[idx] intValue];
    while (begin < end) {
        // 动态修改mid值
        int mid = (begin + end) >> 1;
        int midValue = [array[mid] intValue];
        if (destValue < midValue) {
            end = mid;
        } else if (destValue > midValue) {
            begin = mid + 1;
        }
    }
    // 未找到，就在起始位置
    return begin;
}



@end
