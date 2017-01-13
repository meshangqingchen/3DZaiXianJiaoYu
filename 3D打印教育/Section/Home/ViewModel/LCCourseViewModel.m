//
//  LCCourseViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//  评论

#import "LCCourseViewModel.h"
#import "LCHomeDetailModel.h"

#import "LCCourseCellViewModel.h"

//#import "LCCourseCellSonViewModel.h"
@implementation LCCourseViewModel
-(void)initialize{
    [super initialize];
    
    @weakify(self)
    [self setFromVideoVMGetData:^(id model) {
        @strongify(self)
        LCHomeDetailModel *homeDetailModel = model;
        NSArray<LCVideoDetailVideolist *> *videoList = homeDetailModel.contents.videoList;
        for (int i = 0; i<videoList.count; i++) {
            LCCourseCellViewModel *cellVM = [[LCCourseCellViewModel alloc]initWithModel:videoList[i]];
            [self.mutableDataArr addObject:cellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
        
    }];
}

//-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
//    
//    NSDictionary *dic = @{@"title":@"我是titleasd",@"url":@"1234567890"};
//    LCCourseCellViewModel *cellViewModel = [[LCCourseCellViewModel alloc]initWithModel:dic];
//    
//    NSDictionary *dic1 = @{@"title":@"我是titleasd",@"url":@"1234567890"};
//    LCCourseCellViewModel *cellViewModel1 = [[LCCourseCellViewModel alloc]initWithModel:dic1];
//    NSDictionary *dic2 = @{@"title":@"我是titleasd",@"url":@"1234567890"};
//    LCCourseCellViewModel *cellViewModel2 = [[LCCourseCellViewModel alloc]initWithModel:dic2];
//    NSDictionary *dic3 = @{@"title":@"我是titleasd",@"url":@"1234567890"};
//    LCCourseCellViewModel *cellViewModel3 = [[LCCourseCellViewModel alloc]initWithModel:dic3];
//    
//    [self.mutableDataArr addObjectsFromArray:@[cellViewModel,cellViewModel1,cellViewModel2,cellViewModel3]];
//    self.dataSource = self.mutableDataArr.copy;
//}
//
//-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
//
//}

@end
