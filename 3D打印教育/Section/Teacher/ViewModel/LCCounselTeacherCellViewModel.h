//
//  LCCounselTeacherCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCounselTeacherCellViewModel : NSObject
@property(nonatomic,strong) NSString *nickName;
@property(nonatomic,strong) NSURL *headInageURL;
@property(nonatomic,strong) NSString *shortDis;
@property(nonatomic,strong) NSString *teacherID;


-(instancetype)initWithModel:(id)model;
@end
