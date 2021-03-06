//
//  LCMessageViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCMessageViewModel.h"
#import "LCMessageCellViewModel.h"

#import "LCUserTeacherTalkViewModel.h"//老师学生对话VM
@implementation LCMessageViewModel
-(void)initialize{
    [super initialize];
    [self setClickHeaderViewBT:^(NSString *userID) {
        
    }];
    
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    LCMessageCellViewModel *messageCellVM = self.dataSource[indexpath.row];
    if (messageCellVM.messageType == TalkMessageType) {
        LCUserTeacherTalkViewModel *userTeacherTalkVM = [[LCUserTeacherTalkViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"资讯"}];
        [self.navigationStackService pushViewModel:userTeacherTalkVM animated:YES];
    }else{
    
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    LCMessageCellViewModel *messageCellVM0 = [[LCMessageCellViewModel alloc]initWithDic:@{
                                                                                         @"name":@"我是第0个消息",
                                                                                         @"detail":@"欲减罗衣寒未去，不卷珠帘，人在深深处。残杏枝头花几许。啼红正恨清明雨。 尽日沈香烟一缕。宿酒醒迟，恼破春情绪。远信还因归燕误。小屏风上西江路。",
                                                                                         @"时间":@"12-12 13:20"}];
    messageCellVM0.messageType = VideoMessageType;
    LCMessageCellViewModel *messageCellVM1 = [[LCMessageCellViewModel alloc]initWithDic:@{
                                                                                         @"name":@"我是第1个消息",
                                                                                         @"detail":@"月皎惊乌栖不定，更漏将残，辘轳牵金井。唤起两眸清炯炯。泪花落枕红绵冷",
                                                                                         @"时间":@"12-12 13:20"}];
     messageCellVM0.messageType = NewsMessageType;
    LCMessageCellViewModel *messageCellVM2 = [[LCMessageCellViewModel alloc]initWithDic:@{
                                                                                         @"name":@"我是第2个消息",
                                                                                         @"detail":@"执手霜风吹鬓影。去意徊徨，别语愁难听。楼上阑干横斗柄，露寒人远鸡相应。",
                                                                                         @"时间":@"12-12 13:20"}];
    messageCellVM2.messageType = TalkMessageType;
    [self.mutableDataArr addObjectsFromArray:@[messageCellVM0,messageCellVM1,messageCellVM2]];
    
    //在请求完成 数据的时候给 headerView赋值 让headerView知道按钮应该 显示神马颜色
    !self.headerViewBindViewModel ? : self.headerViewBindViewModel(@"Yes");
    self.dataSource= self.mutableDataArr.copy;
    
}
@end
