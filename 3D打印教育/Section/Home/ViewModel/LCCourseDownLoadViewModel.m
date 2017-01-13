//
//  LCCourseDownLoadViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseDownLoadViewModel.h"
#import "LCCourseDownLoadCellViewModel.h"
@implementation LCCourseDownLoadViewModel
-(void)initialize{
    [super initialize];
    
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    //请求数据..
    LCCourseDownLoadCellViewModel *courseDownLoadCellVM = [[LCCourseDownLoadCellViewModel alloc]initWithModel:nil];
    courseDownLoadCellVM.title = @"我是第1个title";
    courseDownLoadCellVM.downLoadState = DownloadStateCompleted;
    
    LCCourseDownLoadCellViewModel *courseDownLoadCellVM1 = [[LCCourseDownLoadCellViewModel alloc]initWithModel:nil];
    courseDownLoadCellVM1.title = @"我是第2个title";
    courseDownLoadCellVM1.downLoadState = DownloadStateNoCompleted;
    
    LCCourseDownLoadCellViewModel *courseDownLoadCellVM2 = [[LCCourseDownLoadCellViewModel alloc]initWithModel:nil];
    courseDownLoadCellVM2.title = @"我是第3个title";
    courseDownLoadCellVM2.downLoadState = DownloadStateCompleted;
    
    LCCourseDownLoadCellViewModel *courseDownLoadCellVM3 = [[LCCourseDownLoadCellViewModel alloc]initWithModel:nil];
    courseDownLoadCellVM3.title = @"我是第4个title";
    courseDownLoadCellVM3.downLoadState = DownloadStateNoCompleted;
    
    [self.mutableDataArr addObjectsFromArray:@[courseDownLoadCellVM,courseDownLoadCellVM1,courseDownLoadCellVM2,courseDownLoadCellVM3,courseDownLoadCellVM,courseDownLoadCellVM1,courseDownLoadCellVM2,courseDownLoadCellVM3,courseDownLoadCellVM,courseDownLoadCellVM1,courseDownLoadCellVM2,courseDownLoadCellVM3,courseDownLoadCellVM,courseDownLoadCellVM1,courseDownLoadCellVM2,courseDownLoadCellVM3]];
    self.dataSource = self.mutableDataArr.copy;
    !self.headerViewBindViewModel ? : self.headerViewBindViewModel(@"给headerView传递数据");

    
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}
@end
