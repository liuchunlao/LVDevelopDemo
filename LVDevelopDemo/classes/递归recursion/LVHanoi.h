//
//  LVHanoi.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/28.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  _递归练习_汉诺塔
// 编程实现把A的n个盘子移动到C 盘子编号[1, n]
// 每次只移动一个盘子
// 大盘子只能放到小盘子下面
/**
 *  分2种情况
 *  当 n == 1 时，直接从A移动到C
 *  当 n > 1 时，可以拆分为3大步骤
 *  1、 将 n-1 个盘子从A移动到B
 *  2、 将编号为 n 的盘子从A移动到C
 *  3、 将  n-1 个盘子从B移动到C
 *  步骤1、3明显是个递归调用
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVHanoi : NSObject

+ (void)hanoiCount:(int)n from:(NSString *)p1 through:(NSString *)p2 to:(NSString *)p3;

@end

NS_ASSUME_NONNULL_END
