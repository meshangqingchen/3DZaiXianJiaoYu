//
//  LCEvaluateCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/15.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateCellViewModel.h"
#import "LCTextLinePositionModifier.h"
#import "LCAssessListModel.h"

#define  VIDEO_EVALUATE_W    SCREEN_WIDTH - 70 - 25
@implementation LCEvaluateCellViewModel

-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        
        LCAssessList *assessModel = model;
       
        self.userHeaderURL = [NSURL URLWithString:assessModel.avatar];
        self.name = assessModel.user_nickName;
        self.creatTime = assessModel.created_time;
        self.grade = [assessModel.grade intValue];
        
        //评论详情
        NSMutableAttributedString *evaAtt = [[NSMutableAttributedString alloc]initWithString:assessModel.descrip];
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
        _evaTextLayout = [YYTextLayout layoutWithContainer:container text:evaAtt];
        _evaluate_H = [modifier heightForLineCount:_evaTextLayout.lines.count];
        
        _cell_H = _evaluate_H + 21 + 15 + 3 +15 + 21 + 15;
        
    }
    return self;
}

//-(instancetype)initWithEvaluteStr:(NSString *)evaluate and:(NSArray *)arr{
//    if (self = [super init]) {
//        
//        
//        //评论详情
//        NSMutableAttributedString *evaAtt = [[NSMutableAttributedString alloc]initWithString:evaluate];
//        evaAtt.font = [[KDFont sharedKDFont]getF30Font];
//        evaAtt.color = [KDColor getC2Color];
//
//        LCTextLinePositionModifier *modifier = [LCTextLinePositionModifier new];
//        modifier.font = [UIFont fontWithName:@"Heiti SC" size:15];
//        modifier.paddingTop = 0;
//        modifier.paddingBottom = 0;
//        
//        YYTextContainer *container = [YYTextContainer new];
//        container.size = CGSizeMake(VIDEO_EVALUATE_W, HUGE);
//        container.linePositionModifier = modifier;
//        //数据
//        _evaTextLayout = [YYTextLayout layoutWithContainer:container text:evaAtt];
//        _evaluate_H = [modifier heightForLineCount:_evaTextLayout.lines.count];
//        
//        _sonAllEva_H = 0;
//        //二级评论数组
//        if (arr==nil | arr.count==0){
//            _sonAllEva_H = 0;
//            _cell_H = _evaluate_H + _sonAllEva_H  + 15 + 21 + 3 + 15 + 15 + 21;
//        }else{
//            self.sonEvaluateArr = arr;
//            for (int i=0; i<arr.count; i++) {
//                LCSonEvaluateCellViewModel *sonEvaCellViewModel = arr[i];
//                _sonAllEva_H = _sonAllEva_H + sonEvaCellViewModel.sonEva_H + 5;
//                if (i==2) {
//                    
//                    break;
//                }
//            }
//            _sonAllEva_H = _sonAllEva_H + 10 + 16 + 3 + 10;
//            _cell_H = _evaluate_H + _sonAllEva_H + 15 + 15 + 21 + 3 + 15 + 15 + 21;
//        }
//        
//    }
//    return self;
//}

@end
