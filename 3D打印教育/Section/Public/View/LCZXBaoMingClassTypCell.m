//
//  LCZXBaoMingClassTypCell.m
//  3D打印教育
//
//  Created by 3D on 17/3/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCZXBaoMingClassTypCell.h"

@implementation LCZXBaoMingClassTypCell

-(void)setupViews{
    self.classNmaeLB = [UILabel new];
    self.classNmaeLB.textColor = [KDColor getC2Color];//getC2Color
    self.classNmaeLB.font = [[KDFont sharedKDFont] getF30Font];
    [self.contentView addSubview:self.classNmaeLB];
    [self.classNmaeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
}

-(void)bindViewModel:(id)viewModel{
    NSString *temStr = viewModel;
    self.classNmaeLB.text = temStr;
}
@end
