//
//  LCBaoMingZhiFuViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/3/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCBaoMingZhiFuViewModel : BaseViewModel
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSString *long_time;
@property(nonatomic,strong) NSString *privilegePrice;
@property(nonatomic,strong) NSString *onlineprice;
@property(nonatomic,strong) NSString *order_Sn;

@property(nonatomic,copy) void (^payBaoMing)(NSString *order_Sn);

@end
