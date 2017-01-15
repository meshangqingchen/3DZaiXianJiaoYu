//
//  LCCourseCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseCell.h"
#import "LCCourseCellSonViewModel.h"
#import "LCCourseCellViewModel.h"
@implementation LCCourseCell

-(void)setupViews{
    self.videoImageView = [UIImageView new];
    
    [self.contentView addSubview:self.videoImageView];
    [self.videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(12);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(71);
    }];
    
    self.titleLB = [UILabel new];
    self.titleLB.text = @"卧槽";
    [self.contentView addSubview:self.titleLB];
    self.titleLB.font = [[KDFont sharedKDFont]getF28Font];
    self.titleLB.textColor = [KDColor getC2Color];
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.videoImageView.mas_right).mas_offset(15);
        make.top.mas_equalTo(12);
    }];
    
    self.timeLB = [UILabel new];
    self.timeLB.text = @"更新时间:1200-12-12";
    [self.contentView addSubview:self.timeLB];
    self.timeLB.font = [[KDFont sharedKDFont]getF24Font];
    self.timeLB.textColor = [KDColor getX0Color];
    [self.timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.bottom.mas_equalTo(self.videoImageView);
    }];
    

}

-(void)bindViewModel:(id)viewModel{
    
    LCCourseCellViewModel *cellVM = viewModel;
    self.titleLB.text = cellVM.title;
    self.timeLB.text = cellVM.creatTime;
    [self.videoImageView setImageWithURL:cellVM.imageURL placeholder:[UIImage imageNamed:@""]];
    
}
@end
