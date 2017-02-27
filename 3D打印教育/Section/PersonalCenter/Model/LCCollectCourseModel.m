//
//  LCCollectCourseModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCollectCourseModel.h"

@implementation LCCollectCourseModel

@end


@implementation LCCollectCourseContents

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [LCCollectCourseList class]};
}
@end


@implementation LCCollectCourseList
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


