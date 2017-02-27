//
//  LCMemberViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCMemberViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^buyMembersCreatOrder)(NSString *memberCarID,NSString *price);

@end
