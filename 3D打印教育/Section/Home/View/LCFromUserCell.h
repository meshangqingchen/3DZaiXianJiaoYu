//
//  NSFromUserCell.h
//  3D打印教育
//
//  Created by 3D on 17/1/3.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LCFromUserCell : BaseTableViewCell
@property(nonatomic,strong) UIImageView *headImageView;
@property(nonatomic,strong) YYLabel *messageBodyLB;
@property(nonatomic,strong) UILabel *timeLB;
@end
