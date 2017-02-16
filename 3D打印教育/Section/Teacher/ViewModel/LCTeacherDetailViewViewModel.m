//
//  LCTeacherDetailViewViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTeacherDetailViewViewModel.h"
#import "LCTeacherDetailModel.h"
#import "LCTextLinePositionModifier.h"
@implementation LCTeacherDetailViewViewModel

-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        
        LCTeacherDetailContents *teacherModel = model;
        self.headImageURL = [NSURL URLWithString:teacherModel.avatar];
        self.teacherName = teacherModel.nick_name;
        self.shortDis = teacherModel.shot_discription;
        self.price = teacherModel.price;
        self.ifProblem = teacherModel.is_problem;
        self.teacherIID = teacherModel.iid;
        
        NSMutableAttributedString *jianjieAtt = [[NSMutableAttributedString alloc]initWithString:@"简介: "];
        jianjieAtt.font = [[KDFont sharedKDFont] getF32Font];
        jianjieAtt.color = [KDColor getC2Color];
        
        NSMutableAttributedString *detailAtt = [[NSMutableAttributedString alloc]initWithString:teacherModel.discription];
        detailAtt.font = [[KDFont sharedKDFont] getF26Font];
        detailAtt.color = [KDColor getC3Color];
        [detailAtt insertAttributedString:jianjieAtt atIndex:0];

        LCTextLinePositionModifier *modifier = [[LCTextLinePositionModifier alloc]initWithLineHeightMultiple:1.7];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:13];
        modifier.paddingTop = 5;
        modifier.paddingBottom = 0;

        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(SCREEN_WIDTH-50, HUGE);
        container.linePositionModifier = modifier;
        
        self.disLayout = [YYTextLayout layoutWithContainer:container text:detailAtt];
        self.disLB_H = [modifier heightForLineCount:_disLayout.lines.count];
        
        if (_disLB_H >= ((SCREEN_HEIGHT-(574/2))-40)) {
            _scro_H = (SCREEN_HEIGHT-(574/2))-40;
            _backView_H = (SCREEN_HEIGHT-(574/2));
            MYLog(@" ++++ + + + + %f",_backView_H);
        }else{
            _scro_H = _disLB_H;
            _backView_H = _disLB_H+40;
            MYLog(@" = = == =   %f",_backView_H);
        }
    }
    return self;
}
@end
