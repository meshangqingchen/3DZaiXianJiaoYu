//
//  LCHomeCollectionBananaViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/28.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeCollectionBananaViewModel.h"
#import "LCHomeModel.h"
@implementation LCHomeCollectionBananaViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCHomeCarousellist *carouselModel = model;
        self.iid = carouselModel.iid;
        self.imageURL = [NSURL URLWithString:carouselModel.image];
        self.detailURL = [NSURL URLWithString:carouselModel.url];
        self.name = carouselModel.name;
    }
    return self;
}
@end
