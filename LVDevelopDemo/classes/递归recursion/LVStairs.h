//
//  LVStairs.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/28.
//  Copyright © 2022 liuchunlao. All rights reserved.
//  跳台阶（上楼梯）
/**
 *  楼梯有n阶台阶，上楼可以一步上1阶，也可以一步上2阶，走完n阶台阶共有多少种不同的走？
 *    假设n阶台阶有f(n)种走法，第1步有2种走法
 *  如果上1阶，那就还剩下n-1阶，共有f(n-1)种走法
 *  如果上2阶，那就还剩下n-2阶，共有f(n-2)种走法
 *     所以f(n) = f(n-1) + f(n-2)
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVStairs : NSObject

/// 攀爬n个台阶的方法有多少种
/// @param n 台阶数量
/// return 共有多少种方法
+ (int)climbStairs:(int)n;

@end

NS_ASSUME_NONNULL_END
