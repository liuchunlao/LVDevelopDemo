//
//  LVSelectionSort.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVSelectionSort.h"

@implementation LVSelectionSort

#pragma mark - 选择排序
// 找出最大的元素，与最后一个交换位置！
// 忽略最后一个元素，从其他元素中找出最大的元素，与倒数第二位交换位置
// 依次类推，直到交换完毕所有元素
- (void)selectionSort:(NSMutableArray *)array {
    
    for (int end = (int)array.count - 1; end > 0; end--) {
        int maxIdx = 0;
        for (int begin = 1; begin <= end; begin++) {
            if ([array[maxIdx] intValue] <= [array[begin] intValue]) {
                maxIdx = begin;
            }
        }
        // 将最大值，与最后一位交换位置
        NSNumber *tmp = array[end];
        array[end] = array[maxIdx];
        array[maxIdx] = tmp;
        NSLog(@"%@", array);
    }
}

@end
