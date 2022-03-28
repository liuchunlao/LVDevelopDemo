//
//  LVOpenFlashViewController.m
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/5/15.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVOpenFlashViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LVOpenFlashViewController ()

@property (weak, nonatomic) IBOutlet UIButton *openBtn;

@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

- (IBAction)open:(UIButton *)sender;

- (IBAction)close:(UIButton *)sender;

@property (nonatomic,strong) AVCaptureSession * captureSession;
@property (nonatomic,strong) AVCaptureDevice * captureDevice;


@end

@implementation LVOpenFlashViewController

#pragma mark - 懒加载
- (AVCaptureDevice *)captureDevice {
    if (!_captureDevice) {
        _captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    return _captureDevice;
}

- (AVCaptureSession *)captureSession {
    if (!_captureSession) {
        _captureSession = [[AVCaptureSession alloc] init];
    }
    return _captureSession;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.openBtn.layer.cornerRadius = 20;
    self.closeBtn.layer.cornerRadius = 20;
    
    AVCaptureDeviceInput *deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:self.captureDevice error:nil];
    if ([self.captureSession canAddInput:deviceInput]) {
        // 必须真机环境才可以添加
        [self.captureSession addInput:deviceInput];
    } else {
        NSLog(@"不可以");
    }
    
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    [self.captureSession addOutput:output];
}

#pragma mark - 打开闪光灯
- (IBAction)open:(UIButton *)sender {
    NSLog(@"打开");
    AVCaptureDevice *device = self.captureDevice;
      
  //修改前必须先锁定
  [self.captureDevice lockForConfiguration:nil];
  
  //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
  if ([self.captureDevice hasFlash]) {
      if (self.captureDevice.flashMode == AVCaptureFlashModeOff) {
          self.captureDevice.flashMode = AVCaptureFlashModeOn;
          self.captureDevice.torchMode = AVCaptureTorchModeOn;
      }
  }
  [device unlockForConfiguration];
    
}

#pragma mark - 关闭闪光灯
- (IBAction)close:(UIButton *)sender {
    NSLog(@"关闭");
    AVCaptureDevice *device = self.captureDevice;
      
    //修改前必须先锁定
    [self.captureDevice lockForConfiguration:nil];

    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if ([self.captureDevice hasFlash]) {
        if (self.captureDevice.flashMode == AVCaptureFlashModeOn) {
            self.captureDevice.flashMode = AVCaptureFlashModeOff;
            self.captureDevice.torchMode = AVCaptureTorchModeOff;
        }
    }
    [device unlockForConfiguration];
}

#pragma mark - 改变闪光灯的亮度
- (IBAction)changeFlashValue:(UISlider *)sender {

    // 如果闪光灯没有打开则返回
    if (![self.captureSession isRunning]) return;
    
    [self.captureSession beginConfiguration];
    [self.captureDevice lockForConfiguration:nil];
    
    CGFloat torchLevel = sender.value;
    if (torchLevel > 0) { // 不能设置为0
        [self.captureDevice setTorchModeOnWithLevel:sender.value error:NULL];
    }
    
    [self.captureDevice unlockForConfiguration];
    [self.captureSession commitConfiguration];
}



@end
