//
//  LCMemberCell.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberCell.h"

@implementation LCMemberCell

-(void)setupViews{
    self.backgroundColor = [KDColor getC0Color];
    self.leftLB = [UILabel new];
    _leftLB.font = [[KDFont sharedKDFont] getF30Font];
    _leftLB.textColor = [KDColor getC2Color];
    _leftLB.text = @"一个月/33元";
    [self.contentView addSubview:_leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(15);
    }];
    
    self.rightBT = [UIButton new];
    _rightBT.backgroundColor = [KDColor getC21Color];
    _rightBT.titleLabel.font = [[KDFont sharedKDFont] getF28Font];
    _rightBT.layer.cornerRadius = 12.5;
    [_rightBT setTitle:@"续费" forState:0];
    [self.contentView addSubview:_rightBT];
    [_rightBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.right.mas_offset(-15);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
}


-(void)bindViewModel:(id)viewModel{

}
@end
