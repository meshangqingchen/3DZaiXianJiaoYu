//
//  LCPayMethodAlerView.m
//  3D打印教育
//
//  Created by 3D on 17/3/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPayMethodAlerView.h"

@implementation LCPayMethodAlerView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [KDColor getC0Color];
        self.layer.cornerRadius  = 4;
        [self setUpviews];
    }
    return self;
}

-(void)setUpviews{
    self.onlinePayBT = [UIButton new];
    [self addSubview:_onlinePayBT];
//    [_manBT setTitle:@"男" forState:0];
    [_onlinePayBT setTitleColor:[KDColor getC2Color] forState:0];
    [_onlinePayBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _onlinePayBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_onlinePayBT mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    self.xianXiaPayBT = [UIButton new];
    [self addSubview:_xianXiaPayBT];
//    [_xianXiaPayBT setTitle:@"女" forState:0];
    [_xianXiaPayBT setTitleColor:[KDColor getC2Color] forState:0];
    [_xianXiaPayBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _xianXiaPayBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_xianXiaPayBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
}

-(void)setXianXiaPay:(NSString *)xianXiaPay{
    _xianXiaPay = xianXiaPay;
    [_xianXiaPayBT setTitle:_xianXiaPay forState:0];
}

-(void)setOnlinePay:(NSString *)onlinePay{
    _onlinePay = onlinePay;
    [_onlinePayBT setTitle:_onlinePay forState:0];
}

-(void)dealloc{
    MYLog(@"这个 销毁了");
}

@end
