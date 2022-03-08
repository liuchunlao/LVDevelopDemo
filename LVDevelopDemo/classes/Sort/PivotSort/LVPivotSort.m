//
//  LVPivotSort.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/8.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVPivotSort.h"

@implementation LVPivotSort


#pragma mark - 快速排序
+ (void)sortBegin:(int)begin end:(int)end arr:(NSMutableArray *)array {
    if (end - begin < 2) {
        return;
    }
    
    // 确定轴点位置
    int mid = [self pivotIndexBegin:begin end:end arr:array];
    // 对子序列进行快速排序
    [self sortBegin:begin end:mid arr:array];
    [self sortBegin:mid + 1 end:end arr:array];
}

#pragma mark - 计算轴点位置
+ (int)pivotIndexBegin:(int)begin end:(int)end arr:(NSMutableArray *)array {
    // 1.备份轴点元素
    NSNumber *v = array[begin];
    end--;
    while (begin < end) {
        while (begin < end) {
            if (v.intValue < [array[end] intValue]) { // 右边元素 > 轴点元素
                end--;
            } else {
                // 右边元素 <= 轴点元素
                array[begin++] = array[end];
                break;
            }
        }
        while (begin < end) {
            if (v.intValue > [array[begin] intValue]) { // 左边元素 < 轴点元素
                begin++;
            } else {
                array[end--] = array[begin];
                break;
            }
        }
    }
    
    array[begin] = v;
    return begin;
}
@end
