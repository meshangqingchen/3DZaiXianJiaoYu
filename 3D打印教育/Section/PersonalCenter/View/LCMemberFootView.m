//
//  LCMemberFootView.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberFootView.h"
#import "UIButton+ImageTitleStyle.h"

@implementation LCMemberFootView
-(void)setupViews{
    self.backgroundColor = [KDColor getC19Color];
    UIView *topView = [UIView new];
    [self addSubview:topView];
    topView.backgroundColor = [KDColor getC0Color];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(5);
        make.height.mas_equalTo(44);
    }];
    
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = [KDColor getC7Color];
    [topView addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    UIView *bottomLineView = [UIView new];
    bottomLineView.backgroundColor = [KDColor getC7Color];
    [topView addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    UILabel *huYuanTeQuan = [UILabel new];
    huYuanTeQuan.text = @"会员特权";
    huYuanTeQuan.textColor = [KDColor getC2Color];
    huYuanTeQuan.font = [[KDFont sharedKDFont] getF30Font];
    [topView addSubview:huYuanTeQuan];
    [huYuanTeQuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [KDColor getC0Color];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(topView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(99);
    }];
    
    NSArray *bTtitles = @[@"免费视频",@"折扣优惠",@"会员礼包",@"现金优惠"];
    NSArray *bTimageName = @[@"mianfeishipin",@"zhekouyouhui",@"huiyuanlibao",@"xianjinyouhui"];
    
    CGFloat distance = (SCREEN_WIDTH-200)/5;
    for (int i = 0; i<bTtitles.count; i++) {
        UIButton *bt = [UIButton new];
        [bottomView addSubview:bt];
        [bt setTitle:bTtitles[i] forState:0];
        [bt setTitleColor:[KDColor getC2Color] forState:0];
        bt.titleLabel.font = [[KDFont sharedKDFont] getF24Font];
        [bt setImage:[UIImage imageNamed:bTimageName[i]] forState:0];
        bt.frame = CGRectMake(distance*(i+1)+i*50, 15, 50, 70);
        [bt setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    }
    
}
@end
