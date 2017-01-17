//
//  LCCourseClassModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassModel.h"

@implementation LCCourseClassModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCCourseClassContents class]};
}
@end


@implementation LCCourseClassContents
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sonList" : [LCCourseClassSonlist class]};
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


@implementation LCCourseClassSonlist
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


