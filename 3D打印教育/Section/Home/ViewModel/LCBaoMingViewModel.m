//
//  LCBaoMingViewModel.m
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBaoMingViewModel.h"
#import "LCBaoMingModel.h"

#import "JCAlertView.h"
#import "LCSelectSexAlerView.h"
#import "LCSelectXueLiAlerView.h"
#import "LCSelectBirthdayAlerView.h"
#import "LCPayMethodAlerView.h"

#import "NSObject+Common.h"
#import "RegexUtil.h"

#import "LCBaoMingZhiFuViewModel.h"
@interface LCBaoMingViewModel ()


@property(nonatomic,strong) JCAlertView *JCSXEVIew;
@property(nonatomic,strong) LCSelectSexAlerView *sexAlertView;

@property(nonatomic,strong) JCAlertView *JCXLVIew;
@property(nonatomic,strong) LCSelectXueLiAlerView *xueLiAlertView;

@property(nonatomic,strong) JCAlertView *JCBIRTHDAYVIew;
@property(nonatomic,strong) LCSelectBirthdayAlerView *birthdayAlertView;

@property(nonatomic,strong) JCAlertView *JCPAYVIew;
@property(nonatomic,strong) LCPayMethodAlerView *payAlertView;


//@property(nonatomic,strong) LCBaoMingModel *bmModel;
@property(nonatomic,strong) LCBaoMingModel *xmModel;
@property(nonatomic,strong) LCBaoMingModel *xbModel;
@property(nonatomic,strong) LCBaoMingModel *csnyrModel;
//@property(nonatomic,strong) LCBaoMingModel *byModel;
@property(nonatomic,strong) LCBaoMingModel *zyModel;
@property(nonatomic,strong) LCBaoMingModel *xlModel;
@property(nonatomic,strong) LCBaoMingModel *dhModel;
@property(nonatomic,strong) LCBaoMingModel *emlModel;
@property(nonatomic,strong) LCBaoMingModel *onlinePayModel;

@property(nonatomic,strong) NSString *beiZhu;
@property(nonatomic,strong) NSString *birthdayStr;
@property(nonatomic,strong) NSDateFormatter *dateFormatter;
@end

@implementation LCBaoMingViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    
    @weakify(self)
    [self setTextFiledDidEndDding:^(NSString *title, NSString *textFiledtext) {
        @strongify(self)
        if ([title isEqualToString:@"姓名"]) {
            self.xmModel.canShu = textFiledtext;
        }else if ([title isEqualToString:@"所学专业"]){
            self.zyModel.canShu = textFiledtext;
        }else if ([title isEqualToString:@"联系电话"]){
            self.dhModel.canShu = textFiledtext;
        }else if ([title isEqualToString:@"Email"]){
            self.emlModel.canShu = textFiledtext;
        }
    }];
    
    [self setTextViewDidEndDding:^(NSString *textViewText) {
        @strongify(self)
        self.beiZhu = textViewText;
    }];
    
    [self setShowMethodOfpaymentView:^{
        @strongify(self)
        [self.JCPAYVIew show];
        [self.payAlertView.xianXiaPayBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            self.onlinePayModel.canShu = self.payAlertView.xianXiaPay;
            self.bingViewModelToBottomFooterView(self.onlinePayModel);
            [self.JCPAYVIew dismissWithCompletion:nil];
        }];
        
        [self.payAlertView.onlinePayBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            self.onlinePayModel.canShu = self.payAlertView.onlinePay;
            self.bingViewModelToBottomFooterView(self.onlinePayModel);
            [self.JCPAYVIew dismissWithCompletion:nil];
        }];
    }];
    
}


