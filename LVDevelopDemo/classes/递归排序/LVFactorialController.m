//
//  LVFactorialController.m
//  LVDevelopDemo
//
//  Created by liucl on 2022/5/12.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVFactorialController.h"

@interface LVFactorialController ()

@property (weak, nonatomic) IBOutlet UITextField *fld;


@end

@implementation LVFactorialController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)sortClick:(id)sender {
    NSString *info = _fld.text;
    if (![info containsString:@","]) {
        NSLog(@"格式必须是数字并以逗号隔开");
    }
    
    NSArray *arr = [info componentsSeparatedByString:@","];
    NSMutableArray *arrM = arr.mutableCopy;
    [self quickSortArray:arrM withLeftIndex:0 andRightIndex:arr.count - 1];
    NSMutableString *strM = [NSMutableString string];
    [arrM enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendString:obj.description];
        if (idx != arrM.count - 1) {
            [strM appendString:@","];
        }
    }];
    _fld.text = strM;
}

- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex {
    if (leftIndex >= rightIndex) { // 如果数组长度为0或1时返回
        return ;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    NSInteger key = [array[i] integerValue]; // 记录比较基准数
    
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) { // 如果比基准数大，继续查找
            j--;
        }
        // 如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) { // 如果比基准数小，继续查找
            i++;
        }
        // 如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
        
    }
    
    // 将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    // 排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    // 排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}


@end
