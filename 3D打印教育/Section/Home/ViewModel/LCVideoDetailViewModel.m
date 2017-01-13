
//  LCVideoDetailViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailViewModel.h"
#import "LCVideoDetailViewViewModel.h"
#import "LCCourseDownLoadViewModel.h" //下载列表 课程下载
#import "LCHomeDetailModel.h"

#import "NSObject+Common.h"
@implementation LCVideoDetailViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
   
    [self setJoinFreeCourse:^(NSString *courseID) {
        MYLog(@"参加免费课程");
        @strongify(self);
        [self.netApi_Manager addFreeCourse:courseID CompleteHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic  =responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];
        }];
    }];
    
    [self setCollectVideo:^(NSString *courseID, UIButton *collection_BT) {
        MYLog(@"收藏");
        @strongify(self);
        [self.netApi_Manager addCollectWithOBJ:courseID andType:1 CompleteHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic  =responseObj;
            NSString *msg = dic[@"msg"];
            if ([msg isEqualToString:@"收藏成功"]) {
                collection_BT.selected = YES;
            }
            
        }];
    }];
    
    [self setPinglunVideo:^(NSString *courseID) {
        MYLog(@"评论");
        @strongify(self)
        !self.popLcInputAccessoryView ? : self.popLcInputAccessoryView(courseID);
    }];

    
    //网络
    [self setNetworkRequests:^(NSString *planID) {
        @strongify(self)
        MYLog(@"=== === %@",planID);
        [self.netApi_Manager courseDetailWithPlanld:@"6" CompleteHandle:^(id responseObj, NSError *error) {
            LCHomeDetailModel *homeDetailModel = [LCHomeDetailModel parseJSON:responseObj];

            MYLog("%@",homeDetailModel);
            MYLog("%@",homeDetailModel);
            MYLog("%@",homeDetailModel);
//            //这个是课程的简介
//            LCVideoDetailContents *videoDetailContents = homeDetailModel.contents;
//            //这个是课程中视频的数组
//            NSArray<LCVideoDetailVideolist *> *videoList = videoDetailContents.videoList;
//            LCVideoDetailTeacher *teacher = videoDetailContents.teacher;
            
            !self.chuanShuData ? : self.chuanShuData(homeDetailModel);
            
            
            LCVideoDetailViewViewModel *videoDetailViewViewModel = [[LCVideoDetailViewViewModel alloc]initWithViewModel:homeDetailModel];
            
            videoDetailViewViewModel.collectVideo = self.collectVideo;
            videoDetailViewViewModel.pinglunVideo = self.pinglunVideo;
            videoDetailViewViewModel.joinFreeCourse = self.joinFreeCourse;
            !self.bindViewModel ? : self.bindViewModel(videoDetailViewViewModel);
            
        }];
        //经过网络请求 得到数据 再回调数据给收藏按钮神马的赋值状态
    }];
}
@end
