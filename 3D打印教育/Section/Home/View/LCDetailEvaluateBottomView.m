//
//  LCDetailEvaluateBottomView.m
//  3D打印教育
//
//  Created by 3D on 16/12/22.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCDetailEvaluateBottomView.h"

@implementation LCDetailEvaluateBottomView

-(void)setupViews{
    self.backgroundColor = [KDColor getC9Color];
    self.pinlunBT  = [UIButton new];
    _pinlunBT.backgroundColor = [KDColor getC0Color];
    _pinlunBT.layer.cornerRadius = 35/2;
//    _pinlunBT.layer.masksToBounds = YES;
    _pinlunBT.layer.borderWidth = 0.5;
    _pinlunBT.layer.borderColor = [KDColor getC12Color].CGColor;
    [_pinlunBT setTitle:@"写评论..." forState:0];
    [_pinlunBT setTitleColor:[KDColor getX0Color] forState:0];
    _pinlunBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    _pinlunBT.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //{top, left, bottom, right}
    _pinlunBT.titleEdgeInsets = UIEdgeInsetsMake(0, 35/2, 0, 0);
    
    [self addSubview:_pinlunBT];
    
    [_pinlunBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-25);
        make.height.mas_equalTo(35);
    }];
}
@end
