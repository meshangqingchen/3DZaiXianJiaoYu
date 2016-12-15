//
//  LCEvaluateViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateViewModel.h"
#import "LCSonEvaluateCellViewModel.h"
@implementation LCEvaluateViewModel
-(void)initialize{
    [super initialize];
}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    LCSonEvaluateCellViewModel *sonEvaluate = [[LCSonEvaluateCellViewModel alloc]initWithModel:nil];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    
}
@end
