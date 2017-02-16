//
//  LCTeacherDetailViewViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTeacherDetailViewViewModel : NSObject
@property(nonatomic,strong) NSURL *headImageURL;
@property(nonatomic,strong) NSString *teacherName;
@property(nonatomic,strong) NSString *shortDis;
@property(nonatomic,strong) NSString *teacherIID;

@property(nonatomic,strong) YYTextLayout *disLayout;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,assign) BOOL ifProblem;

@property(nonatomic,assign) CGFloat disLB_H;
@property(nonatomic,assign) CGFloat scro_H;
@property(nonatomic,assign) CGFloat backView_H;


-(instancetype)initWithModel:(id)model;
@end
