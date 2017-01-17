//
//  LCBaoMingLBCell.m
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.


#import "LCBaoMingLBCell.h"
#import "LCBaoMingModel.h"

@implementation LCBaoMingLBCell

-(void)setupViews{
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [KDColor getC13Color];//
    shadowView.layer.cornerRadius = 5;
    [self.contentView addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(34);
    }];
    
    UIView *backWhiteView = [UIView new];
    backWhiteView.backgroundColor = [KDColor getC12Color];
    backWhiteView.layer.cornerRadius = 4.5;
    [shadowView addSubview:backWhiteView];
    [backWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5));
    }];
    
    UIImageView *pullArrowsImageView = [UIImageView new];
    [backWhiteView addSubview:pullArrowsImageView];
    pullArrowsImageView.image = [UIImage imageNamed:@"pullArrows"];
    [pullArrowsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(25/2);
        make.height.mas_equalTo(7);
    }];
    
    self.placHoderLB = [UILabel new];
    _placHoderLB.font = [[KDFont sharedKDFont]getF30Font];
    _placHoderLB.textColor = [KDColor getX0Color];
    _placHoderLB.text = @"报名职员";
    [backWhiteView addSubview:_placHoderLB];
    [_placHoderLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    
    self.titleLB = [UILabel new];
    [self.contentView addSubview:_titleLB];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.text = @"报名志愿";
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(shadowView.mas_top).mas_equalTo(-10);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCBaoMingModel *model = viewModel;
    _titleLB.text = model.title;
    _placHoderLB.text = model.canShu ? model.canShu : model.placeholderTitle;
    if (model.canShu) {
        _placHoderLB.textColor = [KDColor getC2Color];
    }
}
@end
