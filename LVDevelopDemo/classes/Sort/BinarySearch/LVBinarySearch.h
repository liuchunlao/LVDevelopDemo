//
//  LVBinarySearch.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  二分查找

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVBinarySearch : NSObject

#pragma mark - 二分查找法
/// 从数组中找到对应v的索引
/// 默认返回对应索引值， 未找到 返回 -1
+ (int)binarySearch:(NSMutableArray *)array value:(int)v;
@end

NS_ASSUME_NONNULL_END
