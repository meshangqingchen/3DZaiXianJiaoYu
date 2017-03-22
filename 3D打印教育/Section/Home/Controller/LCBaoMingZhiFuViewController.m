//
//  LCBaoMingZhiFuViewController.m
//  3D打印教育
//
//  Created by 3D on 17/3/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCBaoMingZhiFuViewController.h"
#import "LCBaoMingZhiFuViewModel.h"
@interface LCBaoMingZhiFuViewController ()
@property(nonatomic,strong) LCBaoMingZhiFuViewModel *viewModel;
@end

@implementation LCBaoMingZhiFuViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [KDColor getC19Color];
   
    UIView *backView1 = [UIView new];
    backView1.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView1];
    [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(5+64);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe1 = [UIView new];
    lineViwe1.backgroundColor = [KDColor getC15Color];
    [backView1 addSubview:lineViwe1];
    [lineViwe1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UILabel *leftLB1 = [UILabel new];
    leftLB1.textColor = [KDColor getC2Color];
    leftLB1.font = [[KDFont sharedKDFont] getF30Font];
    leftLB1.text = @"3d打印桌面级特色班";
    [backView1 addSubview:leftLB1];
    [leftLB1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    
    
    
    UIView *backView2 = [UIView new];
    backView2.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView2];
    [backView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(backView1.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe2 = [UIView new];
    lineViwe2.backgroundColor = [KDColor getC15Color];
    [backView2 addSubview:lineViwe2];
    [lineViwe2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UILabel *leftLB2 = [UILabel new];
    leftLB2.textColor = [KDColor getC2Color];
    leftLB2.font = [[KDFont sharedKDFont] getF30Font];
    leftLB2.text = @"课程价格";
    [backView2 addSubview:leftLB2];
    [leftLB2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    UILabel *rightLB2 = [UILabel new];
    rightLB2.textColor = [KDColor getC3Color];
    rightLB2.font = [[KDFont sharedKDFont] getF30Font];
    rightLB2.text = [NSString stringWithFormat:@"¥%@",self.viewModel.price];
    [backView2 addSubview:rightLB2];
    [rightLB2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    
    
    
    UIView *backView3 = [UIView new];
    backView3.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView3];
    [backView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(backView2.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe3 = [UIView new];
    lineViwe3.backgroundColor = [KDColor getC15Color];
    [backView3 addSubview:lineViwe3];
    [lineViwe3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UILabel *leftLB3 = [UILabel new];
    leftLB3.textColor = [KDColor getC2Color];
    leftLB3.font = [[KDFont sharedKDFont] getF30Font];
    leftLB3.text = @"课程学时";
    [backView3 addSubview:leftLB3];
    [leftLB3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    UILabel *rightLB3 = [UILabel new];
    rightLB3.textColor = [KDColor getC3Color];
    rightLB3.font = [[KDFont sharedKDFont] getF30Font];
    rightLB3.text = [NSString stringWithFormat:@"%@天",self.viewModel.long_time];
    [backView3 addSubview:rightLB3];
    [rightLB3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    
    
    UIView *backView4 = [UIView new];
    backView4.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView4];
    [backView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(backView3.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe4 = [UIView new];
    lineViwe4.backgroundColor = [KDColor getC15Color];
    [backView4 addSubview:lineViwe4];
    [lineViwe4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UILabel *leftLB4 = [UILabel new];
    leftLB4.textColor = [KDColor getC2Color];
    leftLB4.font = [[KDFont sharedKDFont] getF30Font];
    leftLB4.text = @"线上支付优惠";
    [backView4 addSubview:leftLB4];
    [leftLB4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    UILabel *rightLB4 = [UILabel new];
    rightLB4.textColor = [KDColor getC33Color];
    rightLB4.font = [[KDFont sharedKDFont] getF30Font];
    rightLB4.text = [NSString stringWithFormat:@"-¥%@",self.viewModel.privilegePrice];
    [backView4 addSubview:rightLB4];
    [rightLB4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];


    
    UIView *backView5 = [UIView new];
    backView5.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView5];
    [backView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(backView4.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe5 = [UIView new];
    lineViwe5.backgroundColor = [KDColor getC15Color];
    [backView5 addSubview:lineViwe5];
    [lineViwe5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UILabel *rightLB5 = [UILabel new];
    rightLB5.textColor = [KDColor getC33Color];
    rightLB5.font = [[KDFont sharedKDFont] getF30Font];
    rightLB5.text = [NSString stringWithFormat:@"¥%@",self.viewModel.onlineprice];
    [backView5 addSubview:rightLB5];
    [rightLB5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    UILabel *leftLB5 = [UILabel new];
    leftLB5.textColor = [KDColor getC2Color];
    leftLB5.font = [[KDFont sharedKDFont] getF30Font];
    leftLB5.text = @"总计: ";
    [backView5 addSubview:leftLB5];
    [leftLB5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightLB5.mas_left).mas_equalTo(-5);
        make.centerY.mas_offset(0);
    }];


    
    UIView *backView6 = [UIView new];
//    backView6.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView6];
    [backView6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(backView5.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe6 = [UIView new];
    lineViwe6.backgroundColor = [KDColor getC15Color];
    [backView6 addSubview:lineViwe6];
    [lineViwe6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UILabel *leftLB6 = [UILabel new];
    leftLB6.textColor = [KDColor getC3Color];
    leftLB6.font = [[KDFont sharedKDFont] getF26Font];
    leftLB6.text = @"选择支付方式";
    [backView6 addSubview:leftLB6];
    [leftLB6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];

    
    UIView *backView7 = [UIView new];
    backView7.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:backView7];
    [backView7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(backView6.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *lineViwe7 = [UIView new];
    lineViwe7.backgroundColor = [KDColor getC15Color];
    [backView7 addSubview:lineViwe7];
    [lineViwe5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    UIImageView *leftimageView = [UIImageView new];
    leftimageView.image = [UIImage imageNamed:@"zhifubao"];
    [backView7 addSubview:leftimageView];
    [leftimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    UIImageView *rightimageView = [UIImageView new];
    rightimageView.image = [UIImage imageNamed:@"duigou"];
    [backView7 addSubview:rightimageView];
    [rightimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    UILabel *leftLB7 = [UILabel new];
    leftLB7.textColor = [KDColor getC2Color];
    leftLB7.font = [[KDFont sharedKDFont] getF30Font];
    leftLB7.text = @"线上支付";
    [backView7 addSubview:leftLB7];
    [leftLB7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftimageView.mas_right).mas_offset(10);
        make.centerY.mas_offset(0);
    }];


    UIButton *bottomBt = [UIButton new];
    bottomBt.backgroundColor = [KDColor getX1Color];
    [bottomBt setTitle:@"确认支付" forState:0];
    [bottomBt setTitleColor:[KDColor getC0Color] forState:0];
    bottomBt.titleLabel.font = [[KDFont sharedKDFont] getF32Font];
    @weakify(self)
    [bottomBt addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.payBaoMing ? : self.viewModel.payBaoMing(self.viewModel.order_Sn);
    }];
    [self.view addSubview:bottomBt];
    [bottomBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_offset(0);
        make.height.mas_equalTo(49);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
