//
//  LCEvaluateViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateViewModel.h"
#import "LCAssessListModel.h"  //原始数据

#import "LCSonEvaluateCellViewModel.h"
#import "LCEvaluateCellViewModel.h"

#import "LCEvaluateDetailViewModel.h"//评论详情 对评论的评论
#import "LCMySelfMainViewModel.h"    //点击头像进去 个人主页
@implementation LCEvaluateViewModel
-(void)initialize{
    [super initialize];
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
//    @weakify(self)
//    [self setHuifu:^(NSString *evaluateID) {
//        @strongify(self)
//        LCEvaluateDetailViewModel *evaluateDetailVM = [[LCEvaluateDetailViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"TITLE啊`"}];
//        [self.navigationStackService pushViewModel:evaluateDetailVM animated:YES];
//    }];
//    
//    [self setHeaderImageViewClick:^(NSString *evaluateUserID) {
//        @strongify(self)
//        LCMySelfMainViewModel *mySelfMainViewModel = [[LCMySelfMainViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"个人主页"}];
//        [self.navigationStackService pushViewModel:mySelfMainViewModel animated:YES];
//    }];
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
//    LCSonEvaluateCellViewModel *sonE1 = [[LCSonEvaluateCellViewModel alloc]initWithName:@"我是一只林中的小鸟1" and:@"我需要蓝天的怀抱,来不及祈祷就开始奔跑"];
//    LCSonEvaluateCellViewModel *sonE2 = [[LCSonEvaluateCellViewModel alloc]initWithName:@"我是一只林中的小鸟2" and:@"我需要蓝天的怀抱,来不及祈祷就开始奔跑"];
//    LCSonEvaluateCellViewModel *sonE3 = [[LCSonEvaluateCellViewModel alloc]initWithName:@"我是一只林中的小鸟3" and:@"我需要蓝天的怀抱,来不及祈祷就开始奔跑"];
//    
//    
//    
//    
//    
//    LCEvaluateCellViewModel *eval = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1,sonE2,sonE3,sonE1,sonE2,sonE3]];
//    eval.imgURL = nil;
//    eval.name = @"你全力以赴也打不败的男人";
//    eval.huifu = self.huifu;
//    eval.headerImageViewClick = self.headerImageViewClick;
//    
//    LCEvaluateCellViewModel *eval1 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1,sonE2,sonE3]];
//    eval1.imgURL = nil;
//    eval1.name = @"你全力以赴也打不败的男人";
//    eval1.huifu = self.huifu;
//    eval1.headerImageViewClick = self.headerImageViewClick;
//    
//    
//    LCEvaluateCellViewModel *eval2 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1,sonE2]];
//    eval2.imgURL = nil;
//    eval2.name = @"你全力以赴也打不败的男人";
//    eval2.huifu = self.huifu;
//    eval2.headerImageViewClick = self.headerImageViewClick;
//    
//    LCEvaluateCellViewModel *eval3 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1]];
//    eval3.imgURL = nil;
//    eval3.name = @"你全力以赴也打不败的男人";
//    eval3.huifu = self.huifu;
//    eval3.headerImageViewClick = self.headerImageViewClick;
//    
//    LCEvaluateCellViewModel *eval4 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[]];
//    eval4.imgURL = nil;
//    eval4.name = @"你全力以赴也打不败的男人";
//    eval4.huifu = self.huifu;
//    eval4.headerImageViewClick = self.headerImageViewClick;
//    
//    [self.mutableDataArr addObjectsFromArray:@[eval,eval1,eval2,eval3,eval4]];//@[eval,eval1,eval2,eval3,eval4]
//    self.dataSource = self.mutableDataArr.copy;
    [self.netApi_Manager assessListWithPlanld:@"6" andCurpage:curpage CompleteHandle:^(id responseObj, NSError *error) {
        
        LCAssessListModel *assessListModel = [LCAssessListModel parseJSON:responseObj];
        for (int i=0; i<assessListModel.contents.count; i++) {
            LCEvaluateCellViewModel *evaluateCellVM = [[LCEvaluateCellViewModel alloc]initWithModel:assessListModel.contents[i]];
            [self.mutableDataArr addObject:evaluateCellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
        complete(responseObj);
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    
}
@end
