//
//  LCMemberTopCell.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberTopCell.h"
#import "LCMemberTopCellViewModel.h"
@interface LCMemberTopCell ()
@property(nonatomic,strong) UIImageView *backImageView;
@property(nonatomic,strong) UILabel *timeLB;
@end

@implementation LCMemberTopCell
-(void)setupViews{
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [KDColor getC0Color];
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [KDColor getC7Color];
    [bottomView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    UILabel *lb = [UILabel new];
    lb.text = @"开通会员";
    lb.textColor = [KDColor getC2Color];
    lb.font = [[KDFont sharedKDFont] getF30Font];
    [bottomView addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(15);
    }];
    
    UIImageView *huiyuanquanImageView = [UIImageView new];
    huiyuanquanImageView.image = [UIImage imageNamed:@"youhuiquan"];
    [bottomView addSubview:huiyuanquanImageView];
    [huiyuanquanImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lb.mas_right).mas_offset(0);
        make.top.mas_offset(4);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    
    
    
    self.backImageView = [UIImageView new];
    self.backImageView.image = [UIImage imageNamed:@"vipBack"];
    [self addSubview:self.backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(120);
    }];
    
    UIImageView *vipImageView = [UIImageView new];
    [self.backImageView addSubview:vipImageView];
    vipImageView.image = [UIImage imageNamed:@"vip"];
    [vipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.bottom.mas_offset(0);
        make.top.mas_offset(10);
        make.width.mas_offset(SCREEN_WIDTH*482/750);
    }];
    
    self.timeLB = [UILabel new];
    _timeLB.textColor = [KDColor getC27Color];
    self.timeLB.font = [[KDFont sharedKDFont] getF32Font];
    [vipImageView addSubview:_timeLB];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.bottom.mas_offset(-9);
    }];
    
    UILabel *effectiveTime = [UILabel new];
    effectiveTime.text = @"有效期至";
    effectiveTime.textColor = [KDColor getC27Color];
    effectiveTime.font = [[KDFont sharedKDFont] getF22Font];
    [vipImageView addSubview:effectiveTime];
    [effectiveTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.bottom.mas_equalTo(self.timeLB.mas_top).mas_offset(-6);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCMemberTopCellViewModel *topCellVM = viewModel;
    self.timeLB.text = topCellVM.stopTime;
}
@end
