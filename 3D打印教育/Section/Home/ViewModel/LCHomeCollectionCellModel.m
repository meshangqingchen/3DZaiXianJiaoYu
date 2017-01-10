//
//  LCHomeCollectionCellModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeCollectionCellModel.h"
#import "LCHomeModel.h"
@implementation LCHomeCollectionCellModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCHomeRecommendclasstypelist *recommendClassType = model;
        self.bigImgURL = [NSURL URLWithString:recommendClassType.big_image];
        self.smallImgURL = [NSURL URLWithString:recommendClassType.image];
        self.title = recommendClassType.name;
        self.idd = recommendClassType.iid;
    }
    return self;
}
@end
