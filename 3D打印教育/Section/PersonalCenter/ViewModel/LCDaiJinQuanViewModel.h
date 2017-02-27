//
//  LCDaiJinQuanViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"
@class LCUseCouponModel;
@interface LCDaiJinQuanViewModel : BaseTableViewModel
@property(nonatomic,strong) NSString *orderSn;
@property(nonatomic,copy) void (^pushCourseList)(NSIndexPath *indexPath); //跳转到更多精品课程
@property(nonatomic,copy) void (^refreshThePrice)(LCUseCouponModel *model);//刷新订单价格

@end
