//
//  LCPublicVoucherCell.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPublicVoucherCell.h"

@implementation LCPublicVoucherCell
-(void)setupViews{
    
    
    UIImageView *backImage = [UIImageView new];
    backImage.image = [UIImage imageNamed:@"kaquan"];
    [self.contentView addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(15);
        make.bottom.mas_offset(0);
    }];
    
    self.leftLB = [UILabel new];
    _leftLB.text = @"¥";
    _leftLB.font = [[KDFont sharedKDFont] getF34Font];
    _leftLB.textColor = [KDColor getC28Color];
    [backImage addSubview:_leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(25);
    }];
    
    self.rightLB = [UILabel new];
    _rightLB.text = @"10";
    _rightLB.font = [[KDFont sharedKDFont] getF50Font];
    _rightLB.textColor = [KDColor getC28Color];
    [backImage addSubview:_rightLB];
    [_rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.leftLB);
        make.left.mas_equalTo(self.leftLB.mas_right).mas_offset(0);
    }];
    
    UIView *uuu = [UIView new];
    [backImage addSubview:uuu];
    [uuu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_equalTo(self.rightLB.mas_right).mas_offset(25);
    }];
    
    uuu.backgroundColor = [UIColor orangeColor];
    self.topLB = [UILabel new];
    _topLB.text = @"购买课程";
    _topLB.textColor = [KDColor getC2Color];
    _topLB.font = [[KDFont sharedKDFont] getF30Font];
    [uuu addSubview:_topLB];
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(5);
        make.top.mas_offset(0);
    }];
    

    self.conditionLB = [UILabel new];
    _conditionLB.text = @"._conditionLB";
    _conditionLB.textColor = [KDColor getX0Color];
    _conditionLB.font = [[KDFont sharedKDFont] getF22Font];
    [uuu addSubview:_conditionLB];
    [_conditionLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_equalTo(self.topLB.mas_bottom).mas_offset(5);
    }];
    
    self.timeLB = [UILabel new];
    _timeLB.text = @"._conditionLB========";
    _timeLB.textColor = [KDColor getX0Color];
    _timeLB.font = [[KDFont sharedKDFont] getF22Font];
    [uuu addSubview:_timeLB];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_equalTo(self.conditionLB.mas_bottom).mas_offset(5);
        make.bottom.mas_offset(0);
        make.right.mas_offset(0);
    }];
    
    self.shiyongBT = [UIButton new];
    [self.shiyongBT setTitle:@"使用" forState:0];
    self.shiyongBT.titleLabel.font = [[KDFont sharedKDFont] getF30Font];
    self.shiyongBT.backgroundColor = [KDColor getC28Color];
    self.shiyongBT.layer.cornerRadius = 25/2;
    [backImage addSubview:self.shiyongBT];
    [_shiyongBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.right.mas_offset(-15);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(25);
    }];
}


-(void)bindViewModel:(id)viewModel{

}

@end
