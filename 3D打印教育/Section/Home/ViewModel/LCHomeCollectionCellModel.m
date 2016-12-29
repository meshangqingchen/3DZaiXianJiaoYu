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
        LChomeList *homeList = model;
        self.title = homeList.name;
        self.bigImgURL = [NSURL URLWithString:homeList.big_image];
        self.smallImgURL = [NSURL URLWithString:homeList.image];
        self.idd = homeList.iid;
    }
    return self;
}
@end
