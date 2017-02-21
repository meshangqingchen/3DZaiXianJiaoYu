//
//  LCMemberViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMemberViewModel.h"
#import "LCMemberTopCellViewModel.h"
#import "LCMemberCellViewModel.h"

@implementation LCMemberViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    LCMemberTopCellViewModel *topCellVM = [LCMemberTopCellViewModel new];
    LCMemberCellViewModel *cellVM = [LCMemberCellViewModel new];
    LCMemberCellViewModel *cellVM1 = [LCMemberCellViewModel new];
    LCMemberCellViewModel *cellVM2 = [LCMemberCellViewModel new];
    
    [self.mutableDataArr addObjectsFromArray:@[topCellVM,cellVM,cellVM1,cellVM2]];
    MYLog(@"%@",self.mutableDataArr);
    self.dataSource = self.mutableDataArr.copy;
}

@end
