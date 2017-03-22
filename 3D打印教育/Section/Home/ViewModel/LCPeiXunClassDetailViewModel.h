//
//  LCPeiXunClassDetailViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCPeiXunClassDetailViewModel : BaseViewModel
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *long_time;
@property(nonatomic,strong) NSString *descrip;
@property(nonatomic,strong) NSString *classIID;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *online_price;

@property(nonatomic,copy)void(^baoMing)();

@end
