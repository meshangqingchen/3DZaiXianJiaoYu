//
//  LCEvaluateDetailViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/19.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCEvaluateDetailViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^headerViewBindViewModel)(id viewModel);
@end
