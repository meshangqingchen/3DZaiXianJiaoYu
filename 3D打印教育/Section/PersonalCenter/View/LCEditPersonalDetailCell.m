//
//  LCEditPersonalDetailCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/9.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCEditPersonalDetailCell.h"
#import "LCEditPersonalDetailCellViewModel.h"
@implementation LCEditPersonalDetailCell

-(void)setupViews{
   
    self.contentView.backgroundColor = [KDColor getC0Color];
    
    self.leftLB = [UILabel new];
    _leftLB.font = [[KDFont sharedKDFont]getF22Font];
    _leftLB.textColor = [KDColor getC2Color];
    [self.contentView addSubview:_leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    
    UIImageView *rightJinatoiuView = [UIImageView new];
    UIImage *rightJinatoiuImge = [UIImage imageNamed:@"danjiantou"];
    rightJinatoiuView.image = rightJinatoiuImge;
    [self.contentView addSubview:rightJinatoiuView];
    [rightJinatoiuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(rightJinatoiuImge.size);
    }];
    
    self.rightLB = [UILabel new];
    _rightLB.font = [[KDFont sharedKDFont]getF22Font];
    _rightLB.textColor = [KDColor getX0Color];
    [self.contentView addSubview:_rightLB];
    [_rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightJinatoiuView.mas_left).mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    
    self.headImageView = [UIImageView new];
    _headImageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightJinatoiuView.mas_left).mas_offset(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    UIView *lineView = [UIView new];
    [self.contentView addSubview:lineView];
    lineView.backgroundColor = [KDColor getC7Color];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];

}

-(void)bindViewModel:(id)viewModel{
    LCEditPersonalDetailCellViewModel *cellVM = viewModel;
    self.leftLB.text = cellVM.leftTitle;
    self.rightLB.text = cellVM.rightTitle;
    self.headImageView.hidden = cellVM.headerViewHidden;
}

@end
