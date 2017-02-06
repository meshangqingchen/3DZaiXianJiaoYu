//
//  LCChangePasswordCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCChangePasswordCell.h"

@implementation LCChangePasswordCell

-(void)setupViews{
    self.contentView.backgroundColor = [KDColor getC0Color];
    
    self.leftLB = [UILabel new];
    _leftLB.font = [[KDFont sharedKDFont]getF28Font];
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
    
    
    UIView *lineView = [UIView new];
    [self.contentView addSubview:lineView];
    lineView.backgroundColor = [KDColor getC7Color];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];

}

-(void)bindViewModel:(id)viewModel{
    //@{@"leftTitle":@"使用当前密码验证"}
    NSDictionary *dic = viewModel;
    self.leftLB.text = dic[@"leftTitle"];
}
@end
