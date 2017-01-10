//
//  LCHomeSmallCollectionCellModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCHomeSmallCollectionCellModel.h"
#import "LCHomeModel.h"
@implementation LCHomeSmallCollectionCellModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCHomeClasstypelist *homeClassType = model;

        self.smallImgURL = [NSURL URLWithString:homeClassType.img];
        self.title = homeClassType.name;
        self.idd = homeClassType.iid;
    }
    return self;
}
@end
