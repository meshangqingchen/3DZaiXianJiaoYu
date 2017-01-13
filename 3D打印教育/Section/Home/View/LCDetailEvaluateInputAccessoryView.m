//
//  LCDetailEvaluateInputAccessoryView.m
//  3D打印教育
//
//  Created by 3D on 16/12/22.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCDetailEvaluateInputAccessoryView.h"
#import <IQKeyboardManager.h>
@implementation LCDetailEvaluateInputAccessoryView
-(void)setupViews{
    
//    self.userInteractionEnabled = NO;
    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = NO;
    self.starView = [[KDFiveStarView alloc] initWithStarSelectedImgName:@"star_selected" unselectImgName:@"star_unselect" starWH:20.f starPadding:10];

    [self addSubview:_starView];
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(15);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(20);
    }];
    
    self.backgroundColor = [UIColor whiteColor];
    self.textView = [[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(15, 45, SCREEN_WIDTH-30, 75)];
    _textView.backgroundColor =[KDColor getC9Color];
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
    _fasongBT.backgroundColor = [KDColor getX1Color];
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
