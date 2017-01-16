//
//  LCTeacherCellViewModel.m
//  无限教育
//
//  Created by 3D on 16/11/8.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCTeacherCellViewModel.h"
#import "LCCounselTeacherModel.h"
@implementation LCTeacherCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCTeacherModel *teacherModel = model;
        _teacherName = teacherModel.nick_name;
        _teacherDetail = teacherModel.shot_discription;
        _teacherHeadImageURL = [NSURL URLWithString:teacherModel.avatar];
        [self layout];
    }
    return self;
}

-(void)layout{

    NSMutableAttributedString *nameAt = [[NSMutableAttributedString alloc]initWithString:_teacherName ? _teacherName : @""];
    nameAt.font = [[KDFont sharedKDFont] getF30Font];
    nameAt.color = [KDColor getX1Color];
    
//    nameAt.lineBreakMode = NSLineBreakByCharWrapping;
    YYTextContainer *nameContainer = [YYTextContainer containerWithSize:CGSizeMake(150, CGFLOAT_MAX)];
    nameContainer.maximumNumberOfRows = 1;
    _nameTextLayout = [YYTextLayout layoutWithContainer:nameContainer text:nameAt];
    _name_h = CGRectGetHeight(_nameTextLayout.textBoundingRect);
    
    
    
    NSMutableAttributedString *detailAt = [[NSMutableAttributedString alloc]initWithString:_teacherDetail ? _teacherDetail : @" "];
    detailAt.font = [[KDFont sharedKDFont] getF26Font];
    detailAt.color = [KDColor getC2Color];
    detailAt.lineSpacing = 6.0;
    
    
    YYTextContainer *detailTc = [YYTextContainer containerWithSize:CGSizeMake(SCREEN_WIDTH-150, MAXFLOAT)];
    detailTc.maximumNumberOfRows = 0;
    _detailTextLayout = [YYTextLayout layoutWithContainer:detailTc text:detailAt];
    _detail_h = CGRectGetHeight(_detailTextLayout.textBoundingRect);
    MYLog(@"%f",_detail_h);
    
    _teacherBackView_h = 14 + _name_h + _detail_h + 16;
    _teacherCellTotal_h = _teacherBackView_h + 25 ;
    
    
}
@end
