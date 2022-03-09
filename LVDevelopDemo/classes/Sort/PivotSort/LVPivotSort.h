//
//  LVPivotSort.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/8.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  快速排序

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVPivotSort : NSObject

#pragma mark - 快速排序
+ (void)sortBegin:(int)begin end:(int)end arr:(NSMutableArray *)array;

@end

NS_ASSUME_NONNULL_END
