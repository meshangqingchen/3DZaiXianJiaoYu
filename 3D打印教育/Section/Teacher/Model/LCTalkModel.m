//
//  LCTalkModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/19.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTalkModel.h"

@implementation LCTalkModel

@end
@implementation LCTalkContents

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [LCTalkList class]};
}
@end


@implementation LCTalkTeacher
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


@implementation LCTalkUser

@end


@implementation LCTalkList
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discrip":@"description"};
}
@end


