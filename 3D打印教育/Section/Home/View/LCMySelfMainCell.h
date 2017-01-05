//
//  LCMySelfMainCell.h
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LCMySelfMainCell : BaseTableViewCell
@property(nonatomic,strong) UIImageView *headerImageView;
@property(nonatomic,strong) UILabel *nickNameLB;
@property(nonatomic,strong) UILabel *timeLB;
@property(nonatomic,strong) YYLabel *evaDetailLB;

@property(nonatomic,strong) UIImageView *newsCourseImageView;
@property(nonatomic,strong) UILabel *titleLB;
@end
