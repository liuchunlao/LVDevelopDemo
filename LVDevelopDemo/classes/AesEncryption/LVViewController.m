//
//  LVViewController.m
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/6/3.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVViewController.h"

#import "LVEncryptionTool.h"

@interface LVViewController ()

@property (weak, nonatomic) IBOutlet UITextField *keyField;

@property (weak, nonatomic) IBOutlet UITextField *cipherField;

@property (weak, nonatomic) IBOutlet UILabel *originalDataLabel;

@property (weak, nonatomic) IBOutlet UILabel *secretDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@property (nonatomic, strong) NSData *secData;

@end

@implementation LVViewController

#pragma mark - 加密
- (IBAction)encryption {
    
    NSString *key = self.keyField.text;
    
    NSString *cipher = self.cipherField.text;
    
    if (!(key.length && cipher.length)) {
        NSLog(@"key、cipher都不能为空");
        return;
    }
    
    NSData *originalData = [NSData dataWithBytes:cipher.UTF8String length:cipher.length];
    NSLog(@"加密前的二进制数据: %@", originalData);
    
    NSData *secretData = [LVEncryptionTool AES256EncryptData:originalData WithKey:key];
    NSLog(@"加密后的二进制数据: %@", secretData);
    
    NSString *secStr = [[NSString alloc] initWithData:secretData encoding:NSUTF8StringEncoding];
    NSLog(@"加密后的字符串未解密前，打印为空: %@", secStr);
    
    self.secData = secretData;
}

#pragma mark - 解密
- (IBAction)decryption {
    
    NSString *key = self.keyField.text;

    NSData *decryptData = [LVEncryptionTool AES256DecryptData:self.secData WithKey:key];
    NSString *str = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];

    self.valueLabel.text = str;
    
    NSLog(@"解密后的字符串: %@", str);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
}



@end
