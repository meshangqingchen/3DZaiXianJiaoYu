//
//  LCActivityAlertView.m
//  3D打印教育
//
//  Created by 3D on 17/2/23.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCActivityAlertView.h"

@implementation LCActivityAlertView

-(void)setupViews{
    self.imageView = [UIImageView new];
    self.imageView.image = [UIImage imageNamed:@"activity"];
    [self addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.centerX.mas_offset(0);//637  407
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*637/750, SCREEN_WIDTH*407/750));
    }];
    
    self.btChaKan = [UIButton new];
    self.btChaKan.backgroundColor = [KDColor getC29Color];
    [self.btChaKan setTitle:@"去查看" forState:0];
    [self.btChaKan setTitleColor:[KDColor getC0Color] forState:0];
    self.btChaKan.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    self.btChaKan.layer.cornerRadius = 4;
    [self addSubview:_btChaKan];
    [_btChaKan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(70, 30));
        make.bottom.mas_offset(-30.5);
    }];
    @weakify(self)
    [_btChaKan addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.pushMyVoucherVC ? : self.pushMyVoucherVC(self.jcalertView);
    }];
    
    self.msgLB = [UILabel new];
    _msgLB.numberOfLines = 3;
    _msgLB.font = [[KDFont sharedKDFont] getF30Font];
    _msgLB.textColor = [KDColor getC2Color];
    NSString *infoStr  = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试";
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:infoStr];
    //建立行间距模型
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    //设置行间距
    [paragraphStyle1 setLineSpacing:9.f];
    //把行间距模型加入NSMutableAttributedString模型
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [infoStr length])];
    
    _msgLB.attributedText = attributedString1;
    [self addSubview:_msgLB];
    [_msgLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.top.mas_offset(67);
        make.width.mas_equalTo(SCREEN_WIDTH-168);
    }];
}
@end
