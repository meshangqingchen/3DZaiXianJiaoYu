//
//  LCCourseClassViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseCollectionViewModel.h"

@interface LCCourseClassViewModel : BaseCollectionViewModel
@property(nonatomic,copy) void (^clickHeadView)(NSString *iid,NSString *title);
@end
