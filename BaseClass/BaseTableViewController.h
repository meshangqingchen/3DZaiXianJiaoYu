//
//  BaseTableViewController.h
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewController.h"
#import <UIScrollView+EmptyDataSet.h>
@interface BaseTableViewController : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetDelegate,
DZNEmptyDataSetSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;
@end
