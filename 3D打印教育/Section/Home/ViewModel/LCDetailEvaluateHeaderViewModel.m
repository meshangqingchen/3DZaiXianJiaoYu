//
//  LCDetailEvaluateHeaderViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/21.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCDetailEvaluateHeaderViewModel.h"
#import "LCTextLinePositionModifier.h"
@implementation LCDetailEvaluateHeaderViewModel

-(instancetype)initWithName:(NSString *)string and:(NSString *)detailSring{
    if (self = [super init]) {
        self.time = @"12-13 11:40";
        self.name = string;
        
        NSMutableAttributedString *evaAtt = [[NSMutableAttributedString alloc]initWithString:detailSring];
        evaAtt.font = [[KDFont sharedKDFont]getF30Font];
        evaAtt.color = [KDColor getC2Color];
        
        LCTextLinePositionModifier *modifier = [LCTextLinePositionModifier new];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:15];
        modifier.paddingTop = 0;
        modifier.paddingBottom = 0;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(SCREEN_WIDTH - 70 - 25, HUGE);
        container.linePositionModifier = modifier;
        
        self.detailLayout = [YYTextLayout layoutWithContainer:container text:evaAtt];
        self.detail_H = [modifier heightForLineCount:self.detailLayout.lines.count];
        self.headerView_H = 21 + 15 + 3 + 15 + 21 + _detail_H + 15 + 31;

    }
    return self;
}

@end
