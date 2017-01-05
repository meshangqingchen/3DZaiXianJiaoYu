//
//  LCMySelfMainCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMySelfMainCellViewModel.h"
#import "LCTextLinePositionModifier.h"

#define  VIDEO_EVALUATE_W    SCREEN_WIDTH - 70 - 25
@implementation LCMySelfMainCellViewModel

-(instancetype)initWithModel:(id)viewModel{
    if (self = [super init]) {
        //@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中"}
        NSDictionary *dic = viewModel;
        self.headerImageURL = nil;
        self.nickName = dic[@"nickName"];
        self.timeStr = @"12-13 11:22";
        NSString *evaDetail = dic[@"evaDetail"];
        
        //评论详情
        NSMutableAttributedString *evaAtt = [[NSMutableAttributedString alloc]initWithString:evaDetail];
        evaAtt.font = [[KDFont sharedKDFont]getF30Font];
        evaAtt.color = [KDColor getC2Color];
        
        LCTextLinePositionModifier *modifier = [LCTextLinePositionModifier new];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:15];
        modifier.paddingTop = 0;
        modifier.paddingBottom = 0;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(VIDEO_EVALUATE_W, HUGE);
        container.linePositionModifier = modifier;
        //数据
        _evaDetailLayout = [YYTextLayout layoutWithContainer:container text:evaAtt];
        _evaDetail_H = [modifier heightForLineCount:_evaDetailLayout.lines.count];
        _cell_H = 10+22+15+5+15+21+_evaDetail_H+10+45+40;
    }
    return self;
}
@end
