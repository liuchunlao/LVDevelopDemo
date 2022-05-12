//
//  LVZipController.m
//  LVDevelopDemo
//
//  Created by liucl on 2022/5/12.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVZipController.h"

@interface CElement : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, assign) NSInteger count;

@end

@implementation CElement


@end

@interface LVZipController ()

@property (weak, nonatomic) IBOutlet UITextField *fld;

@end

@implementation LVZipController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)zipAction:(id)sender {
    _fld.text = [self zipStr:_fld.text];
}

- (IBAction)unzipAction:(id)sender {
    _fld.text = [self unzipStr:_fld.text];
}


- (NSString *)zipStr:(NSString *)str {
    if (str.length == 0) {
        return @"";
    }
    
    NSString *beginStr = [str substringWithRange:NSMakeRange(0, 1)];
    NSInteger count = 1;
    
    NSMutableString *strM = [NSMutableString string];
    for (int i = 1; i < str.length; i++) {
        NSString *cur = [str substringWithRange:NSMakeRange(i, 1)];
        if ([beginStr isEqualToString:cur]) {
            count++;
            if (i + 1 == str.length) {
                [strM appendFormat:@"%@%zd", beginStr, count];
            }
            continue;
        }
        [strM appendFormat:@"%@%zd", beginStr, count];
        beginStr = cur;
        count = 1;
    }
    
    return strM;
}

- (NSString *)unzipStr:(NSString *)str {
    if (str.length == 0) {
        return @"";
    }
    
    NSMutableString *countStr = [NSMutableString string];
    NSString *key = [str substringWithRange:NSMakeRange(0, 1)];;
    
    NSMutableArray<CElement *> *arrM = [NSMutableArray array];
    for (int i = 1; i < str.length; i++) {
        NSString *cur = [str substringWithRange:NSMakeRange(i, 1)];
        
        if ([self isPurelnt:cur]) {
            [countStr appendFormat:@"%@", cur];
            NSLog(@"%@", countStr);
            if (i + 1 == str.length) {

                CElement *model = [[CElement alloc] init];
                model.key = key;
                model.count = countStr.integerValue;
                [arrM addObject:model];
            }
            continue;
        }
        CElement *model = [[CElement alloc] init];
        model.key = key;
        model.count = countStr.integerValue;
        countStr = [NSMutableString string];
        key = cur;
        [arrM addObject:model];
    }
    
    NSMutableString *strM = [NSMutableString string];
    [arrM enumerateObjectsUsingBlock:^(CElement * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        for (int i = 0; i < obj.count; i++) {
            [strM appendString:obj.key];
        }
    }];
    return strM;
}

- (BOOL)isPurelnt:(NSString *)str {
    NSScanner *scanner = [NSScanner scannerWithString:str];
    int val;
    return ([scanner scanInt:&val] && [scanner isAtEnd]);
}


@end
