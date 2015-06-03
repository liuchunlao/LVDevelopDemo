//
//  LVEncryptionTool.m
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/6/3.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVEncryptionTool.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation LVEncryptionTool

// 加密
+ (NSData *)AES256EncryptData:(NSData *)originalData WithKey:(NSString *)key {
    
    // key should be 32 bytes for AES256, will be null otherwise
    
    char keyPtr[kCCKeySizeAES256 + 1]; // room for terminator(unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes(for padding) // fetch key data
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [originalData length];
    // see the doc: for block ciphers, the output size will always be less than or
    // equal to the input size plus the size of one block
    // that's why we need to add the size of one block here
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES256, NULL /* initialization vector(optional) */, [originalData bytes], dataLength, /* input */buffer, bufferSize, /* utput */ &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        // the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer); // free the buffer
    return nil;
}

// 解密
+ (NSData *)AES256DecryptData:(NSData *)secretData WithKey:(NSString *)key {
    
    // key should be 32 bytes for AES256, will be null otherwise
    
    char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding) //fetch key data
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding]; NSUInteger dataLength =[secretData length];
    // See the doc: For block ciphers, the output size will always be less than or
    // equal to the input size plus the size of one block.
    // That's why we need to add the size of one block here
    size_t bufferSize = dataLength +kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding, keyPtr, kCCKeySizeAES256, NULL /*initialization vector (optional) */, [secretData bytes], dataLength, /*input */buffer, bufferSize, /*output */&numBytesDecrypted);
    
    if(cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return[NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}


@end
