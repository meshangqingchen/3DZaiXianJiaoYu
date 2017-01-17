//
//  LCBaoMingTFCell.m
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBaoMingTFCell.h"
#import "LCBaoMingModel.h"


@interface LCBaoMingTFCell ()
<
UITextFieldDelegate
>
@end

@implementation LCBaoMingTFCell

-(void)setupViews{
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [KDColor getC13Color];//
    shadowView.layer.cornerRadius = 5;
    [self.contentView addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(34);
    }];
    
    UIView *backWhiteView = [UIView new];
    backWhiteView.backgroundColor = [KDColor getC12Color];
    backWhiteView.layer.cornerRadius = 4.5;
    [shadowView addSubview:backWhiteView];
    [backWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5));
    }];
        
    self.placHoderTF = [UITextField new];
    self.placHoderTF.delegate = self;
    self.placHoderTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _placHoderTF.font = [[KDFont sharedKDFont]getF30Font];
    _placHoderTF.textColor = [KDColor getC2Color];
    [backWhiteView addSubview:_placHoderTF];
    [_placHoderTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(0);
    }];
    
    self.titleLB = [UILabel new];
    [self.contentView addSubview:_titleLB];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.text = @"报名志愿";
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(shadowView.mas_top).mas_equalTo(-10);
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCBaoMingModel *model = viewModel;
    _titleLB.text = model.title;
    if ([_titleLB.text isEqualToString:@"联系电话"]|[_titleLB.text isEqualToString:@"QQ"]) {
        _placHoderTF.keyboardType = UIKeyboardTypeNumberPad;
    }else{
        _placHoderTF.keyboardType = UIKeyboardTypeDefault;
    }
    NSMutableAttributedString *placHoderAr = [[NSMutableAttributedString alloc]initWithString:model.placeholderTitle];
    [placHoderAr addAttribute:NSFontAttributeName value:[[KDFont new]getF30Font] range:NSMakeRange(0, model.placeholderTitle.length)];
    [placHoderAr addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0, placHoderAr.length)];
    self.placHoderTF.attributedPlaceholder = placHoderAr;
    
}

//结束编辑
-(void)textFieldDidEndEditing:(UITextField *)textField{
    !self.TextFiledDidEndDding ? : self.TextFiledDidEndDding(self.titleLB.text,self.placHoderTF.text);
}
//删除
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

@end
