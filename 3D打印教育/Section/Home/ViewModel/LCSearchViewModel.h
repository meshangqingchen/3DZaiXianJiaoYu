//
//  LCSearchViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//  跟多精品

#import "BaseCollectionViewModel.h"

@interface LCSearchViewModel : BaseCollectionViewModel
@property(nonatomic,copy) void (^searchKeyWord)(NSString *key);
@end
