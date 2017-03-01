//
//  LCSmallCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSmallCollectionViewCell.h"
#import "LCHomeSmallCollectionCellModel.h"

@interface LCSmallCollectionViewCell ()
@property(nonatomic,strong) UIView *bottomLineView;
@property(nonatomic,strong) UIView *rightLineView;
@end

@implementation LCSmallCollectionViewCell
-(void)setupViews{
    
//    self.backgroundCol 
//    self.contentView.backgroundColor = [UIColor grayColor];
    self.backImageView = [UIImageView new];
//    self.backImageView.backgroundColor = [KDColor getC26Color];
    [self.contentView addSubview:_backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.centerX.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.text = @"软件课程";
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF24Font];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-10);
        make.centerX.mas_offset(0);
        //我的课程
    }];


  
    self.bottomLineView = [UIView new];
    _bottomLineView.backgroundColor = [KDColor getX0Color];
    [self.contentView addSubview:_bottomLineView];

    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.4);
    }];
    
    self.rightLineView = [UIView new];
    _rightLineView.backgroundColor = [KDColor getX0Color];
    [self.contentView addSubview:_rightLineView];
    
    [_rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.top.mas_offset(0);
        make.width.mas_equalTo(0.4);
    }];
    
}

-(void)bindViewModel:(id)viewModel AndIndexPath:(NSIndexPath *)indexPath andDateCount:(NSInteger)num{
    
    if (num % 3 == 0) {
        if (num - indexPath.row < 4) {
            self.bottomLineView.hidden  = YES;
        }else{
            self.bottomLineView.hidden  = NO;
        }
    }else if (num % 3 == 1){
        if (num - indexPath.row < 2) {
            self.bottomLineView.hidden  = YES;
        }else{
            self.bottomLineView.hidden  = NO;
        }
    }else if (num %3 == 2){
        if (num - indexPath.row < 3) {
            self.bottomLineView.hidden  = YES;
        }else{
            self.bottomLineView.hidden  = NO;
        }
    }
    
    LCHomeSmallCollectionCellModel *cellVM = viewModel;
    self.titleLB.text = cellVM.title;
    [self.backImageView setImageWithURL:cellVM.smallImgURL placeholder:[[UIImage imageWithColor:[KDColor getC26Color] size:CGSizeMake(50, 50)]imageByRoundCornerRadius:25]];
}
@end
