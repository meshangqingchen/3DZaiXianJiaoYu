//
//  LCHomeDetailModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/28.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeDetailModel.h"

@implementation LCHomeDetailModel

@end


@implementation LCCourseDetailContents

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"videoList" : [LCCourseModelVideolist class]};
}
@end


@implementation LCCourseModelTeacher

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}

@end


@implementation LCCourseModelVideolist

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}

@end


