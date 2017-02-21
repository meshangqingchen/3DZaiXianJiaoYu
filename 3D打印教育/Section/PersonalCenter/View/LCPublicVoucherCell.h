//
//  LCPublicVoucherCell.h
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LCPublicVoucherCell : BaseTableViewCell
@property(nonatomic,strong) UILabel *leftLB;
@property(nonatomic,strong) UILabel *rightLB;
@property(nonatomic,strong) UILabel *topLB;
@property(nonatomic,strong) UILabel *conditionLB;
@property(nonatomic,strong) UILabel *timeLB;
@property(nonatomic,strong) UIButton *shiyongBT;
@end
