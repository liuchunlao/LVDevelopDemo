//
//  LVDragViewController.m
//  LVDevelopDemo
//
//  Created by 刘春牢 on 15/6/27.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVDragViewController.h"
#import "UINavigationBar+Awesome.h"
#define NAVBAR_CHANGE_POINT (-64)
const CGFloat TopImgViewH = 250;

@interface LVDragViewController ()


@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation LVDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加图片控件
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, -TopImgViewH, self.tableView.width, TopImgViewH);
    imageView.image = [UIImage imageNamed:@"biaoqingdi"];
    
    // 重要：自适应填充图片模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView insertSubview:imageView atIndex:0];
    self.imageView = imageView;
    
    // 让tableView向下偏移，同时图片显示出来一半左右
    self.tableView.contentInset = UIEdgeInsetsMake(TopImgViewH * 0.5, 0, 0, 0);
    
    // 隐藏导航栏背景色
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    

}

#pragma mark - 导航栏相关
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    
    // 不设置会有一条黑色横线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}

#pragma mark - 监听tableView的拖拽
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
#pragma mark - 导航栏相关
//    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    UIColor *color = [UIColor whiteColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"offsetY = %f", offsetY);
    if (offsetY < -64) {
        CGFloat alpha = MIN(1, 1 - ((-64 - offsetY) / 64));
        NSLog(@"offsetY = %f, alpha = %f", offsetY, alpha);
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:1]];
    }
    
/************************************华丽的分割线************************************/
#pragma mark - 下拉放大相关
    // 拖动的距离
    CGFloat y = - (TopImgViewH * 0.5) - scrollView.contentOffset.y;
    
    if (y < 0) return;
    
    // 改变imageView的高度
    CGRect frame = self.imageView.frame;
    
    // 可以给y乘以任何系数来调整图片变化的速度
    frame.size.height = TopImgViewH + y;
    
    self.imageView.frame = frame;
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据--%zd", indexPath.row];
    
    return cell;
    
}




@end
