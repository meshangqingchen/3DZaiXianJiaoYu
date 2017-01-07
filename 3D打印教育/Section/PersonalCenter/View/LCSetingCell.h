//
//  LCSetingCell.h
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "NKColorSwitch.h"

@interface LCSetingCell : BaseTableViewCell
@property(nonatomic,strong) UILabel *leftLB;
@property(nonatomic,strong) UILabel *middleLB;
@property(nonatomic,strong) UILabel *rightLB;

@property(nonatomic,strong) NKColorSwitch *rightSwitch;
@property(nonatomic,strong) UIImageView *rightImageView;
@end
