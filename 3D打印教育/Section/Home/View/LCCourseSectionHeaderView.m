//
//  LCCourseSectionHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseSectionHeaderView.h"
#import "LCCourseCellViewModel.h"
@implementation LCCourseSectionHeaderView

-(void)setupViews{
    self.contentView.backgroundColor = [UIColor redColor];
    self.titleLB = [UILabel new];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    
    UIView *backView = [UIView new];
    [self.contentView addSubview:backView];
    backView.backgroundColor = [KDColor getC9Color];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    UIView *leftLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, 35)];
    leftLineView.backgroundColor = [KDColor getX1Color];
    [backView addSubview:leftLineView];
    [backView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    LCCourseCellViewModel *cellViewModel = viewModel;
    self.titleLB.text = cellViewModel.title;
}
@end
