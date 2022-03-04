//
//  LVBinarySearch.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  二分查找法

#import "LVBinarySearch.h"

@implementation LVBinarySearch

#pragma mark - 二分搜索排序
// 如何确定元素在数组中的位置！
// 无序数组，遍历每一个元素进行比较 平均时间复杂度O(n)
// 有序数组，可以使用二分搜索，最坏时间复杂度：O(logN)
+ (int)binarySearch:(NSMutableArray *)array value:(int)v {
    
    int begin = 0;
    int end = (int)array.count;
    while (begin < end) {
        int mid = (begin + end) >> 1;
        if (v < [array[mid] intValue]) {
            end = mid;
        } else if (v > [array[mid] intValue]) {
            begin = mid + 1;
        } else {
            return mid;
        }
    }
    NSLog(@"未找到");
    return -1;
}


@end
