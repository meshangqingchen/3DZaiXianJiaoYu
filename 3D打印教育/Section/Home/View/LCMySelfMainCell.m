//
//  LCMySelfMainCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMySelfMainCell.h"
#import "LCMySelfMainCellViewModel.h"
@implementation LCMySelfMainCell

-(void)setupViews{
    UIView *shadowView = [UIView new];
    shadowView.layer.cornerRadius = 3.5;
    shadowView.layer.shadowOpacity = 0.5;
    shadowView.layer.shadowOffset = CGSizeMake(0, 1);
//    shadowView.layer.shadowColor = [UIColor redColor].CGColor;
    shadowView.layer.backgroundColor = [KDColor getC2Color].CGColor;
    [self.contentView addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(11);
        make.right.mas_equalTo(-11);
        make.bottom.mas_equalTo(-1);
    }];
    
    UIView *cardView = [UIView new];
    cardView.backgroundColor = [UIColor whiteColor];
    cardView.layer.cornerRadius = 4;
    [self.contentView addSubview:cardView];
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(0);
    }];
    
    
    self.headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];;
    self.headerImageView.backgroundColor = [UIColor orangeColor];
    [cardView addSubview:_headerImageView];
    
    // 15
    self.nickNameLB = [[UILabel alloc]initWithFrame:CGRectMake(_headerImageView.right+15, 22, 100, 14)];
    [cardView addSubview:_nickNameLB];
    _nickNameLB.textColor = [KDColor getC2Color];
    _nickNameLB.font = [[KDFont sharedKDFont]getF28Font];
    _nickNameLB.backgroundColor = [UIColor orangeColor];
    //15
    self.timeLB =[[UILabel alloc]initWithFrame:CGRectMake(_nickNameLB.left, _nickNameLB.bottom+5, 100, 14)];
    [cardView addSubview:_timeLB];
    _timeLB.backgroundColor = [UIColor orangeColor];
    _timeLB.font = [[KDFont sharedKDFont]getF28Font];
    _timeLB.textColor = [KDColor getX0Color];//
    
    self.evaDetailLB = [YYLabel new];
    _evaDetailLB.backgroundColor = [UIColor yellowColor];
    [cardView addSubview:_evaDetailLB];
    _evaDetailLB.left = 65;
    _evaDetailLB.top = _timeLB.bottom+21;
    _evaDetailLB.width = SCREEN_WIDTH-70-25;
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [KDColor getC9Color];
    [cardView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(65);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.evaDetailLB.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(45);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    LCMySelfMainCellViewModel *cellVM = viewModel;
    _evaDetailLB.height = cellVM.evaDetail_H;
    
    
    
    _evaDetailLB.textLayout = cellVM.evaDetailLayout;
    _nickNameLB.text = cellVM.nickName;
    _timeLB.text = cellVM.timeStr;
    
}
@end
