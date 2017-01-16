//
//  LCCourseListModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseListModel.h"

@implementation LCCourseListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCCourseModel class]};
}

@end
@implementation LCCourseModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


