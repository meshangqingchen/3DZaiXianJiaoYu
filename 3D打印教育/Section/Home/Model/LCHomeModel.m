//
//  LCHomeModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/27.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeModel.h"

@implementation LCHomeModel

@end
@implementation LCHomeContents

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"carouselList" : [LCHomeCarousellist class], @"plan" : [LCHomePlan class]};
}

@end


@implementation LCHomeCarousellist

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",
             @"discri" : @"discription"};
}

@end


@implementation LCHomePlan

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [LChomeList class]};
}

@end


@implementation LChomeList

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
    
}

@end


