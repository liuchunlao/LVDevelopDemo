//
//  LVBubbleSort.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVBubbleSort.h"

@implementation LVBubbleSort

#pragma mark - 冒泡排序 优化
// 如果序列尾部已经局部有序，可以记录最后一次交换的位置，减少交换次数！
- (void)bubbleSort:(NSMutableArray<NSNumber *> *)array {
    // 4个   3
    for (int end = (int)array.count - 1; end > 0; end--) {
        NSLog(@"end==%d", end);
        int sortedIdx = 1;
        for (int begin = 1; begin < end; begin++) {
            if ([array[begin] intValue] <= [array[begin - 1] intValue]) {
                
                NSNumber *tmp = array[begin];
                array[begin] = array[begin - 1];
                array[begin - 1] = tmp;
                
                sortedIdx = begin;
                NSLog(@"==%d", sortedIdx);
            }
        }
        end = sortedIdx;
    }
}


#pragma mark - 冒泡排序 优化，如果不再交换，则停止冒泡
- (void)bubbleSort3:(NSMutableArray<NSNumber *> *)array {
    for (int i = 0; i < array.count; i++) {
        int a = [array[i] intValue];
        BOOL sorted = YES;
        for (int j = i + 1; j < array.count; j++) {
            int b = [array[j] intValue];
            NSLog(@"前 %@", array);
            NSLog(@"i:%d j:%d", i, j);
            if (a > b) {
                NSNumber *tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
                sorted = NO;
            }
            NSLog(@"后 %@", array);
            if (sorted) break;
        }
    }
}


#pragma mark - 冒泡排序，普通交换
- (void)bubbleSort2:(NSMutableArray<NSNumber *> *)array {
    for (int i = 0; i < array.count; i++) {
        int a = [array[i] intValue];
        for (int j = i + 1; j < array.count; j++) {
            int b = [array[j] intValue];
            if (a > b) {
                NSNumber *tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
    }
}

#pragma mark - 冒泡排序1 经典 交换！
- (void)bubbleSort1:(NSMutableArray<NSNumber *> *)array {
    
    for (int end = (int)array.count - 1; end > 0; end--) {
        for (int begin = 1; begin <= end; begin++) {
            if ([array[begin] intValue] < [array[begin-1] intValue]) {
                NSNumber *tmp = array[begin];
                array[begin] = array[begin - 1];
                array[begin - 1] = tmp;
            }
        }
    }
    NSLog(@"%@", array);
}
@end
