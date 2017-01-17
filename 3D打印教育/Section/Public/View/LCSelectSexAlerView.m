//
//  LCSelectSexAlerView.m
//  无限教育
//
//  Created by 3D on 16/11/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCSelectSexAlerView.h"

@implementation LCSelectSexAlerView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [KDColor getC0Color];
        self.layer.cornerRadius  = 4;
        [self setUpviews];
    }
    return self;
}

-(void)setUpviews{
    self.manBT = [UIButton new];
    [self addSubview:_manBT];
    [_manBT setTitle:@"男" forState:0];
    [_manBT setTitleColor:[KDColor getC2Color] forState:0];
    [_manBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _manBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_manBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC15Color];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerY.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.womanBT = [UIButton new];
    [self addSubview:_womanBT];
    [_womanBT setTitle:@"女" forState:0];
    [_womanBT setTitleColor:[KDColor getC2Color] forState:0];
    [_womanBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _womanBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_womanBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
}

-(void)dealloc{
    MYLog(@"这个 销毁了");
}

@end
