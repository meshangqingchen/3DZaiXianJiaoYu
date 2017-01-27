//
//  LCUserTeacherTalkViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/30.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCUserTeacherTalkViewModel.h"
#import "LCUserTeacherTalkCellViewModel.h"
#import "LCTalkModel.h"

#import "NSObject+Common.h"
@implementation LCUserTeacherTalkViewModel
{
    dispatch_source_t _timer;
}

-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    [self starTime];
    @weakify(self)
    //发送消息
    [self setSendMassage:^(NSString *messageString) {
        @strongify(self)
        if (!messageString || messageString.length == 0) {
            [NSObject showWarning:@"不能发送空消息"];
            return ;
        }
        [self.netApi_Manager sendMessageWithTeacherID:self.teacherIID andMessage:messageString CompleteHandle:^(id responseObj, NSError *error) {
            
            NSDictionary *dic = responseObj;
            if ([dic[@"status"] isEqualToNumber:@1]) {
                LCUserTeacherTalkCellViewModel *messageCellVM = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":messageString,@"fromWho":@1}];
                [self.mutableDataArr addObject:messageCellVM];
                self.dataSource = self.mutableDataArr.copy;
                !self.sendMassageSessed ? : self.sendMassageSessed();
            }if ([dic[@"status"] isEqualToNumber:@0]) {
                [NSObject showWarning:@"发送失败"];
            }
        }];
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
   
    [self.netApi_Manager historyTalkWithTeacherID:self.teacherIID CompleteHandle:^(id responseObj, NSError *error) {
        LCTalkModel *talkModel = [LCTalkModel parseJSON:responseObj];
        self.userHeadImageURL = [NSURL URLWithString:talkModel.contents.user.avatar];
        for (int i = 0; i<talkModel.contents.list.count; i++) {
            LCTalkList *messageModel = talkModel.contents.list[i];
           
            NSNumber *typeNUM = [messageModel.send_type numberValue];
            LCUserTeacherTalkCellViewModel *messageCellVM = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":messageModel.discrip,@"fromWho":typeNUM,@"userImageURL":self.userHeadImageURL,@"teacherImageURL":self.teacherImageURL}];
            [self.mutableDataArr addObject:messageCellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
    
}

-(void)starTime{
    if (_timer != nil) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    _timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 15.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        
        [self.netApi_Manager pollingWithTeacherID:self.teacherIID CompleteHandle:^(id responseObj, NSError *error) {
            
            NSArray *contents = responseObj[@"contents"];
            if (!contents && contents.count>0) {
                for (int i = 0; i<contents.count; i++) {
                    LCTalkList *messageModel =[LCTalkList parseJSON:contents[i]];
                    NSNumber *typeNUM = [messageModel.send_type numberValue];
                    LCUserTeacherTalkCellViewModel *messageCellVM = [[LCUserTeacherTalkCellViewModel alloc]initWithModel: @{@"messageBody":messageModel.discrip,@"fromWho":typeNUM}];
                    [self.mutableDataArr addObject:messageCellVM];
                }
                self.dataSource = self.mutableDataArr.copy;
            }
        }];
    });
    dispatch_resume(timer);
}

-(instancetype)initWithServices:(id<LCNavigationProtocol>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        self.teacherImageURL = params[@"teacherImageURL"];
        self.teacherIID = params[@"teacherIID"];
    }
    return self;
}

@end
