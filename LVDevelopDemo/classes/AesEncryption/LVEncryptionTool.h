//
//  LVEncryptionTool.h
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/6/3.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVEncryptionTool : NSObject

/**
 *  加密
 *
 *  @param originalData 原始数据
 *  @param key  密钥
 *
 *  @return 返回加密后的数据
 */
+ (NSData *)AES256EncryptData:(NSData *)originalData WithKey:(NSString *)key;


/**
 *  解密数据
 *
 *  @param secretData 用于解密的数据
 *  @param key        密钥
 *
 *  @return 返回解密后的数据
 */
+ (NSData *)AES256DecryptData:(NSData *)secretData WithKey:(NSString *)key;

@end
