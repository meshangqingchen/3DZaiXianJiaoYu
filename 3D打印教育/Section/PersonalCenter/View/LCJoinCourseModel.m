//
//  LCJoinCourseModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCJoinCourseModel.h"

@implementation LCJoinCourseModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCJoinCourseContents class]};
}
@end
@implementation LCJoinCourseContents
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


