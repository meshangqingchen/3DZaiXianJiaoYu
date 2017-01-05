//
//  LCMyCourseCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/4.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMyCourseCell.h"
#import "LCMyCourseCellViewModel.h"
@implementation LCMyCourseCell

-(void)setupViews{
    self.courseImageView = [UIImageView new];
    _courseImageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_courseImageView];
    [_courseImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(100);
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    _titleLB.text = @"3D课程法力无边";
    _titleLB.numberOfLines = 2;
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.courseImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-70);
    }];
    
    self.watchImageView = [UIImageView new];
    UIImage *image = [UIImage imageNamed:@"watch_image"];
    _watchImageView.image = image;
    [self.contentView addSubview:_watchImageView];
    [_watchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLB);
        make.bottom.mas_equalTo(-15);
        make.width.mas_equalTo(image.size.width);
        make.height.mas_equalTo(image.size.height);
    }];
    
    self.finishedLB = [UILabel new];
    _finishedLB.textColor = [KDColor getC18Color];
    _finishedLB.font = [[KDFont sharedKDFont]getF20Font];
    _finishedLB.text = @"已完成1/30";
    [self.contentView addSubview:_finishedLB];
    [_finishedLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.watchImageView);
        make.left.mas_equalTo(self.watchImageView.mas_right).mas_equalTo(5);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCMyCourseCellViewModel *cellVM = viewModel;
    self.titleLB.text = cellVM.title;
    self.finishedLB.text = cellVM.finishStr;
}
@end
