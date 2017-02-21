//
//  LCPersonalCenterCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPersonalCenterCell.h"
#import "LCPersonalCenterCellViewModel.h"
@implementation LCPersonalCenterCell

-(void)setupViews{
    
    self.contentView.backgroundColor = [KDColor getC0Color];
    
    UIImage *image = [UIImage imageNamed:@"gerendongtai"];
    MYLog(@"++++++===++++ %@",NSStringFromCGSize(image.size));
    MYLog(@"++++++===++++ %@",NSStringFromCGSize(image.size));
    MYLog(@"++++++===++++ %@",NSStringFromCGSize(image.size));
    self.leftImageView = [UIImageView new];
    [self.contentView addSubview:_leftImageView];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(image.size);
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.font = [[KDFont sharedKDFont]getF28Font];
    _titleLB.textColor = [KDColor getC3Color];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(5);
        make.centerY.mas_offset(0);
    }];
    UIImage *rightImge = [UIImage imageNamed:@"danjiantou"];
    self.riimageView = [UIImageView new];
    _riimageView.image = rightImge;
    [self.contentView addSubview:_riimageView];
    [_riimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(rightImge.size);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC7Color];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCPersonalCenterCellViewModel *cellVM = viewModel;
    self.leftImageView.image = [UIImage imageNamed:cellVM.imageName];
    self.titleLB.text = cellVM.titleName;
}
@end
