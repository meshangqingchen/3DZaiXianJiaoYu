//
//  LCCourseDownLoadHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/27.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseDownLoadHeaderView.h"

@implementation LCCourseDownLoadHeaderView

-(void)setupViews{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, 35)];
    backView.backgroundColor = [KDColor getC9Color];
    [self addSubview:backView];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getX1Color];
    [backView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(2);
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    _titleLB.text = @"学习打印机初级课程";
    [backView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
}

-(void)bindViewModel:(id)viewModel{

}
@end
