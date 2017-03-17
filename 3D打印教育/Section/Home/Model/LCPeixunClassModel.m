//
//  LCBaoMingClassModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPeixunClassModel.h"

@implementation LCPeixunClassModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contents" : [LCPeixunClassContents class]};

}
@end
@implementation LCPeixunClassContents
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"iid" : @"id",@"descrip":@"description"};//descrip
}
@end

