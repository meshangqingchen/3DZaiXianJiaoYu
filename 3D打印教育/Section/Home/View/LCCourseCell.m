//
//  LCCourseCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseCell.h"
#import "LCCourseCellSonViewModel.h"
@implementation LCCourseCell

-(void)setupViews{
    self.contentView.backgroundColor = [UIColor yellowColor];
    self.titleLB = [UILabel new];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCCourseCellSonViewModel *sonCellViewModel = viewModel;
    _titleLB.text = sonCellViewModel.title;
}
@end
