//
//  LCNotarizeOrderModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCNotarizeOrderViewModel : BaseViewModel
@property(nonatomic,strong) NSURL *imageURL;
@property(nonatomic,strong) NSString *titleName;
@property(nonatomic,strong) NSString *courseID;
@property(nonatomic,strong) NSString *price;

@property(nonatomic,copy) void (^networkRequest)();

@end
