//
//  LVSortController.m
//  LVDevelopDemo
//
//  Created by next on 2022/3/4.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVSortController.h"
#import "LVMergeSort.h"

@interface LVSortController ()

@property (nonatomic, assign) int count;

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation LVSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.arr = @[@1, @3, @2, @8, @6, @18, @20, @12].mutableCopy;
    
    int begin = 0;
    int end = (int)self.arr.count;
    [LVMergeSort mergeSortBegin:begin end:(int)end array:self.arr];
    
    NSLog(@"%@", self.arr);
}




@end
