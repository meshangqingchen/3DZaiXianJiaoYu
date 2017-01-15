//
//  LCCounselTeacherModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCounselTeacherModel.h"

@implementation LCCounselTeacherModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCTeacherModel class]};
}
@end



@implementation LCTeacherModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discrip":@"discription"};
}
@end


