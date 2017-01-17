//
//  LCBaoMingFooterView.m
//  无限教育
//
//  Created by 3D on 16/11/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBaoMingFooterView.h"

@interface LCBaoMingFooterView ()
<
UITextViewDelegate
>

@end

@implementation LCBaoMingFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    UILabel *remarkLB = [UILabel new];
    remarkLB.text = @"备注";
    remarkLB.textColor = [KDColor getC2Color];
    remarkLB.font = [[KDFont sharedKDFont]getF30Font];
    [self addSubview:remarkLB];
    [remarkLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(15);
    }];
    
    UILabel *xuanTian = [UILabel new];
    xuanTian.text = @":(选填)";
    xuanTian.textColor = [KDColor getX0Color];
    xuanTian.font = [[KDFont sharedKDFont]getF30Font];
    [self addSubview:xuanTian];
    [xuanTian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(remarkLB.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(15);
    }];
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [KDColor getC13Color];//
    shadowView.layer.cornerRadius = 5;
    [self addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(remarkLB.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(150);
    }];
    
    self.textView = [UITextView new];
    self.textView.delegate = self;
    [shadowView addSubview:_textView];
    _textView.backgroundColor = [KDColor getC12Color];
    _textView.textColor = [KDColor getX0Color];
    _textView.font = [[KDFont sharedKDFont]getF30Font];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5));
    }];
    
}

//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    !self.TextFiledDidEndDding ? : self.TextFiledDidEndDding(self.titleLB.

-(void)textViewDidEndEditing:(UITextView *)textView{
    !self.TextViewDidEndDding ? : self.TextViewDidEndDding(textView.text);
}
@end
