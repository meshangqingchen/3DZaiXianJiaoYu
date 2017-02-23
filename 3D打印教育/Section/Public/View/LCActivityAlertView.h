//
//  LCActivityAlertView.h
//  3D打印教育
//
//  Created by 3D on 17/2/23.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseView.h"

@interface LCActivityAlertView : BaseView

@property(nonatomic,strong) UILabel *msgLB;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIButton *btChaKan;
@property(nonatomic,copy) void(^pushMyVoucherVC)(id view);
@property(nonatomic,weak) id jcalertView;
@end
