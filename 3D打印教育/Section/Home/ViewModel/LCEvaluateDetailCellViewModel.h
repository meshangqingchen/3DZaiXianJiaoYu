//
//  LCEvaluateDeatilCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/21.
//  Copyright © 2016年 3D. All rights reserved.
//  没用了

#import <Foundation/Foundation.h>

@interface LCEvaluateDetailCellViewModel : NSObject
@property(nonatomic,strong) NSURL *headImgURL;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *time;
@property(nonatomic,strong) YYTextLayout *detailLayout;
@property(nonatomic) CGFloat detail_H;
@property(nonatomic) CGFloat cell_H;

-(instancetype)initWithModel:(id)model;
-(instancetype)initWithName:(NSString *)string and:(NSString*)detailSring;

@end
