//
//  LCDaiJinQuanViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCDaiJinQuanViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^pushCourseList)(); //跳转到更多精品课程
@end
