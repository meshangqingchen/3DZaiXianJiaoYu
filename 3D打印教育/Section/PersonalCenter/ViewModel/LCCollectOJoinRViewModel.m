//
//  LCCollectOJoinRViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCollectOJoinRViewModel.h"
#import "LCCollectCourseModel.h"//收藏model
#import "LCJoinCourseModel.h"   //加入model

#import "LCCollectCellViewModel.h" //收藏VM
#import "LCJoinCellViewModel.h"    //加入VM
@implementation LCCollectOJoinRViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}


-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{

    NSDictionary *dic = self.params;
    NSString *title = dic[KEY_TITLE];
    if ([title isEqualToString:@"我的收藏"]) {
        [self.netApi_Manager collectListWithType:@1 andCurpag:curpage CompleteHandle:^(id responseObj, NSError *error) {
            LCCollectCourseModel *collectCourseModel = [LCCollectCourseModel parseJSON:responseObj];
            for (int i=0; i<collectCourseModel.contents.list.count; i++) {
                LCCollectCellViewModel *collectCellVM = [[LCCollectCellViewModel alloc]initWithModel:collectCourseModel.contents.list[i]];
                [self.mutableDataArr addObject:collectCellVM];
            }
            self.dataSource = self.mutableDataArr.copy;
            complete(responseObj);
        }];
    }else if ([title isEqualToString:@"我的课程"]){
        [self.netApi_Manager joinCourseListWithCurpag:curpage CompleteHandle:^(id responseObj, NSError *error) {
            LCJoinCourseModel *joinCourseModel = [LCJoinCourseModel parseJSON:responseObj];
            for (int i=0; i<joinCourseModel.contents.count; i++) {
                LCJoinCellViewModel *joinCourseVM = [[LCJoinCellViewModel alloc]initWithModel:joinCourseModel.contents[i]];
                [self.mutableDataArr addObject:joinCourseVM];
            }
            self.dataSource = self.mutableDataArr.copy;
            complete(responseObj);
        }];
    }
    
}

@end
