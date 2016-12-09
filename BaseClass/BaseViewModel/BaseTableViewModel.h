//
//  BaseTableViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseTableViewModel : BaseViewModel
@property(nonatomic,strong) NSArray *dataSource;
@property(nonatomic,strong) NSMutableArray *mutableDataArr;
@property (nonatomic, assign) NSUInteger page;// 每页有几条.
@property (nonatomic, assign) NSUInteger curpage;//第几页

/// 加 下拉刷新
@property (nonatomic, assign) BOOL shouldPullToRefresh;
/// 加 上拉加载
@property (nonatomic, assign) BOOL shouldInfiniteScrolling;

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView;

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void(^)(id responseObj))complete;

@end
