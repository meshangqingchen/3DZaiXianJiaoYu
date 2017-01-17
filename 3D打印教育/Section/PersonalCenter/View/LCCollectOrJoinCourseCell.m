//
//  LCCollectOrJoinCourseCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCollectOrJoinCourseCell.h"
#import "LCCollectCellViewModel.h"
#import "LCJoinCellViewModel.h"

@implementation LCCollectOrJoinCourseCell
-(void)setupViews{
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [KDColor getC0Color];
    [self.contentView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.top.mas_offset(5);
    }];
    
    
    self.leftImageView = [UIImageView new];
    _leftImageView.backgroundColor = [KDColor getC5Color];
    [backView addSubview:_leftImageView];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 70));
    }];
    
    self.topLB = [UILabel new];
    _topLB.textColor = [KDColor getC2Color];
    _topLB.font = [[KDFont sharedKDFont]getF28Font];
    _topLB.text = @"";
    [backView addSubview:_topLB];
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(20);
        make.top.mas_equalTo(self.leftImageView);
    }];
    
    self.middleLB = [UILabel new];
    _middleLB.textColor = [KDColor getC3Color];
    _middleLB.font = [[KDFont sharedKDFont]getF28Font];
    _middleLB.text = @"";
    [backView addSubview:_middleLB];
    [_middleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(20);
        make.centerY.mas_equalTo(self.leftImageView);
    }];
    
    self.bottomLB = [UILabel new];
    _bottomLB.textColor = [KDColor getC3Color];
    _bottomLB.font = [[KDFont sharedKDFont]getF28Font];
    _bottomLB.text = @"";
    [backView addSubview:_bottomLB];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(20);
        make.bottom.mas_equalTo(self.leftImageView);
    }];
}

-(void)bindViewModel:(id)viewModel{
    if ([NSStringFromClass([viewModel class]) isEqualToString:@"LCCollectCellViewModel"]) {
        LCCollectCellViewModel *collectVM = viewModel;
        self.topLB.text = collectVM.topStr;
        self.middleLB.text = collectVM.middleStr;
        self.bottomLB.text = collectVM.bottomStr;
        [self.leftImageView setImageURL:collectVM.leftImageURL];
    }else{
        LCJoinCellViewModel *joinVM = viewModel;
        self.topLB.text = joinVM.topStr;
        self.middleLB.text = joinVM.middleStr;
        self.bottomLB.text = joinVM.bottomStr;
        [self.leftImageView setImageURL:joinVM.leftImageURL];
    }
    
}

@end
