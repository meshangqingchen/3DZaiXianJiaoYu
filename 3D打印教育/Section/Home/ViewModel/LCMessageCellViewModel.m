//
//  LCMessageCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMessageCellViewModel.h"
#import "LCTextLinePositionModifier.h"
@implementation LCMessageCellViewModel
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
        container.size = CGSizeMake(SCREEN_WIDTH-70, HUGE);
        container.linePositionModifier = modifier;
        
        self.detailLayout = [YYTextLayout layoutWithContainer:container text:detailAtt];
        
        self.detail_H = [modifier heightForLineCount:_detailLayout.lines.count];
        self.cell_H = 19 + 12 + 14 + _detail_H + 10 + 12 + 10;
    
        self.timeStr = dic[@"时间"];
    }
    return self;
}
@end
