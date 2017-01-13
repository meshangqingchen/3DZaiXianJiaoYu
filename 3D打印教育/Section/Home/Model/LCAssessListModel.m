//
//  LCAssessListModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/11.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCAssessListModel.h"

@implementation LCAssessListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCAssessList class]};
}
@end



@implementation LCAssessList
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"descrip":@"description"};//descrip
}
@end


