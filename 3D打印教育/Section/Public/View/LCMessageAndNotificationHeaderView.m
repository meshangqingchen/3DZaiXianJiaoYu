//
//  LCMessageAndNotificationHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMessageAndNotificationHeaderView.h"

@implementation LCMessageAndNotificationHeaderView
-(void)setupViews{
    self.tagBT = [UIButton new];
    [self addSubview:_tagBT];
    [_tagBT setTitle:@"全部标记为已读" forState:0];
    _tagBT.titleLabel.font = [[KDFont sharedKDFont]getF26Font];
    [_tagBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(107);
        make.height.mas_equalTo(28);
    }];
    _tagBT.layer.cornerRadius = 3;
    _tagBT.layer.borderWidth = 1;
    
    _tagBT.layer.borderColor = [KDColor getC2Color].CGColor;
    [_tagBT setTitleColor:[KDColor getC2Color] forState:0];
    
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    lineView.backgroundColor = [KDColor getC7Color];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)bindViewModel:(id)viewModel{
//根据数据设置 按钮字体颜色. 还有是否可以点击
}
@end
