//
//  LVInsertSort.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  插入排序

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVInsertSort : NSObject
/**
 * 二分查找法优化！
 */
+ (void)insertSort2:(NSMutableArray *)array;

#pragma mark - 插入排序 优化
/**
 * 1、执行过程中，将序列分为2部分，头部是已经排好序的，尾部是待排序的。
 * 2、从头开始扫描每一个元素，>1 先讲待插入的元素备份  >2 头部有序数据中比待插入元素的大的，都向尾部挪动一位  >3 将待插入元素放入合适位置
 */
+ (void)insertSort1:(NSMutableArray *)array;

#pragma mark - 插入排序
/**
 * 1、执行过程中，将序列分为2部分，头部是已经排好序的，尾部是待排序的。
 * 2、从头开始扫描每一个元素，每当扫描到一个元素，就将它插入到头部合适位置，使得头部序列依然是有序的
 */
+ (void)insertSort:(NSMutableArray *)array;
@end

NS_ASSUME_NONNULL_END
