//
//  LVBubbleSort.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  冒泡排序

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVBubbleSort : NSObject

#pragma mark - 冒泡排序 优化
// 如果序列尾部已经局部有序，可以记录最后一次交换的位置，减少交换次数！
+ (void)bubbleSort:(NSMutableArray<NSNumber *> *)array;

#pragma mark - 冒泡排序 优化，如果不再交换，则停止冒泡
+ (void)bubbleSort3:(NSMutableArray<NSNumber *> *)array;

#pragma mark - 冒泡排序，普通交换
+ (void)bubbleSort2:(NSMutableArray<NSNumber *> *)array;
#pragma mark - 冒泡排序1 经典 交换！
+ (void)bubbleSort1:(NSMutableArray<NSNumber *> *)array;
@end

NS_ASSUME_NONNULL_END
