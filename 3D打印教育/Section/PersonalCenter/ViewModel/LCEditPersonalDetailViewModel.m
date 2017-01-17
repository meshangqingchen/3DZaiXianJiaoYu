//
//  LCEditPersonalDetailViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/9.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCEditPersonalDetailViewModel.h"
#import "LCEditPersonalDetailCellViewModel.h"
#import "JCAlertView.h"
#import "LCChangeNickNameAlerView.h" //改变昵称的alerView;
#import "LCSelectBirthdayAlerView.h" //改变生日
#import "NSObject+Common.h"
@interface LCEditPersonalDetailViewModel ()
@property(nonatomic,strong) LCEditPersonalDetailCellViewModel *cellVMHeaderImage;
@property(nonatomic,strong) LCEditPersonalDetailCellViewModel *cellVMNickName;
@property(nonatomic,strong) LCEditPersonalDetailCellViewModel *cellVMSex;
@property(nonatomic,strong) LCEditPersonalDetailCellViewModel *cellVMBrithyDay;
@property(nonatomic,strong) LCEditPersonalDetailCellViewModel *cellVMPhoneNum;
@property(nonatomic,strong) LCEditPersonalDetailCellViewModel *cellVMJianJie;
@end

@implementation LCEditPersonalDetailViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setChangeHeadImage:^(UIImage *headImage) {
        @strongify(self)
        //上传头像接口 //成功返回新的 url 失败返回 旧的URL
        [self.netApi_Manager uploadHeadImage:headImage andName:@"img" CompleteHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic = responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];
            if ([dic[@"status"] isEqualToNumber:@1]) {
                NSDictionary *contents = dic[@"contents"];
                NSString *imageStr = contents[@"avatar"];
                self.cellVMHeaderImage.rightURL = [NSURL URLWithString:imageStr];
                self.dataSource = self.mutableDataArr.copy;
            }
        }];
         
    }];
    
    [self setSelectSex:^(NSString *sexStr) {
        @strongify(self)
        NSString *sexString = nil;
        if ([sexStr isEqualToString:@"男"]) {
            sexString = @"1";
        }else if ([sexStr isEqualToString:@"女"]){
            sexString = @"2";
        }
        
        [self.netApi_Manager changeSex:sexString CompleteHandle:^(id responseObj, NSError *error) {
            NSDictionary *dic = responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];
            if ([dic[@"status"] isEqualToNumber:@1]) {
                self.cellVMSex.rightTitle = sexStr;
                self.dataSource = self.mutableDataArr.copy;
            }

        }];
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    
    JCAlertView *alertView = nil;
    if (indexpath.section == 0 & indexpath.row == 1) {
        LCChangeNickNameAlerView *nickNameAlerView = [[LCChangeNickNameAlerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-50, 150)];
        nickNameAlerView.layer.cornerRadius = 5;
        alertView = [[JCAlertView alloc]initWithCustomView:nickNameAlerView dismissWhenTouchedBackground:YES];
        [alertView show];
        
        [nickNameAlerView.leftBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            [alertView dismissWithCompletion:nil];
        }];
        @weakify(nickNameAlerView)
        [nickNameAlerView.rightBt addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(nickNameAlerView)
//            @strongify(alertView)
            [alertView dismissWithCompletion:nil];
            
            NSString *textFiledText = nickNameAlerView.textFiled.text;
            //拿到textFiledText 更改昵称;
            if (textFiledText == nil | textFiledText.length == 0) {
                return ;
            }
            
            //走网络接口
            [self.netApi_Manager changeNickName:textFiledText CompleteHandle:^(id responseObj, NSError *error) {
                NSDictionary *dic = responseObj;
                NSString *msg = dic[@"msg"];
                [NSObject showWarning:msg];
                if ([dic[@"status"] isEqualToNumber:@1]) {
                    self.cellVMNickName.rightTitle = textFiledText;
                    self.dataSource = self.mutableDataArr.copy;
                }
            }];
        }];
        
    }else if (indexpath.section == 0 & indexpath.row == 3){
        //出生日期
        LCSelectBirthdayAlerView *selectBrithdayAlertView = [[LCSelectBirthdayAlerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-24, 44*5+4*0.5)];
        alertView = [[JCAlertView alloc]initWithCustomView:selectBrithdayAlertView dismissWhenTouchedBackground:YES];
        [alertView show];
        
        
        [selectBrithdayAlertView.leftBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
//            @strongify(alertView)
            [alertView dismissWithCompletion:nil];
        }];
        
        @weakify(selectBrithdayAlertView)
        [selectBrithdayAlertView.rightBt addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(selectBrithdayAlertView)
            [alertView dismissWithCompletion:nil];
            
            NSString *timeStr = selectBrithdayAlertView.timeStr;
            //更改时间
            if (timeStr == nil | timeStr.length == 0) {
                return ;
            }
            //走网络接口
            [self.netApi_Manager changeBirthday:timeStr CompleteHandle:^(id responseObj, NSError *error) {
                NSDictionary *dic = responseObj;
                NSString *msg = dic[@"msg"];
                [NSObject showWarning:msg];
                if ([dic[@"status"] isEqualToNumber:@1]) {
                    self.cellVMBrithyDay.rightTitle = timeStr; //这里自己在转换 标准时间
                    self.dataSource = self.mutableDataArr.copy;
                }

            }];
        }];

    }else if (indexpath.section == 0 & indexpath.row == 4){
        //修改手机号
    }else if (indexpath.section == 1 & indexpath.row == 0){
        //个人简介
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    
    self.cellVMHeaderImage = [[LCEditPersonalDetailCellViewModel alloc]initWithModel:@{@"leftTitle":@"头像",@"rightTitle":@"",@"rightImageUrl":self.selfCreatUser.avatar}];
    self.cellVMNickName = [[LCEditPersonalDetailCellViewModel alloc]initWithModel:@{@"leftTitle":@"昵称",@"rightTitle":self.selfCreatUser.nick_name}];
    self.cellVMSex = [[LCEditPersonalDetailCellViewModel alloc]initWithModel:@{@"leftTitle":@"性别",@"rightTitle":self.selfCreatUser.sex}];
    self.cellVMBrithyDay = [[LCEditPersonalDetailCellViewModel alloc]initWithModel:@{@"leftTitle":@"出生日期",@"rightTitle":self.selfCreatUser.birthday}];
    self.cellVMPhoneNum = [[LCEditPersonalDetailCellViewModel alloc]initWithModel:@{@"leftTitle":@"手机号",@"rightTitle":self.selfCreatUser.user_name}];
    self.cellVMJianJie = [[LCEditPersonalDetailCellViewModel alloc]initWithModel:@{@"leftTitle":@"个人简介",@"rightTitle":self.selfCreatUser.des}];
    
    [self.mutableDataArr addObjectsFromArray:@[@[self.cellVMHeaderImage,
                                                 self.cellVMNickName,
                                                 self.cellVMSex,
                                                 self.cellVMBrithyDay,
                                                 self.cellVMPhoneNum],
                                               @[self.cellVMJianJie]]];
    self.dataSource = self.mutableDataArr.copy;
}

- (NSDateFormatter *)CreatdateFormatter {
   
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateFormat:@"YYYY--MM--dd"];
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [dateFormatter setTimeZone:timeZone];
    return dateFormatter;
}

@end
