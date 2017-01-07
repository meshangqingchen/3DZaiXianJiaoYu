//
//  LCLoginViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCLoginViewModel.h"

@implementation LCLoginViewModel
-(void)initialize{
    [super initialize];
    @weakify(self)
    [self setGoBackVC:^{
        @strongify(self)
        [self.navigationStackService dismissViewModelAnimated:YES completion:nil];
    }];
}
@end
