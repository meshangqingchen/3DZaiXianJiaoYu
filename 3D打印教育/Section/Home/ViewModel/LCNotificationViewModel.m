//
//  LCNotificationViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCNotificationViewModel.h"
#import "LCNotificationCellViewModel.h"
@implementation LCNotificationViewModel
-(void)initialize{
    [super initialize];
    [self setClickHeaderViewBT:^(NSString *userID) {
        
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    LCNotificationCellViewModel *notificationCellVM1 = [[LCNotificationCellViewModel alloc]initWithDic:@{@"name":@"我是第一个",
                                                                                                        @"detail":@"秋风清，秋月明,落叶聚还散,寒鸦栖复惊。相亲相见知何日，此时此夜难为情; 入我相思门，知我相思苦，长相思兮长相忆，短相思兮无穷极，早知如此绊人心，何如当初莫相识",
                                                                                                        @"time":@"2016-12-12"}];
    LCNotificationCellViewModel *notificationCellVM2 = [[LCNotificationCellViewModel alloc]initWithDic:@{@"name":@"我是第二个",
                                                                                                         @"detail":@"秋风清，秋月明,落叶聚还散,寒鸦栖复惊。相亲相见知何日，此时此夜难为情; 入我相思门，知我相思苦，长相思兮长相忆，短相思兮无穷极，早知如此绊人心，何如当初莫相识",
                                                                                                         @"time":@"2016-12-12"}];
    LCNotificationCellViewModel *notificationCellVM3 = [[LCNotificationCellViewModel alloc]initWithDic:@{@"name":@"我是第三个",
                                                                                                         @"detail":@"秋风清，秋月明,落叶聚还散,寒鸦栖复惊。相亲相见知何日，此时此夜难为情; 入我相思门，知我相思苦，长相思兮长相忆，短相思兮无穷极，早知如此绊人心，何如当初莫相识",
                                                                                                         @"time":@"2016-12-12"}];
    [self.mutableDataArr addObjectsFromArray:@[notificationCellVM1,notificationCellVM2,notificationCellVM3]];
    //在请求完成 数据的时候给 headerView赋值 让headerView知道按钮应该 显示神马颜色
    !self.headerViewBindViewModel ? : self.headerViewBindViewModel(@"Yes");
    self.dataSource = self.mutableDataArr.copy;
}
@end