-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
   @weakify(self)
    if (indexpath.row == 1){
        [self.JCSXEVIew show];
        [self.sexAlertView.manBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //男
            self.sexAlertView.manBT.selected = YES;
            self.sexAlertView.womanBT.selected = NO;
            self.xbModel.canShu = @"男";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCSXEVIew dismissWithCompletion:nil];

        }];
        [self.sexAlertView.womanBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //女
            self.sexAlertView.manBT.selected = NO;
            self.sexAlertView.womanBT.selected = YES;
            self.xbModel.canShu = @"女";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCSXEVIew dismissWithCompletion:nil];
        }];
        
    }else if (indexpath.row == 4){
        [self.JCXLVIew show];
        [self.xueLiAlertView.gzBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //高中
            self.xueLiAlertView.gzBT.selected = YES;
            self.xueLiAlertView.zkBT.selected = NO;
            self.xueLiAlertView.bkBT.selected = NO;
            self.xueLiAlertView.shBT.selected = NO;
            self.xueLiAlertView.bsBT.selected = NO;
            self.xlModel.canShu = @"高中";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCXLVIew dismissWithCompletion:nil];
    
        }];
        [self.xueLiAlertView.zkBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //专科
            self.xueLiAlertView.gzBT.selected = NO;
            self.xueLiAlertView.zkBT.selected = YES;
            self.xueLiAlertView.bkBT.selected = NO;
            self.xueLiAlertView.shBT.selected = NO;
            self.xueLiAlertView.bsBT.selected = NO;
            self.xlModel.canShu = @"专科";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCXLVIew dismissWithCompletion:nil];
        }];
        [self.xueLiAlertView.bkBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //本科
            self.xueLiAlertView.gzBT.selected = NO;
            self.xueLiAlertView.zkBT.selected = NO;
            self.xueLiAlertView.bkBT.selected = YES;
            self.xueLiAlertView.shBT.selected = NO;
            self.xueLiAlertView.bsBT.selected = NO;
            self.xlModel.canShu = @"本科";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCXLVIew dismissWithCompletion:nil];
            
        }];
        [self.xueLiAlertView.shBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //硕士
            self.xueLiAlertView.gzBT.selected = NO;
            self.xueLiAlertView.zkBT.selected = NO;
            self.xueLiAlertView.bkBT.selected = NO;
            self.xueLiAlertView.shBT.selected = YES;
            self.xueLiAlertView.bsBT.selected = NO;
            self.xlModel.canShu = @"硕士";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCXLVIew dismissWithCompletion:nil];
        }];
        [self.xueLiAlertView.bsBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self)
            //博士
            self.xueLiAlertView.gzBT.selected = NO;
            self.xueLiAlertView.zkBT.selected = NO;
            self.xueLiAlertView.bkBT.selected = NO;
            self.xueLiAlertView.shBT.selected = NO;
            self.xueLiAlertView.bsBT.selected = YES;
            self.xlModel.canShu = @"博士";
            self.dataSource = self.mutableDataArr.copy;
            [self.JCXLVIew dismissWithCompletion:nil];
        }];
    }else if (indexpath.row == 2){
        [self.JCBIRTHDAYVIew show];
        [self.birthdayAlertView.datePickerView addBlockForControlEvents:UIControlEventValueChanged block:^(id  _Nonnull sender) {
            @strongify(self)
            
            UIDatePicker *datePicker = sender;
            NSDate *birthdayDate = datePicker.date;
            
            
            NSString *timeStr = [NSString stringWithFormat:@"%.0f",[birthdayDate timeIntervalSince1970]];//要传给后台的
            self.birthdayStr = timeStr;
            self.csnyrModel.canShu = [self.dateFormatter stringFromDate:birthdayDate]; //显示的
            self.dataSource = self.mutableDataArr.copy;
            
        }];
    }
    
}


-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id responseObj))complete{
    
    self.onlinePayModel = [LCBaoMingModel new];//这个model没有加到数组里面因为这个付款方式是在fotterView上不是个cell
    self.onlinePayModel.title = @"支付方式";
    self.onlinePayModel.placeholderTitle = @"请选择支付方式";

    
    self.xmModel = [LCBaoMingModel new];
    _xmModel.title = @"姓名";
    _xmModel.placeholderTitle = @"请填写姓名";
    [self.mutableDataArr addObject:_xmModel];
    
    self.xbModel = [LCBaoMingModel new];
    self.xbModel.title = @"性别";
    self.xbModel.placeholderTitle = @"请选择性别";
    [self.mutableDataArr addObject:self.xbModel];
    
    _csnyrModel = [LCBaoMingModel new];
    _csnyrModel.title = @"出生年月日";
    _csnyrModel.placeholderTitle = @"请填写出生年月日";
    [self.mutableDataArr addObject:_csnyrModel];
    
    _zyModel = [LCBaoMingModel new];
    _zyModel.title = @"所学专业";
    _zyModel.placeholderTitle = @"请选填写转业";
    [self.mutableDataArr addObject:_zyModel];
    
    _xlModel = [LCBaoMingModel new];
    _xlModel.title = @"学历";
    _xlModel.placeholderTitle = @"请选择学历";
    [self.mutableDataArr addObject:_xlModel];
    
    _dhModel = [LCBaoMingModel new];
    _dhModel.title = @"联系电话";
    _dhModel.placeholderTitle = @"请填写联系电话";
    [self.mutableDataArr addObject:_dhModel];
    
    _emlModel = [LCBaoMingModel new];
    _emlModel.title = @"Email";
    _emlModel.placeholderTitle = @"请填写email";
    [self.mutableDataArr addObject:_emlModel];
    
    self.dataSource = self.mutableDataArr.copy;
}



//-(void)networkPresent{
//    LCBaoMingZhiFuViewModel *baomingZhifuVM = [[LCBaoMingZhiFuViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"在线支付"}];
//    
//    baomingZhifuVM.price = self.price;
//    baomingZhifuVM.long_time = self.long_time;
//    baomingZhifuVM.privilegePrice = [NSString stringWithFormat:@"%.2f",[self.price floatValue]-[self.online_price floatValue]];
//    baomingZhifuVM.onlineprice = self.online_price;
//    baomingZhifuVM.name = self.topTitle;
//    
//    
//    [self.navigationStackService pushViewModel:baomingZhifuVM animated:YES];
//}

