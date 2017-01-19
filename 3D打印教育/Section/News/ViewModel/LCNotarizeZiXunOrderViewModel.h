//
//  LCNotarizeZiXunOrderViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"
#import "LCTeacherDetailViewViewModel.h"
@interface LCNotarizeZiXunOrderViewModel : BaseViewModel
@property(nonatomic,strong) LCTeacherDetailViewViewModel *viewVM;
@property(nonatomic,strong) NSString *order_sn;
@property(nonatomic,copy) void (^qurenzhifu)();



@end
