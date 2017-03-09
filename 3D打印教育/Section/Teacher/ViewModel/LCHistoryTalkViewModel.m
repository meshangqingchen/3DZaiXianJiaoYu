//
//  LCHistoryViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/8.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCHistoryTalkViewModel.h"
#import "LCHistoryTalkTeacherModel.h"
#import "LCHistoryTalkCellViewModel.h"
#import "LCUserTeacherTalkViewModel.h"
@implementation LCHistoryTalkViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    LCHistoryTalkCellViewModel *cellVM = self.dataSource[indexpath.row];
    LCUserTeacherTalkViewModel *teacherTalkVM = [[LCUserTeacherTalkViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"资讯",@"teacherImageURL":cellVM.avatarURL,@"teacherIID":cellVM.teacherID}];
    
    [self.navigationStackService pushViewModel:teacherTalkVM animated:YES];
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{

    [self.netApi_Manager historyTalkListWith:curpage completeHandle:^(id responseObj, NSError *error) {
        LCHistoryTalkTeacherModel *hisTalkTeacherModel = [LCHistoryTalkTeacherModel parseJSON:responseObj];
        
        for (int i = 0; i<hisTalkTeacherModel.contents.count; i++) {
            LCHistoryTalkCellViewModel *cellVM = [[LCHistoryTalkCellViewModel alloc]initWithModel:hisTalkTeacherModel.contents[i]];
            [self.mutableDataArr addObject:cellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
}
@end
