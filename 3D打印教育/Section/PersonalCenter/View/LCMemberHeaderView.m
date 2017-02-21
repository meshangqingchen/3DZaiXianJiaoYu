//
//  LCMemberHeaderView.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberHeaderView.h"




@interface LCMemberHeaderView ()

@property(nonatomic,strong) UIImageView *vipImageView;
@property(nonatomic,strong) UILabel *timeLB;
@end

@implementation LCMemberHeaderView
-(void)setupViews{
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [KDColor getC0Color];
    [self addSubview:bottomView];
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
    [self addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(15);
    }];
    
    UIImageView *huiyuanquanImageView = [UIImageView new];
    huiyuanquanImageView.image = [UIImage imageNamed:@"youhuiquan"];
    [self addSubview:huiyuanquanImageView];
    [huiyuanquanImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lb.mas_right).mas_offset(0);
        make.top.mas_offset(-4);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    
    UIImageView *backImageView = [UIImageView new];
    backImageView.image = [UIImage imageNamed:@""];
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(120);
    }];
    
    self.vipImageView = [UIImageView new];
    self.vipImageView.image = [UIImage imageNamed:@""];
    [self.vipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-134,110));
    }];
    
    self.timeLB = [UILabel new];
    _timeLB.textColor = [KDColor getC27Color];
    self.timeLB.font = [[KDFont sharedKDFont] getF32Font];
    [self.vipImageView addSubview:_timeLB];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.bottom.mas_offset(-9);
    }];
}
@end
