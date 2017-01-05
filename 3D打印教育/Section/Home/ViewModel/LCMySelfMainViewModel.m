//
//  LCMySelfMainViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMySelfMainViewModel.h"
#import "LCMySelfMainCellViewModel.h"
@implementation LCMySelfMainViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    LCMySelfMainCellViewModel *cellVM0 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的脚步中一切都在匆匆的脚步中"}];
    LCMySelfMainCellViewModel *cellVM1 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的切都在匆匆的脚步中"}];

    LCMySelfMainCellViewModel *cellVM2 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中"}];

    LCMySelfMainCellViewModel *cellVM3 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中"}];

    LCMySelfMainCellViewModel *cellVM4 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中一切都在匆匆的脚步中"}];

    LCMySelfMainCellViewModel *cellVM5 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆的脚步中一切都在匆匆的脚步中"}];

    LCMySelfMainCellViewModel *cellVM6 = [[LCMySelfMainCellViewModel alloc]initWithModel:@{@"nickName":@"swift一统天下",@"evaDetail":@"一切都在匆匆"}];
    
    !self.bindViewModel ? :self.bindViewModel(@"");
    [self.mutableDataArr addObjectsFromArray:@[cellVM0,cellVM1,cellVM2,cellVM3,cellVM4,cellVM5,cellVM6]];
    self.dataSource = self.mutableDataArr.copy;
}
@end
