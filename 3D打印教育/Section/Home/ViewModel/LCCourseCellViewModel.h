//
//  LCCourseCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCourseCellViewModel : NSObject
@property(nonatomic,strong) NSString *idd;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSURL *imageURL;
@property(nonatomic,strong) NSURL *videoURL;
@property(nonatomic,strong) NSString *creatTime;
-(instancetype)initWithModel:(id)model;
@end
