//
//  LCHomeCollectionSectionModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeCollectionSectionModel.h"
#import "LCHomeModel.h"
#import "LCHomeCollectionCellModel.h"

@implementation LCHomeCollectionSectionModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        self.sectionTyp = LCNormail;//默认值
        LCHomePlan *homePlanModel = model;
        if (homePlanModel.template_type == 1) {
            self.sectionTyp = LCNormail;
        }if (homePlanModel.template_type == 2) {
            self.sectionTyp = LCBigImageAddText;
        }if (homePlanModel.template_type == 3) {
            self.sectionTyp = LCBigImage;
        }
        self.sectionTitle = homePlanModel.plan_type_name;
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int i=0; i<homePlanModel.list.count; i++) {
            LCHomeCollectionCellModel *cellVM = [[LCHomeCollectionCellModel alloc]initWithModel:homePlanModel.list[i]];
            [tempArr addObject:cellVM];
        }
        self.data = tempArr.copy;
    }
    return self;
}

@end
