//
//  LCTeacherCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCounseTeacherCell.h"
#import "LCCounselTeacherCellViewModel.h"
#import "LCAboutYYWebImage.h"
@implementation LCCounseTeacherCell

-(void)setupViews{
    UIView *shadowView = [UIView new];
    shadowView.layer.cornerRadius = 3.5;
    shadowView.layer.shadowOpacity = 0.5;
    shadowView.layer.shadowOffset = CGSizeMake(0, 1);
    shadowView.layer.backgroundColor = [KDColor getC2Color].CGColor;
    [self.contentView addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(6);
        make.right.mas_equalTo(-6);
        make.bottom.mas_equalTo(-1);
    }];
    
    UIView *cardView = [UIView new];
    cardView.backgroundColor = [UIColor whiteColor];
    cardView.layer.cornerRadius = 4;
    [self.contentView addSubview:cardView];
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.bottom.mas_equalTo(0);
    }];
    
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 55, 55)];;
    [cardView addSubview:_headImageView];
    
    // 15
    self.nickNameLB = [[UILabel alloc]initWithFrame:CGRectMake(_headImageView.right+10, 20, 100, 14)];
    [cardView addSubview:_nickNameLB];
    _nickNameLB.textColor = [KDColor getC2Color];
    _nickNameLB.font = [[KDFont sharedKDFont]getF28Font];

    self.bottomLB = [UILabel new];
    _bottomLB.text = @"中国3D打印机的前途之无限想象";
    [cardView addSubview:_bottomLB];
    _bottomLB.textColor = [KDColor getC2Color];
    _bottomLB.font = [[KDFont sharedKDFont]getF26Font];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLB);
        make.right.mas_offset(-25);
        make.bottom.mas_equalTo(-25);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    LCCounselTeacherCellViewModel *cellVM = viewModel;
    [self.headImageView setImageWithURL:cellVM.headInageURL
                         placeholder:[UIImage imageNamed:@""]
                             options:kNilOptions
                             manager:[LCAboutYYWebImage avatarImageManager2]
                            progress:nil
                           transform:nil
                          completion:nil];
    self.nickNameLB.text = cellVM.nickName;
    self.bottomLB.text = cellVM.shortDis;
}

@end
