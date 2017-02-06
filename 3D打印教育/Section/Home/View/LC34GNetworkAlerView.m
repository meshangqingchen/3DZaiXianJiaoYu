//
//  LC34GNetworkAlerView.m
//  3D打印教育
//
//  Created by 3D on 17/2/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LC34GNetworkAlerView.h"

@implementation LC34GNetworkAlerView


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
    titleLB.text = @"在非无线的网络环境下观看视频会消耗您的流量";
    titleLB.numberOfLines = 2;
    [self addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(30);
        make.height.mas_equalTo(60);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
    
    UIView *horizontalLineView = [UIView new];
    horizontalLineView.backgroundColor = [KDColor getC15Color];
    [self addSubview:horizontalLineView];
    [horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(titleLB.mas_bottom).mas_equalTo(20);
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
    [leftBT setTitle:@"NO" forState:UIControlStateNormal];
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
    [rightBt setTitle:@"YES" forState:UIControlStateNormal];
    [rightBt setTitleColor:[KDColor getC2Color] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [[KDFont new]getF30Font];
    [rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(horizontalLineView.mas_bottom).mas_equalTo(0);
        make.left.mas_equalTo(verticalLineView.mas_right).mas_equalTo(0);
    }];
    
}

@end
