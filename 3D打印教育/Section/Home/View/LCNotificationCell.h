//
//  LCNotificationCell.h
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LCNotificationCell : BaseTableViewCell
@property(nonatomic,strong) UILabel *nickName;
@property(nonatomic,strong) YYLabel *detailLB;
@property(nonatomic,strong) UILabel *timeLB;

@end
