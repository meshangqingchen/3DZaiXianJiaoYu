//
//  LCFeedbackViewModel.h
//  无限教育
//
//  Created by 3D on 16/10/28.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCFeedbackViewModel : BaseViewModel
@property(nonatomic,copy) void (^sendIder)(NSString *msg,NSString *contact);

@end
