//
//  LCTeacherCell.h
//  无限教育
//
//  Created by 3D on 16/11/8.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "LCTeacherCellViewModel.h"
//#define TEACKER_TOP 50
//#define TEACKER_WHIGHT (SCREEN_WIDTH - 50)
@interface TeacherCellBackView : UIView
@property(nonatomic,strong) LCTeacherCellViewModel *cellViewModel;
@property(nonatomic,strong) UIImageView *headImageView;
@property(nonatomic,strong) YYLabel *nameLB;
@property(nonatomic,strong) YYLabel *detailLB;
@end

@interface LCTeacherCell : BaseTableViewCell
@property(nonatomic,strong) LCTeacherCellViewModel *cellViewModel;
@property(nonatomic,strong) UIView *topVerticalLineView;
@property(nonatomic,strong) TeacherCellBackView *teacherCellBackView;
@end
