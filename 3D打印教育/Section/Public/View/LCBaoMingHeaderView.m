//
//  LCBaoMingHeaderView.m
//  3D打印教育
//
//  Created by 3D on 17/3/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCBaoMingHeaderView.h"

@implementation LCBaoMingHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.titleLB = [UILabel new];
    _titleLB.font = [[KDFont sharedKDFont] getF36Font];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.numberOfLines = 2;
    [self addSubview:_titleLB];
//    _titleLB.backgroundColor = [UIColor yellowColor];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.bottom.top.mas_offset(0);
    }];
}
@end
