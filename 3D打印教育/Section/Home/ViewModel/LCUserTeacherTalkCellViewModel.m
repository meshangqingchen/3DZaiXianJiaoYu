//
//  LCUserTeacherTalkCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/3.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUserTeacherTalkCellViewModel.h"
#import "LCTextLinePositionModifier.h"

#define  MESSAGEBODY_W    SCREEN_WIDTH - 155
@implementation LCUserTeacherTalkCellViewModel
-(instancetype)initWithModel:(id)viewModel{
    if (self = [super init]) {
        NSDictionary *dic = viewModel;
        self.messageBody = dic[@"messageBody"];
       
        NSMutableAttributedString *messageBodyAtt = [[NSMutableAttributedString alloc]initWithString:_messageBody];
        messageBodyAtt.font = [[KDFont sharedKDFont]getF28Font];
        
        //@"userImageURL":self.userHeadImageURL,@"teacherImageURL":self.teacherImageURL
        
        if ([dic[@"fromWho"] isEqualToNumber:@0]) {
            self.fromWho = fromTeacher;
            messageBodyAtt.color = [KDColor getC2Color];
            self.headImageURL = dic[@"teacherImageURL"];
        }else {
            self.fromWho = fromUser;
            messageBodyAtt.color = [KDColor getC0Color];
            self.headImageURL = dic[@"userImageURL"];
        }
        
        LCTextLinePositionModifier *modifier = [[LCTextLinePositionModifier alloc]initWithLineHeightMultiple:1.2];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:14];
        modifier.paddingTop = 0;
        modifier.paddingBottom = 0;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(MESSAGEBODY_W, HUGE);
        container.linePositionModifier = modifier;

        _messageBodyLayout = [YYTextLayout layoutWithContainer:container text:messageBodyAtt];
        _messageBody_H = _messageBodyLayout.textBoundingSize.height;//[modifier heightForLineCount:_messageBodyLayout.lines.count];
        _messageBody_W = _messageBodyLayout.textBoundingSize.width;
        _cell_H = _messageBody_H + 26 +10 + 10 +10;//999999
        
        //        _messageBodyLayout.textBoundingSize;
//        MYLog(@"%@",NSStringFromCGSize(_messageBodyLayout.textBoundingSize));
//        MYLog(@"%@",NSStringFromCGSize(_messageBodyLayout.textBoundingSize));
//        MYLog(@"== =W %f",SCREEN_WIDTH - 163);
//        MYLog(@"== =H %f",_messageBody_H);
//        MYLog(@"%@",NSStringFromCGSize(_messageBodyLayout.textBoundingSize));
    }
    return self;
}
@end
