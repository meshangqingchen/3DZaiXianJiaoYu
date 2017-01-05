//
//  LCDetailEvaluateCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/21.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCDetailEvaluateCell.h"
#import "LCEvaluateDetailCellViewModel.h"

@implementation LCDetailEvaluateCell
-(void)setupViews{
    
    self.contentView.backgroundColor = [KDColor getC9Color];
    self.headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    _headerImgView.backgroundColor = [UIColor orangeColor];
    
    [self.contentView addSubview:_headerImgView];
    
    self.nameLB = [UILabel new];
    [self.contentView addSubview:_nameLB];
    _nameLB.textColor = [KDColor getC2Color];
    _nameLB.font = [[KDFont sharedKDFont]getF28Font];
    _nameLB.left = _headerImgView.right+15;
    _nameLB.top = 21;
    _nameLB.width = 200;
    _nameLB.height = 15;
    _nameLB.backgroundColor = [UIColor yellowColor];
    
    
    self.timeLB = [UILabel new];
    [self.contentView addSubview:_timeLB];
    _timeLB.backgroundColor = [UIColor blueColor];
    _timeLB.text = @"12-13 11:49";
    _timeLB.font = [[KDFont sharedKDFont]getF28Font];
    _timeLB.textColor = [KDColor getX0Color];
    _timeLB.left = _nameLB.left;
    _timeLB.top = _nameLB.bottom+3;
    _timeLB.height = 15;
    _timeLB.width = 200;
    
    self.huifuBT = [UIButton new];
    [self.contentView addSubview:_huifuBT];
    _huifuBT.backgroundColor = [UIColor orangeColor];
    _huifuBT.top = 21;
    _huifuBT.width = 30;
    _huifuBT.height = 15;
    _huifuBT.right = SCREEN_WIDTH-25;
    _huifuBT.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _huifuBT.titleLabel.font = [[KDFont sharedKDFont]getF28Font];
    [_huifuBT setTitle:@"回复" forState:0];
    [_huifuBT setTitleColor:[KDColor getX0Color] forState:0];
    @weakify(self)
    [_huifuBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        MYLog(@"回复事件");
        
    }];
    
    self.evaYLB = [YYLabel new];
    [self.contentView addSubview:_evaYLB];
    _evaYLB.backgroundColor = [UIColor redColor];
    _evaYLB.top = _timeLB.bottom+21;
    _evaYLB.left = 70;
    _evaYLB.width = SCREEN_WIDTH-70-25;

}


-(void)bindViewModel:(id)viewModel{
    LCEvaluateDetailCellViewModel *evaDetailCellVM = viewModel;
    self.evaYLB.height = evaDetailCellVM.detail_H;
    
    self.nameLB.text = evaDetailCellVM.name;
    self.timeLB.text = evaDetailCellVM.time;
    self.evaYLB.textLayout = evaDetailCellVM.detailLayout;
    
}

@end
