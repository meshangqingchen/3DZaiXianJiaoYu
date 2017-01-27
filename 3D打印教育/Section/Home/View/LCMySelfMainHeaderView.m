//
//  LCMySelfMainHeaderView.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMySelfMainHeaderView.h"

@implementation LCMySelfMainHeaderView
-(void)setupViews{
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/75*39)];
    backImageView.image = [UIImage imageNamed:@"myself_header"];
    [self addSubview:backImageView];
    
    
    self.headImageView = [UIImageView new];
    [self addSubview:_headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.height.mas_equalTo(55);
    }];
    
    self.nickNameLB = [UILabel new];
    _nickNameLB.textColor = [KDColor getC0Color];
    _nickNameLB.font = [[KDFont sharedKDFont]getF24Font];
    [self addSubview:_nickNameLB];
    [_nickNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headImageView.mas_bottom).mas_equalTo(10);
        make.centerX.mas_equalTo(0);
    }];
}


-(void)bindViewModel:(id)viewModel{
    _nickNameLB.text = @"我是名字";
}
@end
