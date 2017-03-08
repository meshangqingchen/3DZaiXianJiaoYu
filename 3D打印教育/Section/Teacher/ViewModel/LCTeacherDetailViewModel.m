//
//  LCTeacherDetailViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTeacherDetailViewModel.h"
#import "LCTeacherDetailModel.h"
#import "LCTeacherDetailViewViewModel.h"

#import "LCUserTeacherTalkViewModel.h"
#import "LCNotarizeZiXunOrderViewModel.h"
#import "KDFileManager.h"

@interface LCTeacherDetailViewModel ()
@property(nonatomic,strong) LCTeacherDetailViewViewModel *teacherVM;
@end

@implementation LCTeacherDetailViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setNetworkRequests:^(NSString *teacherID) {
        @strongify(self)
        [self.netApi_Manager teacherDetailWith:teacherID completeHandle:^(id responseObj, NSError *error) {
            LCTeacherDetailModel *teacherModel = [LCTeacherDetailModel parseJSON:responseObj];
            LCTeacherDetailViewViewModel *teacherVM = [[LCTeacherDetailViewViewModel alloc]initWithModel:teacherModel.contents];
            self.teacherVM = teacherVM;
            !self.bingViewModel ? : self.bingViewModel(teacherVM);
        }];
    }];
    
    [self setPushZhiFuForZiXun:^(id viewModel) {
        @strongify(self)
        LCTeacherDetailViewViewModel *teacherVM = viewModel;
        [self.netApi_Manager creatOrderWithZiXunTeacherID:teacherVM.teacherIID andPrice:teacherVM.price completeHandle:^(id responseObj, NSError *error) {

            NSDictionary *dic = responseObj;
            if ([dic[@"status"] isEqualToNumber:@1]) {
                LCNotarizeZiXunOrderViewModel *zixunOrder = [[LCNotarizeZiXunOrderViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"购买服务"}];
                zixunOrder.viewVM = viewModel;
               
                NSDictionary *contents = dic[@"contents"];
                zixunOrder.order_sn = contents[@"order_sn"];
                //没从要把 order_sn 存起来 因为 在appdelegate 中要用到
                NSString *order_sn = contents[@"order_sn"];
                [KDFileManager saveUserData:order_sn forKey:LCCORDER_SN];
                
                [self.navigationStackService pushViewModel:zixunOrder animated:YES];
            }
        }];
    }];
    
    [self setPushTackWithTeacher:^(id viewModel) {
        @strongify(self)
        LCUserTeacherTalkViewModel *teacherTalkVM = [[LCUserTeacherTalkViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"资讯",@"teacherImageURL":self.teacherVM.headImageURL,@"teacherIID":self.teacherVM.teacherIID}];
        [self.navigationStackService pushViewModel:teacherTalkVM animated:YES];
    }];
}
@end
