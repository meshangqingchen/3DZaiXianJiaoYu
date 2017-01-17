//
//  LCCourseClassFCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCCourseClassSCellViewModel.h"
@interface LCCourseClassFCellViewModel : NSObject
@property(nonatomic,strong) NSString *iid;
@property(nonatomic,strong) NSURL    *imageURL;
@property(nonatomic,strong) NSString *leftTitle;
@property(nonatomic,strong) NSArray <LCCourseClassSCellViewModel *>*sonList;
@property(nonatomic,copy) void (^clickHeadView)(NSString *iid,NSString *title);
-(instancetype)initWithModel:(id)model;
@end
