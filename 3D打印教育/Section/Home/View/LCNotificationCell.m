//
//  LCNotificationCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNotificationCell.h"
#import "LCNotificationCellViewModel.h"
@implementation LCNotificationCell

-(void)setupViews{

    self.nickName = [UILabel new];
    _nickName.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_nickName];
    _nickName.font = [[KDFont sharedKDFont] getF24Font];
    _nickName.frame = CGRectMake(15, 20, SCREEN_WIDTH-15, 15);
    _nickName.textAlignment = NSTextAlignmentLeft;
    
    self.detailLB = [YYLabel new];
    [self.contentView addSubview:_detailLB];
    _detailLB.left = _nickName.left;
    _detailLB.width = SCREEN_WIDTH-30;
    _detailLB.top = _nickName.bottom+15;
    
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
    LCNotificationCellViewModel *notificationCellVM = viewModel;
    self.detailLB.height = notificationCellVM.detail_H;
    
    _detailLB.backgroundColor = [UIColor yellowColor];
    if (notificationCellVM.ifReaded) {
        //根据数据 填充颜色
    }else{
        
    }

    _nickName.text = notificationCellVM.nickName;
    _detailLB.textLayout = notificationCellVM.detailLayout;
    _timeLB.text = notificationCellVM.timeStr;

}
@end
