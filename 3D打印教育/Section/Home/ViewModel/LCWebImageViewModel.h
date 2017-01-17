//
//  LCWebImageViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCWebImageViewModel : BaseViewModel
@property(nonatomic,strong) NSURL *webURl;
@property(nonatomic,strong) NSString *className;

@property(nonatomic,copy) void (^baoMing)();

@end
