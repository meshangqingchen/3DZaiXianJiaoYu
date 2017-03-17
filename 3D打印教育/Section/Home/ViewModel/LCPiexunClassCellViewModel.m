//
//  LCPiexunClassCellViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPiexunClassCellViewModel.h"
#import "LCPeixunClassModel.h"
@implementation LCPiexunClassCellViewModel
-(instancetype)initWithModel:(id)model{
    if (self = [super init]) {
        LCPeixunClassContents *peixunModel = model;
        /*
         @property (nonatomic, copy) NSString *long_time;
         
         @property (nonatomic, copy) NSString *img;
         
         @property (nonatomic, copy) NSString *people;
         
         @property (nonatomic, copy) NSString *iid;
         
         @property (nonatomic, copy) NSString *price;
         
         @property (nonatomic, copy) NSString *online_price;
         
         @property (nonatomic, copy) NSString *status;
         
         @property (nonatomic, copy) NSString *updated_time;
         
         @property (nonatomic, copy) NSString *descrip;//descrip//description
         
         @property (nonatomic, copy) NSString *name;
         
         @property (nonatomic, copy) NSString *created_time;
         */
        self.long_time = peixunModel.long_time;
        self.imgURL = [NSURL URLWithString:peixunModel.img];
        self.people = peixunModel.people;
        self.price = peixunModel.price;
        self.iid = peixunModel.iid;
        self.online_price = peixunModel.online_price;
        self.descrip = peixunModel.descrip;
        self.name = peixunModel.name;
    }
    return self;
}
@end
