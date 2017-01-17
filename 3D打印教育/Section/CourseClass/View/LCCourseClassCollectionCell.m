//
//  LCCourseClassCollectionCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassCollectionCell.h"
#import "LCCourseClassSCellViewModel.h"
@implementation LCCourseClassCollectionCell


-(void)setupViews{
    self.contentView.backgroundColor = [KDColor getC0Color];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC7Color];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.titleLB = [UILabel new];
    [self.contentView addSubview:_titleLB];
    _titleLB.textColor = [KDColor getC3Color];
    _titleLB.font = [[KDFont sharedKDFont] getF28Font];
    _titleLB.textAlignment = NSTextAlignmentCenter;
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCCourseClassSCellViewModel *scellVM = viewModel;
    self.titleLB.text = scellVM.title;
}
@end
