//
//  LVDragViewController.m
//  LVDevelopDemo
//
//  Created by 刘春牢 on 15/6/27.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVDragViewController.h"

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
//    [self.tableView addSubview:imageView];
    [self.tableView insertSubview:imageView atIndex:0];
    self.imageView = imageView;
    
    // 让tableView向下偏移，同时图片显示出来一半左右
    self.tableView.contentInset = UIEdgeInsetsMake(TopImgViewH * 0.5, 0, 0, 0);

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


#pragma mark - 监听tableView的拖拽
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    // 拖动的距离
    CGFloat y = - (TopImgViewH * 0.5) - scrollView.contentOffset.y;

    if (y < 0) return;
    
    // 改变imageView的高度
    CGRect frame = self.imageView.frame;
    
    // 可以给y乘以任何系数来调整图片变化的速度
    frame.size.height = TopImgViewH + y;
    
    self.imageView.frame = frame;
    

}

@end
