//
//  LCMembersPriceModel.m
//  3D打印教育
//
//  Created by 3D on 17/2/27.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCMembersPriceModel.h"

@implementation LCMembersPriceModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCMemberPriceContents class]};
}

@end
@implementation LCMemberPriceContents
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


