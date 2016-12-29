
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
@implementation LCVideoDetailViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    
    [self setDownLoadVideo:^(NSString *videoID) {
        MYLog(@"下载");
        @strongify(self)
        LCCourseDownLoadViewModel *downLoadVM = [[LCCourseDownLoadViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"课程下载"}];
        [self.navigationStackService pushViewModel:downLoadVM animated:YES];
    }];
    [self setShareVideo:^(NSString *videoID) {
        MYLog(@"分享");
    }];
    [self setCollectVideo:^(NSString *videoID, UIButton *collection_BT) {
        MYLog(@"收藏");
    }];
    [self setPinglunVideo:^(NSString *videoID) {
        MYLog(@"评论");
        @strongify(self)
        !self.popLcInputAccessoryView ? : self.popLcInputAccessoryView(videoID);
    }];
    [self setConsultVideo:^(NSString *videoID) {
        MYLog(@"资讯");
    }];
    
   [self setNetworkRequests:^(NSString *planID) {
        @strongify(self)
        MYLog(@"=== === %@",planID);
        [self.netApi_Manager courseDetailWithPlanld:planID CompleteHandle:^(id responseObj, NSError *error) {
            MYLog(@"%@",responseObj);
            LCHomeDetailModel *homeDetailModel = [LCHomeDetailModel parseJSON:responseObj];
            MYLog(@"mymymy");
            MYLog(@" === %@",homeDetailModel);
            MYLog(@" === %@",homeDetailModel);
            MYLog(@" === %@",homeDetailModel);
        }];
        
        //经过网络请求 得到数据 再回调数据给收藏按钮神马的赋值状态
        LCVideoDetailViewViewModel *videoDetailViewViewModel = [[LCVideoDetailViewViewModel alloc]initWithViewModel:@"model"];
        videoDetailViewViewModel.downLoadVideo = self.downLoadVideo;
        videoDetailViewViewModel.shareVideo    = self.shareVideo;
        videoDetailViewViewModel.collectVideo = self.collectVideo;
        videoDetailViewViewModel.pinglunVideo = self.pinglunVideo;
        videoDetailViewViewModel.consultVideo = self.consultVideo;
        !self.bindViewModel ? : self.bindViewModel(videoDetailViewViewModel);
    }];
}
@end
