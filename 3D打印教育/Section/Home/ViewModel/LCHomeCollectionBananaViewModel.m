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
        LCHomeCarousellist *homeCarouselList = model;
        
        self.name = homeCarouselList.name;
        self.carouselType = homeCarouselList.carousel_type;
        self.iid = homeCarouselList.iid;
        self.smallImageURL = homeCarouselList.image;
        self.bigImageURL = homeCarouselList.big_image;
    }
    return self;
}
@end
