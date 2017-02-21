//
//  LCZheKouQuanViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/21.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCZheKouQuanViewModel.h"

@implementation LCZheKouQuanViewModel
-(void)initialize{
    [super initialize];
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    self.dataSource = @[@1,@2];
}

@end
