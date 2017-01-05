//
//  LCDetailEvaluateCell.h
//  3D打印教育
//
//  Created by 3D on 16/12/21.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LCDetailEvaluateCell : BaseTableViewCell
@property(nonatomic,strong) UIImageView *headerImgView;
@property(nonatomic,strong) UILabel *nameLB;
@property(nonatomic,strong) UILabel *timeLB;
@property(nonatomic,strong) YYLabel *evaYLB;
@property(nonatomic,strong) UIButton *huifuBT;

@end
