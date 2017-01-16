//
//  LCCourseCollectionCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseCollectionCell.h"
#import "LCCourseCollectionCellViewModel.h"
@implementation LCCourseCollectionCell

-(void)setupViews{
    self.bacKimageView = [UIImageView new];
    _bacKimageView.backgroundColor = [KDColor getC5Color];
    [self.contentView addSubview:_bacKimageView];
    _bacKimageView.frame = CGRectMake(0, 0, (SCREEN_WIDTH-16-9)/2, (SCREEN_WIDTH-16-9)/2/350*200);
    _bacKimageView.image = [UIImage imageNamed:@"video_test"];

    
    self.titleLB  = [UILabel new];
    [self.contentView addSubview:_titleLB];
    _titleLB.font = [[KDFont sharedKDFont]getF26Font];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.left = 0;
    _titleLB.top = _bacKimageView.bottom+9;
    _titleLB.width = (SCREEN_WIDTH-16-9)/2;
    _titleLB.height = 12;
    _titleLB.text = @"玫瑰花制作入门";
    
    self.nameLB = [UILabel new];
    [self.contentView addSubview:_nameLB];
    _nameLB.left = 0;
    _nameLB.top = _titleLB.bottom + 5;
    _nameLB.width = (SCREEN_WIDTH-16-9)/2;
    _nameLB.height = 11.5;
    _nameLB.font = [[KDFont sharedKDFont]getF26Font];
    _nameLB.textColor = [KDColor getC3Color];
    _nameLB.text = @"";
    
}

-(void)bindViewModel:(id)viewModel{
    LCCourseCollectionCellViewModel *cellVM  = viewModel;
    self.titleLB.text = cellVM.title;
    [self.bacKimageView setImageWithURL:cellVM.imageURL placeholder:nil];
}
@end
