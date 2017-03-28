//
//  LCPeixunClassCell.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//
#import "LCAboutYYWebImage.h"
#import "LCPeixunClassCell.h"
#import "LCPiexunClassCellViewModel.h"
@implementation LCPeixunClassCell

- (void)setupViews{
    
    self.contentView.backgroundColor = [KDColor getC12Color];
    self.backImageV = [UIImageView new];
    
//    _backImageV.layer.cornerRadius = 4;
    [self.contentView addSubview:_backImageV];
    [_backImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.bottom.mas_offset(0);
        make.top.mas_offset(15);
    }];
    
    self.introduceLB = [UILabel new];
    _introduceLB.textColor = [KDColor getC2Color];
    _introduceLB.font = [[KDFont sharedKDFont] getF44Font];
//    _introduceLB.text = @"3D打印机特色班";
    [self.backImageV addSubview:_introduceLB];
    [_introduceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(22);
        make.top.mas_offset(45);
    }];
    
    self.priceLB = [UILabel new];
    [self.backImageV addSubview:_priceLB];
//    _priceLB.text = @"3800";
    _priceLB.textColor = [KDColor getC31Color];
    _priceLB.font = [[KDFont sharedKDFont] getF40Font];
    [self.backImageV addSubview:_priceLB];
    [_priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.introduceLB.mas_bottom).mas_offset(7);
        make.left.mas_equalTo(self.introduceLB.mas_left).mas_equalTo(0);
    }];
    
    self.timeLB = [UILabel new];
//    _timeLB.text = @"元/5天";
    _timeLB.textColor = [KDColor getC31Color];
    _timeLB.font = [[KDFont sharedKDFont] getF30Font];
    [self.backImageV addSubview:_timeLB];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.priceLB.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.priceLB.mas_right).mas_equalTo(-1);
    }];
}

- (void)bindViewModel:(id)viewModel{
    LCPiexunClassCellViewModel *cellVN = viewModel;
    
    [self.backImageV setImageWithURL:cellVN.imgURL 
                            placeholder:[UIImage imageNamed:@""]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager3]
                               progress:nil
                              transform:nil
                          completion:nil];
    
    
    [self.backImageV setImageWithURL:cellVN.imgURL placeholder:nil];
    self.introduceLB.text = cellVN.name;
    self.priceLB.text = cellVN.price;
    self.timeLB.text = [NSString stringWithFormat:@"元/%@天",cellVN.long_time];
}
@end
