//
//  LCBigImageCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBigImageCollectionViewCell.h"
#import "LCHomeCollectionCellModel.h"
@implementation LCBigImageCollectionViewCell

-(void)setupViews{
    self.backImageView = [UIImageView new];
    [self.contentView addSubview:self.backImageView];
    self.backImageView.backgroundColor = [KDColor getC26Color];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_offset(-10);
    }];
    self.backImageView.backgroundColor = [UIColor greenColor];
}

-(void)bindViewModel:(id)viewModel{
    LCHomeCollectionCellModel * homeCellVM = viewModel;
    [self.backImageView setImageWithURL:homeCellVM.bigImgURL placeholder:[UIImage imageNamed:@""]];
}

@end
