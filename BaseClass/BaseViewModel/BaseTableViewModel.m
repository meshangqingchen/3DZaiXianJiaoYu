//
//  BaseTableViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@implementation BaseTableViewModel
-(void)initialize{
    [super initialize];
    self.shouldPullToRefresh = NO;
    self.shouldInfiniteScrolling = NO;
    self.mutableDataArr = [NSMutableArray array];
    self.dataSource = [NSArray array];
    self.curpage = 1;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{}
@end
