//
//  LCSonEvaluateCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/15.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCSonEvaluateCellViewModel.h"
#import "LCTextLinePositionModifier.h"
#define SONEVA_W SCREEN_WIDTH - 70 - 20 - 15
@implementation LCSonEvaluateCellViewModel

-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        
    }
    return self;
}

-(instancetype)initWithName:(NSString *)string and:(NSString *)sonEvalua{
    if (self = [super init]) {
        _sonEva_H = 0;
        
        NSMutableAttributedString *sonEvaAtt = [[NSMutableAttributedString alloc]initWithString:sonEvalua];
        sonEvaAtt.font = [[KDFont sharedKDFont]getF30Font];
        sonEvaAtt.color = [KDColor getC2Color];
        
        NSMutableString *nameMut = string.mutableCopy;
        [nameMut appendString:@": "];
        NSMutableAttributedString *nameAtt = [[NSMutableAttributedString alloc] initWithString:nameMut];
        nameAtt.font = [[KDFont sharedKDFont] getF30Font];
        nameAtt.color = [KDColor getC8Color];
        
//        [sonEvaAtt insertString:nameMut atIndex:0];[A insertString:B atIndex:0] A = B+A = BA B的属性和A一样
        [sonEvaAtt insertAttributedString:nameAtt atIndex:0];
        
        // 高亮状态的背景 点击名字高亮颜色
        YYTextBorder *highlightBorder = [YYTextBorder alloc];
        highlightBorder.insets = UIEdgeInsetsMake(-2, 0, -1, 0);
        highlightBorder.cornerRadius = 3;
        highlightBorder.fillColor = [KDColor getC11Color];
        //高亮状态
        YYTextHighlight *highlight = [[YYTextHighlight alloc]init];
        [highlight setBackgroundBorder:highlightBorder];
        [sonEvaAtt setTextHighlight:highlight range:NSMakeRange(0, string.length)];
        
        LCTextLinePositionModifier *modifier = [LCTextLinePositionModifier new];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:15];
        modifier.paddingTop = 3;
        modifier.paddingBottom = 0;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(SONEVA_W, HUGE);
        container.linePositionModifier = modifier;
        
        _textLayout = [YYTextLayout layoutWithContainer:container text:sonEvaAtt];
        _sonEva_H = [modifier heightForLineCount:_textLayout.lines.count];
         
        
    }
    return self;
}
@end













































