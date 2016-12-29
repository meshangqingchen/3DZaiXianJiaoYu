//
//  LCMessageCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMessageCell.h"
#import "LCMessageCellViewModel.h"
@implementation LCMessageCell

-(void)setupViews{
    self.headerImageV = [UIImageView new];
    _headerImageV.backgroundColor = [UIColor orangeColor];
    _headerImageV.frame = CGRectMake(15, 10, 30, 30);
    [self.contentView addSubview:_headerImageV];
    
    self.nickName = [UILabel new];
    _nickName.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_nickName];
    _nickName.font = [[KDFont sharedKDFont] getF24Font];
    _nickName.frame = CGRectMake(_headerImageV.right+5, 14, SCREEN_WIDTH-50, 15);
    _nickName.textAlignment = NSTextAlignmentLeft;
    
    self.detailLB = [YYLabel new];
    [self.contentView addSubview:_detailLB];
    _detailLB.left = _nickName.left;
    _detailLB.width = SCREEN_WIDTH-70;
    _detailLB.top = _nickName.bottom+14;
    
    self.timeLB = [UILabel new];
    _timeLB.text = @"12-12 17:16";
    _timeLB.textColor = [KDColor getX0Color];
    _timeLB.font = [[KDFont sharedKDFont]getF24Font];
    [self.contentView addSubview:_timeLB];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.detailLB);
        make.top.mas_equalTo(self.detailLB.mas_bottom).mas_equalTo(10);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC7Color];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeLB);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    LCMessageCellViewModel *messageCellVM = viewModel;
    self.detailLB.height = messageCellVM.detail_H;

    _nickName.text = messageCellVM.nickName;
    _detailLB.textLayout = messageCellVM.detailLayout;

    _detailLB.backgroundColor = [UIColor yellowColor];
    if (messageCellVM.ifReaded) {
        
    }else{
    
    }
}
@end
