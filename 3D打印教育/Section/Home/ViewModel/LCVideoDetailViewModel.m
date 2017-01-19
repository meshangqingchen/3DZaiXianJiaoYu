
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

#import "KDFileManager.h"

#import "NSObject+Common.h"
#import "LCNotarizeOrderViewModel.h"

@interface LCVideoDetailViewModel ()
@property(nonatomic,strong) LCVideoDetailViewViewModel *videoDetailViewViewModel;
@end

@implementation LCVideoDetailViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
   
    [self setJoinFreeCourse:^(NSString *courseID) {
        MYLog(@"参加免费课程");
        @strongify(self);
        [self.netApi_Manager addFreeCourse:courseID CompleteHandle:^(id responseObj, NSError *error) {
            @strongify(self);
            NSDictionary *dic  =responseObj;
            NSString *msg = dic[@"msg"];
            if ([msg isEqualToString:@"添加成功"]) {
                //只有添加成功 才是第一次添加 所以这个时候是 应该让弹出键盘的允许用户评论的
                self.videoDetailViewViewModel.isAssess = 1;
            }
            [NSObject showWarning:msg];
        }];
    }];
    //收费的事假 生成订单
    [self setCreatOrder:^(NSString *couresID,NSString *price,NSURL *urlStr,NSString *title) {
        @strongify(self);
        
        [self.netApi_Manager creatOrderWith:couresID andPrice:price completeHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic = responseObj;
            if ([dic[@"status"] isEqualToNumber:@0]) {
                [NSObject showWarning:dic[@"msg"]];
            }else{
                NSDictionary *contents = dic[@"contents"];
                
                NSString *order_sn = contents[@"order_sn"];
                [KDFileManager saveUserData:order_sn forKey:LCCORDER_SN];
                LCNotarizeOrderViewModel *orderVM = [[LCNotarizeOrderViewModel alloc]initWithServices:self.navigationStackService params:@{@"couresID":couresID,
                                @"price":price,
                               @"urlStr":urlStr,
                            @"titleName":title,
                             @"order_sn":order_sn,
                               KEY_TITLE:@"确认订单"}];
                [self.navigationStackService pushViewModel:orderVM animated:YES];
            }
            [NSObject hideProgress];
        }];
    }];
    
    [self setCollectVideo:^(NSString *courseID, UIButton *collection_BT) {
        
        @strongify(self);
        
        if (self.videoDetailViewViewModel.ifCollected) {
            //已经收藏
            //删除收藏接口
            [self.netApi_Manager removeCollectWithOBJ:courseID andType:1 CompleteHandle:^(id responseObj, NSError *error) {
                NSDictionary *dic  =responseObj;
                NSString *msg = dic[@"msg"];
                if ([msg isEqualToString:@"取消收藏成功"]) { //ifCollected
                    collection_BT.selected = NO;
                    self.videoDetailViewViewModel.ifCollected = NO;
                }
            }];
        }else{
            //没有收藏
            //加入收藏接口
            [self.netApi_Manager addCollectWithOBJ:courseID andType:1 CompleteHandle:^(id responseObj, NSError *error) {
                @strongify(self);
                NSDictionary *dic  =responseObj;
                NSString *msg = dic[@"msg"];
                if ([msg isEqualToString:@"收藏成功"]) { //ifCollected
                    collection_BT.selected = YES;
                    [NSObject showWarning:msg];
                    self.videoDetailViewViewModel.ifCollected = YES;
                }
            }];
        }
    }];
    
    //都让弹出键盘
    [self setPinglunVideo:^(NSString *courseID) {
        @strongify(self)
        !self.popLcInputAccessoryView ? : self.popLcInputAccessoryView(courseID);
    }];
    //发送评论
    [self setSendPingLun:^(NSString *courseID,NSString* des,int garde) {
       @strongify(self)
        if (des.length == 0 | des == nil) {
            [NSObject showWarning:@"评论内容不能为空"];
            return ;
        }
       [self.netApi_Manager evaluateCourse:courseID andGrade:garde andDes:des CompleteHandle:^(id responseObj, NSError *error) {
           NSDictionary *dic  =responseObj;
           NSString *msg = dic[@"msg"];
           [NSObject showWarning:msg];
       }];
    }];

    //网络
    [self setNetworkRequests:^(NSString *planID) {
        @strongify(self)
        MYLog(@"=== === %@",planID);
        [self.netApi_Manager courseDetailWithPlanld:planID CompleteHandle:^(id responseObj, NSError *error) {
            LCHomeDetailModel *homeDetailModel = [LCHomeDetailModel parseJSON:responseObj];
            !self.chuanShuData ? : self.chuanShuData(homeDetailModel);
            
            
            LCVideoDetailViewViewModel *videoDetailViewViewModel = [[LCVideoDetailViewViewModel alloc]initWithViewModel:homeDetailModel];
            self.videoDetailViewViewModel = videoDetailViewViewModel;
            videoDetailViewViewModel.collectVideo = self.collectVideo;
            videoDetailViewViewModel.pinglunVideo = self.pinglunVideo;
            videoDetailViewViewModel.joinFreeCourse = self.joinFreeCourse;
            videoDetailViewViewModel.creatOrder = self.creatOrder;
            !self.bindViewModel ? : self.bindViewModel(videoDetailViewViewModel);
        }];
        //经过网络请求 得到数据 再回调数据给收藏按钮神马的赋值状态
    }];
}
@end
