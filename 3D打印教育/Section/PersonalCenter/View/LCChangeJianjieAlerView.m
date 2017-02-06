//
//  LCChangeJianjieAlerView.m
//  3D打印教育
//
//  Created by 3D on 17/2/1.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCChangeJianjieAlerView.h"

@implementation LCChangeJianjieAlerView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [KDColor getC12Color];
        [self setUpviews];
    }
    return self;
}

-(void)setUpviews{
    UILabel *titleLB  = [UILabel new];
    titleLB.textColor = [KDColor getC2Color];
    titleLB.font = [[KDFont new]getF30Font];
    titleLB.text = @"修改签名";
    [self addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
    }];
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [KDColor getC0Color];
    backView.layer.cornerRadius = 5;
    backView.layer.borderWidth = 0.5;
    backView.layer.borderColor = [KDColor getC15Color].CGColor;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(titleLB.mas_bottom).mas_equalTo(20);
        make.height.mas_equalTo(34);
    }];
    self.textFiled = [UITextField new];
    [backView addSubview:_textFiled];
    [_textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.bottom.right.mas_equalTo(0);
    }];
    
    
    
    UIView *horizontalLineView = [UIView new];
    horizontalLineView.backgroundColor = [KDColor getC15Color];
    [self addSubview:horizontalLineView];
    [horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(backView.mas_bottom).mas_equalTo(23);
        make.height.mas_equalTo(0.5);
        
    }];
    
    UIView *verticalLineView = [UIView new];
    [self addSubview:verticalLineView];
    verticalLineView.backgroundColor = [KDColor getC15Color];
    [verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(horizontalLineView.mas_bottom).mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(0.5);
    }];
    
    UIButton *leftBT = [UIButton new];
    self.leftBT = leftBT;
    [self addSubview: leftBT];
    [leftBT setTitle:@"取消修改" forState:UIControlStateNormal];
    [leftBT setTitleColor:[KDColor getC3Color] forState:UIControlStateNormal];
    leftBT.titleLabel.font = [[KDFont new]getF30Font];
    [leftBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.top.mas_equalTo(horizontalLineView.mas_bottom).mas_equalTo(0);
        make.right.mas_equalTo(verticalLineView.mas_left).mas_equalTo(0);
    }];
    
    UIButton *rightBt = [UIButton new];
    self.rightBt = rightBt;
    [self addSubview: rightBt];
    [rightBt setTitle:@"确定修改" forState:UIControlStateNormal];
    [rightBt setTitleColor:[KDColor getC2Color] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [[KDFont new]getF30Font];
    [rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(horizontalLineView.mas_bottom).mas_equalTo(0);
        make.left.mas_equalTo(verticalLineView.mas_right).mas_equalTo(0);
    }];
    
}

@end
