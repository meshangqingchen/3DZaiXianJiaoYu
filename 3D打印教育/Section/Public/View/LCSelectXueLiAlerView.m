//
//  LCSelectXueLiAlerView.m
//  无限教育
//
//  Created by 3D on 16/11/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCSelectXueLiAlerView.h"

@implementation LCSelectXueLiAlerView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [KDColor getC0Color];
        self.layer.cornerRadius  = 4;
        [self setUpviews];
    }
    return self;
}

/*
 @property(nonatomic,strong) UIButton *gzBT;
 @property(nonatomic,strong) UIButton *zkBT;
 @property(nonatomic,strong) UIButton *bkBT;
 @property(nonatomic,strong) UIButton *shBT;
 @property(nonatomic,strong) UIButton *bsBT;
 */


-(void)setUpviews{
    self.gzBT = [UIButton new];
    [self addSubview:_gzBT];
    [_gzBT setTitle:@"高中" forState:0];
    [_gzBT setTitleColor:[KDColor getC2Color] forState:0];
    [_gzBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _gzBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_gzBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = [KDColor getC15Color];
    [self addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(_gzBT.mas_bottom).mas_equalTo(0);
    }];
    
    self.zkBT = [UIButton new];
    [self addSubview:_zkBT];
    [_zkBT setTitle:@"专科" forState:0];
    [_zkBT setTitleColor:[KDColor getC2Color] forState:0];
    [_zkBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _zkBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_zkBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(lineView1.mas_bottom).mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    UIView *lineView2 = [UIView new];
    lineView2.backgroundColor = [KDColor getC15Color];
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(_zkBT.mas_bottom).mas_equalTo(0);
    }];

    self.bkBT = [UIButton new];
    [self addSubview:_bkBT];
    [_bkBT setTitle:@"本科" forState:0];
    [_bkBT setTitleColor:[KDColor getC2Color] forState:0];
    [_bkBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _bkBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_bkBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(lineView2.mas_bottom).mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    UIView *lineView3 = [UIView new];
    lineView3.backgroundColor = [KDColor getC15Color];
    [self addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(_bkBT.mas_bottom).mas_equalTo(0);
    }];

    self.shBT = [UIButton new];
    [self addSubview:_shBT];
    [_shBT setTitle:@"硕士" forState:0];
    [_shBT setTitleColor:[KDColor getC2Color] forState:0];
    [_shBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _shBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_shBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(lineView3.mas_bottom).mas_equalTo(0);
    }];
    
    UIView *lineView4 = [UIView new];
    lineView4.backgroundColor = [KDColor getC15Color];
    [self addSubview:lineView4];
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(_shBT.mas_bottom).mas_equalTo(0);
    }];
    
    self.bsBT = [UIButton new];
    [self addSubview:_bsBT];
    [_bsBT setTitle:@"博士" forState:0];
    [_bsBT setTitleColor:[KDColor getC2Color] forState:0];
    [_bsBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
    _bsBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    [_bsBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(lineView4.mas_bottom).mas_equalTo(0);
    }];

}

@end
