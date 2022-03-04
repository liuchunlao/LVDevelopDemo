//
//  LVSelectionSort.h
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVSelectionSort : NSObject
#pragma mark - 选择排序
// 找出最大的元素，与最后一个交换位置！
// 忽略最后一个元素，从其他元素中找出最大的元素，与倒数第二位交换位置
// 依次类推，直到交换完毕所有元素
- (void)selectionSort:(NSMutableArray *)array;
@end

NS_ASSUME_NONNULL_END
