//
//  LVMergeSort.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/7.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVMergeSort.h"

@implementation LVMergeSort

#pragma mark - 归并排序
+ (void)mergeSortBegin:(int)begin end:(int)end array:(NSMutableArray *)array {
    if (end - begin < 2) return;
    int mid = (begin + end) >> 1;
    
    [self mergeSortBegin:begin end:mid array:array];
    [self mergeSortBegin:mid end:end array:array];
    
    [self mergeBegin:begin end:end mid:mid array:array];
}

+ (void)mergeBegin:(int)begin end:(int)end mid:(int)mid array:(NSMutableArray *)array {
    
    // 左侧数组 基于leftArray
    int li = 0, le = mid - begin;
    // 右侧数组 基于总数组array
    int ri = mid, re = end;
    
    // 拷贝左侧数组到leftArray
    NSMutableArray *leftArray = [NSMutableArray array];
    for (int i = li; i < le; i++) {
        leftArray[i] = array[begin + i];
    }
    
    int ai = begin;
    // 左侧数组未遍历技术，一直遍历
    while (li < le) {
        if (ri < re && [array[ri] intValue] < [leftArray[li] intValue]) {
            // 拷贝右侧数组到总数组
//            _arr[ai] = self.arr[ri];
//            ai++;
//            ri++;
            array[ai++] = array[ri++];
        } else {
            // 拷贝左侧数组到总数组
            array[ai++] = leftArray[li++];
        }
    }
}

@end
