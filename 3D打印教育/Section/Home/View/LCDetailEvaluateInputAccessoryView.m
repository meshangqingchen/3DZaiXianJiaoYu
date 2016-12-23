//
//  LCDetailEvaluateInputAccessoryView.m
//  3D打印教育
//
//  Created by 3D on 16/12/22.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCDetailEvaluateInputAccessoryView.h"

@implementation LCDetailEvaluateInputAccessoryView
-(void)setupViews{
    self.backgroundColor = [KDColor getC9Color];
    self.textView = [[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 75)];
    
    _textView.placeholder = @"写评论...";
    _textView.layer.cornerRadius = 4;
    _textView.layer.borderWidth = 0.5;
    _textView.layer.borderColor = [KDColor getC12Color].CGColor;
    _textView.font = [[KDFont sharedKDFont]getF30Font];
    _textView.textColor = [KDColor getC2Color];
    _textView.placeholderColor = [KDColor getX0Color];
    [self addSubview:_textView];
    
    self.fasongBT = [UIButton new];
    _fasongBT.layer.cornerRadius = 3;
    _fasongBT.backgroundColor = [KDColor getC13Color];
    _fasongBT.titleLabel.font = [[KDFont sharedKDFont]getF28Font];
    [_fasongBT setTitle:@"发送" forState:0];
    [_fasongBT setTitleColor:[KDColor getC0Color] forState:0];
    [self addSubview:_fasongBT];
    [_fasongBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.textView.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(28);
        make.width.mas_equalTo(50);
    }];
    
}
@end
