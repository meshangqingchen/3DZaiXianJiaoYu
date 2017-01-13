//
//  LCVideoDetailEvaluateCell.h
//  3D打印教育
//
//  Created by 3D on 16/12/16.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "KDFiveStarView.h"

@interface LCVideoDetailEvaluateCell : BaseTableViewCell
@property(nonatomic,strong) UIImageView *headerImgView;
@property(nonatomic,strong) UILabel *nameLB;
@property(nonatomic,strong) UILabel *timeLB;
@property(nonatomic,strong) YYLabel *evaYLB;
//@property(nonatomic,strong) UIButton *huifuBT;
@property(nonatomic,strong) KDFiveStarView *starView;
//@property(nonatomic,strong) YYLabel *sonEvaYLB1;
//@property(nonatomic,strong) YYLabel *sonEvaYLB2;
//@property(nonatomic,strong) YYLabel *sonEvaYLB3;
//@property(nonatomic,strong) UIButton *numHuiFu;
@end
