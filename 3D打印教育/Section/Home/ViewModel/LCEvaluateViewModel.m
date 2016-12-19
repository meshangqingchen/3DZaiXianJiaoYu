//
//  LCEvaluateViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateViewModel.h"
#import "LCSonEvaluateCellViewModel.h"
#import "LCEvaluateCellViewModel.h"
@implementation LCEvaluateViewModel
-(void)initialize{
    [super initialize];
}

-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    
    LCSonEvaluateCellViewModel *sonE1 = [[LCSonEvaluateCellViewModel alloc]initWithName:@"我是一只林中的小鸟1" and:@"我需要蓝天的怀抱,来不及祈祷就开始奔跑"];
    LCSonEvaluateCellViewModel *sonE2 = [[LCSonEvaluateCellViewModel alloc]initWithName:@"我是一只林中的小鸟2" and:@"我需要蓝天的怀抱,来不及祈祷就开始奔跑"];
    LCSonEvaluateCellViewModel *sonE3 = [[LCSonEvaluateCellViewModel alloc]initWithName:@"我是一只林中的小鸟3" and:@"我需要蓝天的怀抱,来不及祈祷就开始奔跑"];
    
    
    
    
    
    LCEvaluateCellViewModel *eval = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1,sonE2,sonE3,sonE1,sonE2,sonE3]];
    eval.imgURL = nil;
    eval.name = @"你全力以赴也打不败的男人";

    
    LCEvaluateCellViewModel *eval1 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1,sonE2,sonE3]];
    eval1.imgURL = nil;
    eval1.name = @"你全力以赴也打不败的男人";
    
    LCEvaluateCellViewModel *eval2 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1,sonE2]];
    eval2.imgURL = nil;
    eval2.name = @"你全力以赴也打不败的男人";
    
    LCEvaluateCellViewModel *eval3 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[sonE1]];
    eval3.imgURL = nil;
    eval3.name = @"你全力以赴也打不败的男人";
    
    LCEvaluateCellViewModel *eval4 = [[LCEvaluateCellViewModel alloc]initWithEvaluteStr:@"每当我情绪低落的时候我就会想想我为神马这么叼,每当我沾沾自喜的时候我就问自己为什吗比吊的人这么多" and:@[]];
    eval4.imgURL = nil;
    eval4.name = @"你全力以赴也打不败的男人";

    
    [self.mutableDataArr addObjectsFromArray:@[eval,eval1,eval2,eval3,eval4]];//@[eval,eval1,eval2,eval3,eval4]
    self.dataSource = self.mutableDataArr.copy;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    
}
@end
