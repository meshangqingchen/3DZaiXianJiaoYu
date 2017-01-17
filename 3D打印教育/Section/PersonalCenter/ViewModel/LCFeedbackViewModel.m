//
//  LCFeedbackViewModel.m
//  无限教育
//
//  Created by 3D on 16/10/28.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCFeedbackViewModel.h"
#import "NSObject+Common.h"
@implementation LCFeedbackViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setSendIder:^(NSString *msg, NSString *contact) {
        @strongify(self)
        if (msg == nil | msg.length == 0) {
            [NSObject showWarning:@"您的意见为空"];
            return ;
        }
        
        [self.netApi_Manager suggestionFeedbackMsg:msg amdContact:contact CompleteHandle:^(id responseObj, NSError *error) {
            MYLog(@"===========================");
            NSDictionary *dic = responseObj;
            NSString *msg = dic[@"msg"];
            [NSObject showWarning:msg];

            [self.navigationStackService popViewModelAnimated:YES];
        }];
    }];
}
@end
