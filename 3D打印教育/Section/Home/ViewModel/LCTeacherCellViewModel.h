//
//  LCTeacherCellViewModel.h
//  无限教育
//
//  Created by 3D on 16/11/8.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LCTeacherCellViewModel : NSObject

@property(nonatomic,strong) NSString *teacherName;
@property(nonatomic,strong) NSString *teacherDetail;

@property(nonatomic,strong) NSURL *teacherHeadImageURL;
@property(nonatomic, strong) YYTextLayout *nameTextLayout; //用户名字
@property(nonatomic, strong) YYTextLayout *detailTextLayout; 

@property(nonatomic,assign) CGFloat name_h;
@property(nonatomic,assign) CGFloat detail_h;
@property(nonatomic,assign) CGFloat teacherBackView_h;
@property(nonatomic,assign) CGFloat teacherCellTotal_h;


-(instancetype)initWithModel:(id)model;
@end
