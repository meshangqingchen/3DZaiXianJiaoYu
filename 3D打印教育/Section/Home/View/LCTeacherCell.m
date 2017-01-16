//
//  LCTeacherCell.m
//  无限教育
//
//  Created by 3D on 16/11/8.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCTeacherCell.h"
#import "LCAboutYYWebImage.h"
@implementation TeacherCellBackView

-(instancetype)init{
    if (self = [super init]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.nameLB = [YYLabel new];
    _nameLB.top = 14;
    _nameLB.width = 160;
    _nameLB.left = 15 + 40 +20;
    [self addSubview:_nameLB];
    
    self.headImageView = [UIImageView new];
    _headImageView.frame = CGRectMake(15, 10, 40, 40);
    [self addSubview:_headImageView];
    
    self.detailLB = [YYLabel new];
    _detailLB.left = _headImageView.right + 20;
    _detailLB.top = 32;
    _detailLB.width = SCREEN_WIDTH-150;
    
    [self addSubview:_detailLB];
    
    UIView *leftLineView = [UIView new];
    leftLineView.backgroundColor = [KDColor getC24Color];
    [self addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo(1);
    }];
}

-(void)bindViewModel:(id)viewModel{
    self.cellViewModel = viewModel;
    _nameLB.height = _cellViewModel.name_h;
    _nameLB.textLayout = _cellViewModel.nameTextLayout;
    _nameLB.textAlignment = NSTextAlignmentLeft;
    
    _detailLB.height = _cellViewModel.detail_h;
    _detailLB.textLayout = _cellViewModel.detailTextLayout;
    [_headImageView setImageWithURL:_cellViewModel.teacherHeadImageURL
                        placeholder:[UIImage imageNamed:@"cracking_image"]
                            options:kNilOptions
                            manager:[LCAboutYYWebImage avatarImageManager]
                           progress:nil
                          transform:nil
                         completion:nil];
    
}

@end

@implementation LCTeacherCell


-(void)setupViews{
    self.teacherCellBackView = [TeacherCellBackView new];
    _teacherCellBackView.backgroundColor = [UIColor whiteColor];
    _teacherCellBackView.top = 25/2;
    _teacherCellBackView.left = 40;
    _teacherCellBackView.width = SCREEN_WIDTH - 50;
    [self.contentView addSubview:_teacherCellBackView];
    
    UIImageView *circleImageView = [UIImageView new];
    [self.contentView addSubview:circleImageView];
    circleImageView.image = [UIImage imageNamed:@"teacher_circle_image"];
    [circleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_teacherCellBackView.mas_centerY).mas_equalTo(0);
        make.width.height.mas_equalTo(10);
        make.left.mas_equalTo(15);
    }];
    
    UIView *topVerticalLineView = [UIView new];
    topVerticalLineView.backgroundColor = [KDColor getC24Color];
    [self addSubview:topVerticalLineView];
    self.topVerticalLineView = topVerticalLineView;
    [topVerticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(7);
        make.width.mas_equalTo(1);
        make.centerX.mas_equalTo(circleImageView);
    }];
    
    UIView *verticalLineView = [UIView new];
    verticalLineView.backgroundColor = [KDColor getC24Color];
    [self addSubview:verticalLineView];
    [verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(1);
        make.centerX.mas_equalTo(circleImageView);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    self.cellViewModel = viewModel;
    _teacherCellBackView.height = self.cellViewModel.teacherBackView_h;
    [_teacherCellBackView bindViewModel:viewModel];
}

@end
