//
//  LCNewUserAlertView.m
//  3D打印教育
//
//  Created by 3D on 17/2/22.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCNewUserAlertView.h"

@implementation LCNewUserAlertView
-(void)setupViews{
    self.imageView = [UIImageView new];
    self.imageView.userInteractionEnabled = YES;
    self.imageView.image = [UIImage imageNamed:@"newUser"];
    [self addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
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
        make.bottom.mas_offset(-61.5);
    }];
    @weakify(self)
    [self.btChaKan addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.pushMyVoucherVC ? : self.pushMyVoucherVC(self.jcalertView);
    }];
    
    //推出登录
    
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
        make.top.mas_offset(86.5);
        make.width.mas_equalTo(SCREEN_WIDTH-168);
//        make.bottom.mas_equalTo(self.btChaKan.mas_top).mas_offset(-10);
    }];
    
}
@end
