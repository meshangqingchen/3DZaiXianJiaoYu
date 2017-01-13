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
    return @{@"classTypeList" : [LCHomeClasstypelist class], @"recommendClassTypeList" : [LCHomeRecommendclasstypelist class], @"teacherList" : [LCHomeTeacherlist class], @"carouselList" : [LCHomeCarousellist class], @"signUpList" : [LCHomeSignuplist class]};
}

@end

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"iid" : @"id",@"discription":@"discrip"};
//}



@implementation LCHomeClasstypelist
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


@implementation LCHomeRecommendclasstypelist

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discrip":@"discription"};
}

@end


@implementation LCHomeTeacherlist
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id"};
}
@end


@implementation LCHomeCarousellist
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discrip":@"discription"};//discrip
}
@end


@implementation LCHomeSignuplist
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"discrip":@"discription"};
}
@end


