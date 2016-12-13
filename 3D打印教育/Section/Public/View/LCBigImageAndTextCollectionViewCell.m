//
//  LCBigImageAndTextCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBigImageAndTextCollectionViewCell.h"

@implementation LCBigImageAndTextCollectionViewCell

-(void)setupViews{
    self.backImageView = [UIImageView new];
    [self.contentView addSubview:_backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo((SCREEN_WIDTH-30)*27/69);
    }];
    self.backImageView.backgroundColor = [UIColor redColor];
    
    self.titleLB = [UILabel new];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF28Font];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.backImageView.mas_bottom).mas_offset(10);
    }];
}

-(void)bindViewModel:(id)viewModel{}
@end
