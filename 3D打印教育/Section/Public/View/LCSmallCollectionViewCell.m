//
//  LCSmallCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSmallCollectionViewCell.h"
#import "LCHomeSmallCollectionCellModel.h"
@implementation LCSmallCollectionViewCell
-(void)setupViews{
    
//    self.backgroundCol 
//    self.contentView.backgroundColor = [UIColor grayColor];
    self.backImageView = [UIImageView new];
//    self.backImageView.backgroundColor = [KDColor getC26Color];
    [self.contentView addSubview:_backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.centerX.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.text = @"软件课程";
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF24Font];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(0);
        make.centerX.mas_offset(0);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCHomeSmallCollectionCellModel *cellVM = viewModel;
    self.titleLB.text = cellVM.title;
    [self.backImageView setImageWithURL:cellVM.smallImgURL placeholder:[[UIImage imageWithColor:[KDColor getC26Color] size:CGSizeMake(50, 50)]imageByRoundCornerRadius:25]];
}

@end
