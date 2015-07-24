//
//  LVSearchResultController.h
//  LVDevelopDemo
//
//  Created by liuchunlao on 15/7/24.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LVSearchResultController : UITableViewController <UISearchResultsUpdating>

@property (nonatomic, strong) NSArray *allData;

@end
