//
//  LCDetailEvaluateHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/21.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCDetailEvaluateHeaderView.h"
#import "LCDetailEvaluateHeaderViewModel.h"
@implementation LCDetailEvaluateHeaderView

-(void)setupViews{
    self.headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    _headerImgView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_headerImgView];
    
    self.nameLB = [UILabel new];
    [self addSubview:_nameLB];
    _nameLB.textColor = [KDColor getC2Color];
    _nameLB.font = [[KDFont sharedKDFont]getF28Font];
    _nameLB.left = _headerImgView.right+15;
    _nameLB.top = 21;
    _nameLB.width = 200;
    _nameLB.height = 15;
    _nameLB.backgroundColor = [UIColor yellowColor];
    
    
    self.tiemLB = [UILabel new];
    [self addSubview:_tiemLB];
    _tiemLB.backgroundColor = [UIColor blueColor];
    _tiemLB.text = @"12-13 11:49";
    _tiemLB.font = [[KDFont sharedKDFont]getF28Font];
    _tiemLB.textColor = [KDColor getX0Color];
    _tiemLB.left = _nameLB.left;
    _tiemLB.top = _nameLB.bottom+3;
    _tiemLB.height = 15;
    _tiemLB.width = 200;
    
    self.evaYLB = [YYLabel new];
    [self addSubview:_evaYLB];
    _evaYLB.backgroundColor = [UIColor redColor];
    _evaYLB.top = _tiemLB.bottom+21;
    _evaYLB.left = 70;
    _evaYLB.width = SCREEN_WIDTH-70-25;

    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [KDColor getC9Color];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(31);
    }];
    UILabel *bottomLB = [UILabel new];
    bottomLB.text = @"以下为回复内容";
    bottomLB.font = [[KDFont sharedKDFont]getF30Font];
    bottomLB.textColor = [KDColor getC2Color];
    [bottomView addSubview:bottomLB];
    [bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    UIView *leftV = [UIView new];
    [bottomView addSubview:leftV];
    leftV.backgroundColor = [KDColor getX0Color];
    [leftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(bottomLB.mas_left).mas_offset(-5);
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(bottomLB);
    }];
    
    UIView *rightV = [UIView new];
    [bottomView addSubview:rightV];
    rightV.backgroundColor = [KDColor getX0Color];
    [rightV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bottomLB.mas_right).mas_offset(5);
        make.height.mas_equalTo(0.5);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(bottomLB);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCDetailEvaluateHeaderViewModel *detEvaHeaderVM = viewModel;
    self.evaYLB.height = detEvaHeaderVM.detail_H;
    
    self.tiemLB.text = detEvaHeaderVM.time;
    self.nameLB.text = detEvaHeaderVM.name;
    self.evaYLB.textLayout = detEvaHeaderVM.detailLayout;
}
@end
