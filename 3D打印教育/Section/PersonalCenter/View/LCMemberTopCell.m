//
//  LCMemberTopCell.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberTopCell.h"

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
    self.backImageView.image = [UIImage imageNamed:@"vip"];
    [self addSubview:self.backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(120);
    }];
    
    self.timeLB = [UILabel new];
    _timeLB.textColor = [KDColor getC27Color];
    self.timeLB.font = [[KDFont sharedKDFont] getF32Font];
    [self.backImageView addSubview:_timeLB];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(SCREEN_WIDTH*165/750);
        make.bottom.mas_offset(-9);
    }];
}

-(void)bindViewModel:(id)viewModel{

}
@end
