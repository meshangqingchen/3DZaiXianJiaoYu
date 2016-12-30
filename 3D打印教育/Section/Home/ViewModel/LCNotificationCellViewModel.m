//
//  LCNotificationCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNotificationCellViewModel.h"
#import "LCTextLinePositionModifier.h"
@implementation LCNotificationCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        
    }
    return self;
}

-(instancetype)initWithDic:(id)Model{
    if (self = [super init]) {
        NSDictionary *dic = Model;
        self.nickName = dic[@"name"];
        NSString *detailStr = dic[@"detail"];
        NSAttributedString *detailAtt = [[NSAttributedString alloc]initWithString:detailStr];
        
        LCTextLinePositionModifier *modifier = [LCTextLinePositionModifier new];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:14];
        modifier.paddingTop = 0;
        modifier.paddingBottom = 0;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(SCREEN_WIDTH-30, HUGE);
        container.linePositionModifier = modifier;
        
        self.detailLayout = [YYTextLayout layoutWithContainer:container text:detailAtt];
        
        self.detail_H = [modifier heightForLineCount:_detailLayout.lines.count];
        self.cell_H = 20 + 12 + 15 + _detail_H + 10 + 12 + 10;
        
        self.timeStr = dic[@"time"];

    }
    return self;
}
@end
