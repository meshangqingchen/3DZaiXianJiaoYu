//
//  LCNotarizeOrderModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCNotarizeOrderViewModel.h"
#import "NSObject+Common.h"
@implementation LCNotarizeOrderViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
    @weakify(self)
    [self setNetworkRequest:^ {
        @strongify(self)
        [self.netApi_Manager creatOrderWith:self.courseID andPrice:self.price completeHandle:^(id responseObj, NSError *error) {
            
            NSDictionary *dic = responseObj;
            if ([dic[@"status"] isEqualToNumber:@0]) {
                [NSObject showWarning:dic[@"msg"]];
            }
//            {
//                "status" : 1,
//                "needlogin" : 0,
//                "morepage" : 0,
//                "msg" : "操作成功",
//                "contents" : {
//                    "order_sn" : "9000000000001001"
//                }
//            }

            
        }];
    }];
}

-(instancetype)initWithServices:(id<LCNavigationProtocol>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        self.titleName = params[@"titleName"];
        self.price = params[@"price"];
        self.imageURL = params[@"urlStr"];
        self.courseID = params[@"couresID"];
    }
    return self;
}
@end
