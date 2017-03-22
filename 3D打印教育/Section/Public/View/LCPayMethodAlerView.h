//
//  LCPayMethodAlerView.h
//  3D打印教育
//
//  Created by 3D on 17/3/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCPayMethodAlerView : UIView
@property(nonatomic,strong) UIButton *onlinePayBT;
@property(nonatomic,strong) UIButton *xianXiaPayBT;

@property(nonatomic,strong) NSString *onlinePay;
@property(nonatomic,strong) NSString *xianXiaPay;
@end