//提交报名
-(void)networkPresent{
/*
 @property(nonatomic,strong) LCBaoMingModel *bmModel;
 @property(nonatomic,strong) LCBaoMingModel *xmModel;
 @property(nonatomic,strong) LCBaoMingModel *xbModel;
 @property(nonatomic,strong) LCBaoMingModel *csnyrModel;
 @property(nonatomic,strong) LCBaoMingModel *byModel;
 @property(nonatomic,strong) LCBaoMingModel *zyModel;
 @property(nonatomic,strong) LCBaoMingModel *xlModel;
 @property(nonatomic,strong) LCBaoMingModel *dhModel;
 @property(nonatomic,strong) LCBaoMingModel *qqModel;
 @property(nonatomic,strong) NSDateFormatter *dateFormatter;
 */
    if (self.xmModel.canShu == nil|
        self.xbModel.canShu == nil|
        self.csnyrModel.canShu == nil|
        self.zyModel.canShu == nil|
        self.xlModel.canShu == nil|
        self.dhModel.canShu == nil|
        self.emlModel.canShu == nil) {
        [NSObject showWarning:@"您的信息不完善请完善信息再提交"];
        return;
    }else if (![RegexUtil checkTelNumber:self.dhModel.canShu]){
        [NSObject showWarning:@"您手机号码不正确"];
        return;
    }else if (self.beiZhu == nil | self.beiZhu.length == 0){
        self.beiZhu = @" ";
    }
    
    
    NSNumber *sexType = nil;
    if ([self.xbModel.canShu isEqualToString:@"男"]) {
        sexType = @1;
    }else{
        sexType = @2;
    }
    
    [self.netApi_Manager baomingWithName:self.xmModel.canShu
                                  andSex:sexType
                             andBirthday:self.birthdayStr
                         andProfessional:self.zyModel.canShu
                                andXueLi:self.xlModel.canShu
                             andPhoneNum:self.dhModel.canShu
                                andEmail:self.emlModel.canShu
                                ndBeiZhu:self.beiZhu
                                   andID:self.classIID
                          CompleteHandle:^(id responseObj, NSError *error) {
                              NSDictionary *dic = responseObj;
                                    if ([dic[@"msg"] isEqualToString:@"报名成功"]) {
                                        NSDictionary *contents = dic[@"contents"];
                                        NSString *orderSn = contents[@"orderSn"];
                                        LCBaoMingZhiFuViewModel *baomingZhifuVM = [[LCBaoMingZhiFuViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"在线支付"}];
                                        baomingZhifuVM.price = self.price;
                                        baomingZhifuVM.long_time = self.long_time;
                                        baomingZhifuVM.privilegePrice = [NSString stringWithFormat:@"%.2f",[self.price floatValue]-[self.online_price floatValue]];
                                        baomingZhifuVM.onlineprice = self.online_price;
                                        baomingZhifuVM.name = self.topTitle;
                                        baomingZhifuVM.order_Sn = orderSn;
                                        [self.navigationStackService pushViewModel:baomingZhifuVM animated:YES];
                                    }
                                    
    }];
}

-(JCAlertView *)JCSXEVIew{
    
    if (!_JCSXEVIew) {
        self.sexAlertView = [[LCSelectSexAlerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 24, 88.5)];
        _JCSXEVIew = [[JCAlertView alloc]initWithCustomView:self.sexAlertView dismissWhenTouchedBackground:YES];
    }
    return _JCSXEVIew;
}

-(JCAlertView *)JCPAYVIew{
    if (!_JCPAYVIew) {
        self.payAlertView = [[LCPayMethodAlerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 24, 88.5)];
        self.payAlertView.onlinePay = [NSString stringWithFormat:@"在线支付(%@元)",self.online_price];
        self.payAlertView.xianXiaPay = [NSString stringWithFormat:@"线下支付(%@元)",self.price];
        _JCPAYVIew = [[JCAlertView alloc]initWithCustomView:self.payAlertView  dismissWhenTouchedBackground:YES];
    }
    return _JCPAYVIew;

}

-(JCAlertView *)JCXLVIew{
    if (!_JCXLVIew) {
        self.xueLiAlertView = [[LCSelectXueLiAlerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-24, 44*5+4*0.5)];
        _JCXLVIew = [[JCAlertView alloc]initWithCustomView:self.xueLiAlertView dismissWhenTouchedBackground:YES];
    }
    return _JCXLVIew;
}

-(JCAlertView *)JCBIRTHDAYVIew{
    if (!_JCBIRTHDAYVIew) {
        self.birthdayAlertView = [[LCSelectBirthdayAlerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-24, 44*5+4*0.5)];
        _JCBIRTHDAYVIew = [[JCAlertView alloc]initWithCustomView:self.birthdayAlertView dismissWhenTouchedBackground:YES];
    }
    return _JCBIRTHDAYVIew;
}

- (NSDateFormatter *)dateFormatter {
	if(_dateFormatter == nil) {
		_dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [_dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [_dateFormatter setDateFormat:@"YYYY--MM--dd"];
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [_dateFormatter setTimeZone:timeZone];
        
	}
	return _dateFormatter;
}

-(void)dealloc{
    MYLog(@"报名viewModel释放");
}
@end
