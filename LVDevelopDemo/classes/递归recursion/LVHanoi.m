//
//  LVHanoi.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/28.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVHanoi.h"

@implementation LVHanoi

+ (void)hanoiCount:(int)n from:(NSString *)p1 through:(NSString *)p2 to:(NSString *)p3 {
    if (n == 1) {
        [self moveIndex:n from:p1 to:p3];
        return;
    }
    [self hanoiCount:n - 1 from:p1 through:p3 to:p2];
    [self moveIndex:n from:p1 to:p3];
    [self hanoiCount:n - 1 from:p2 through:p1 to:p3];
}

+ (void)moveIndex:(int)no from:(NSString *)from to:(NSString *)to {
    NSLog(@"将%d从%@号盘子移动到%@号盘子", no, from, to);
}
@end
