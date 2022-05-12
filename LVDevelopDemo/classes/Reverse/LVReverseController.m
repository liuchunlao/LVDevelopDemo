//
//  LVReverseController.m
//  LVDevelopDemo
//
//  Created by liucl on 2022/5/12.
//  Copyright © 2022 liuchunlao. All rights reserved.
//

#import "LVReverseController.h"

@interface LVReverseController ()

@property (weak, nonatomic) IBOutlet UITextField *fld;

@end

@implementation LVReverseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)reverseBtnClick:(id)sender {
    
    _fld.text = [self reverseStr:_fld.text];
}

- (NSString *)reverseStr:(NSString *)str {
    if (str.length == 0) {
        return @"";
    }
    NSArray<NSString *> *arr = [str componentsSeparatedByString:@" "];
    NSMutableString *strM = [NSMutableString string];
    for (NSInteger i = arr.count - 1; i >= 0; i--) {
        [strM appendString:arr[i]];
        if (i != 0) {
            [strM appendString:@" "];
        }
    }
    return strM;
}



@end
