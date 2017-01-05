//
//  LCUserTeacherTalkBottomView.m
//  3D打印教育
//
//  Created by 3D on 17/1/3.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUserTeacherTalkBottomView.h"

@implementation LCUserTeacherTalkBottomView

-(void)setupViews{
    
    self.backgroundColor = [KDColor getC9Color];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC15Color];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.fasongBT = [UIButton new];
    [self addSubview:_fasongBT];
    [_fasongBT setTitle:@"发送" forState:0];
    [_fasongBT setTitleColor:[KDColor getC0Color] forState:0];
    _fasongBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    _fasongBT.backgroundColor = [KDColor getC15Color];
    _fasongBT.layer.cornerRadius = 4;
    [_fasongBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-11);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(28);
    }];
    
    self.textView = [YYTextView new];
    self.textView.layer.cornerRadius = 4;
    self.textView.layer.borderColor = [KDColor getC12Color].CGColor;
    [self addSubview:_textView];
    _textView.backgroundColor = [KDColor getC0Color];
    _textView.font = [[KDFont sharedKDFont]getF28Font];
    _textView.textColor = [KDColor getC2Color];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(self.fasongBT.mas_left).mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(35);
    }];
    
}
@end
