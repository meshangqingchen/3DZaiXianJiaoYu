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



@implementation LCVideoDetailContents


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"videoList" : [LCVideoDetailVideolist class]};
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}


@end


@implementation LCVideoDetailTeacher
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discription":@"discrip"};
}
@end


@implementation LCVideoDetailVideolist
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


