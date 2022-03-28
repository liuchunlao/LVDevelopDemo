//
//  LVStairs.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/28.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVStairs.h"

@implementation LVStairs

#pragma mark - 基本实现
//+ (int)climbStairs:(int)n {
//    if(n <= 2) return n;
//    return [self climbStairs:n - 1] + [self climbStairs:n - 2];
//}

#pragma mark - 优化
+ (int)climbStairs:(int)n {
    if(n <= 2) return n;
    
    int first = 1;
    int second = 2;
    for (int i = 3; i <= n; i++) {
        second = first + second;
        first = second - first;
    }
    return second;
}
@end
