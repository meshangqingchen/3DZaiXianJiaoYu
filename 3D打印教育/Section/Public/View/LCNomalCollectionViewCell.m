//
//  LCNomalCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNomalCollectionViewCell.h"
#import "LCHomeCollectionCellModel.h"

@implementation LCNomalCollectionViewCell


-(void)setupViews{
    self.backImageView = [UIImageView new];
    [self.contentView addSubview:_backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(NORMALE_COLLECTIONCELL_W*200/335);
    }];
    self.backImageView.backgroundColor = [UIColor yellowColor];
    
    self.titleLB = [UILabel new];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF28Font];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.backImageView.mas_bottom).mas_offset(10);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCHomeCollectionCellModel * homeCellVM = viewModel;
    self.titleLB.text = homeCellVM.title;
    [self.backImageView setImageWithURL:homeCellVM.smallImgURL placeholder:[UIImage imageNamed:@""]];
};

@end
