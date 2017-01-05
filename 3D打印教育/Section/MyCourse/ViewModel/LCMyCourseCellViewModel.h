//
//  LCMyCourseCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMyCourseCellViewModel : NSObject
@property(nonatomic,strong) NSURL *courseImageURL;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *finishStr;
@property(nonatomic,strong) NSString *idd;

-(instancetype)initWithModel:(id)viewModel;

@end
