//
//  LCHistoryTalkTeacherModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/8.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCHistoryTalkTeacherModel.h"

@implementation LCHistoryTalkTeacherModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCHistoryTalkContents class]};
}

@end
@implementation LCHistoryTalkContents
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discrip":@"discription"};
}
@end


