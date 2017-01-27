//
//  LCPersonalCenterViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCPersonalCenterViewModel.h"
#import "LCPersonalCenterCellViewModel.h"     //cellVM
#import "LCUserModel.h"                       //用户信息
#import "LCPersonalCenterHeaderViewModel.h"   //headerVM

#import "LCLoginViewModel.h"   //登录VM
#import "LCEditPersonalDetailViewModel.h"
#import "LCSetingViewModel.h"  //设置VM
#import "LCCollectOJoinRViewModel.h" // 课程 或者 收藏
#import "LCFeedbackViewModel.h"      // 意见反馈


@interface LCPersonalCenterViewModel ()
@property(nonatomic,strong) LCUser *selfCreatUser;
@end

@implementation LCPersonalCenterViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setGoToLoginVC:^{
        @strongify(self)
        LCLoginViewModel *loginVM = [[LCLoginViewModel alloc]initWithServices:self.navigationStackService params:nil];
        [self.navigationStackService presentViewModel:loginVM animated:YES completion:nil];
    }];
    
    [self setPushToEditDataVM:^(id viewModel) {
        @strongify(self)
        LCEditPersonalDetailViewModel *editPersonalDetailVM = [[LCEditPersonalDetailViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"编辑个人资料"}];
        editPersonalDetailVM.selfCreatUser = self.selfCreatUser;
        [self.navigationStackService pushViewModel:editPersonalDetailVM animated:YES];
    }];
    
    [self setNetworkRequestPersonalCenter:^{
        @strongify(self)
        //个人中心
        [self.netApi_Manager personalInformationCompleteHandle:^(id responseObj, NSError *error) {
            
            LCUserModel *userModel = [LCUserModel parseJSON:responseObj];
            
            LCUser *selfCreatUser = [[LCUser alloc]initWithUserContents:userModel.contents];
            self.selfCreatUser = selfCreatUser;
            NSDictionary *dic = nil;
            if (userModel.status == 1) {
                dic = @{@"topTitle":userModel.contents.nick_name,
                        @"headerImageURL":userModel.contents.avatar,
                        @"signature":userModel.contents.des,
                        @"ifneedLog":@0};
            }else{
                dic = @{@"topTitle":@"登录/注册",
                        @"headerImageURL":@"---",
                        @"signature":@"",
                        @"ifneedLog":@1};
            }
            
            LCPersonalCenterHeaderViewModel *headerVM = [[LCPersonalCenterHeaderViewModel alloc]initWithModel:dic];
            headerVM.goToLoginVC = self.goToLoginVC;
            headerVM.pushToEditDataVM = self.pushToEditDataVM;
            !self.bindViewModel ? :self.bindViewModel(headerVM);
            
        }];
    }];
    
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    NSArray *setionArr = self.dataSource[indexpath.section];
    LCPersonalCenterCellViewModel *cellVM = setionArr[indexpath.row];
    //消息、课程、收藏、设置、意见反馈
    if ([cellVM.titleName isEqualToString:@"消息"]) {
        
    }else if ([cellVM.titleName isEqualToString:@"课程"]){
        LCCollectOJoinRViewModel *joinVM = [[LCCollectOJoinRViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"我的课程"}];
        [self.navigationStackService pushViewModel:joinVM animated:YES];
    }else if ([cellVM.titleName isEqualToString:@"收藏"]){
        LCCollectOJoinRViewModel *collectVM = [[LCCollectOJoinRViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"我的收藏"}];
        [self.navigationStackService pushViewModel:collectVM animated:YES];
    }else if ([cellVM.titleName isEqualToString:@"设置"]){
        LCSetingViewModel *setIngVM = [[LCSetingViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"设置"}];
        [self.navigationStackService pushViewModel:setIngVM animated:YES];
    }else if ([cellVM.titleName isEqualToString:@"意见反馈"]){
        LCFeedbackViewModel *feedbackVM = [[LCFeedbackViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"意见反馈"}];
        [self.navigationStackService pushViewModel:feedbackVM animated:YES];
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    
    //消息、课程、收藏、设置、意见反馈
    LCPersonalCenterCellViewModel *cellVM0 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"消息",@"imageName":@"xiaoxitixing"}];
    LCPersonalCenterCellViewModel *cellVM1 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"课程",@"imageName":@"wodekecheng"}];
    LCPersonalCenterCellViewModel *cellVM2 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"收藏",@"imageName":@"shoucang"}];
    LCPersonalCenterCellViewModel *cellVM3 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"设置",@"imageName":@"seting"}];
    LCPersonalCenterCellViewModel *cellVM4 = [[LCPersonalCenterCellViewModel alloc]initWithModel:@{@"titleName":@"意见反馈",@"imageName":@"yijianfankui"}];
    NSArray *setionArr0 = @[cellVM0,cellVM1];
    NSArray *setionArr1 = @[cellVM2,cellVM3,cellVM4];
    [self.mutableDataArr addObjectsFromArray:@[setionArr0,setionArr1]];//
    self.dataSource = self.mutableDataArr.copy;
}
@end
