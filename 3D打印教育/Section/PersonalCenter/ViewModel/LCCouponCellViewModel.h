//
//  LCCouponCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/23.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    ZheKouQuan = 0,
    XianJinQuan
    
}YouHuiQuan;



@interface LCCouponCellViewModel : NSObject

@property (nonatomic, copy) NSString *coupon_discount;

@property (nonatomic, copy) NSString *coupon_rule;

@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, copy) NSString *coupon_name;

@property(nonatomic,assign) YouHuiQuan youHuiQianType;

@property(nonatomic,copy) void (^pushCourseList)(); //跳转到更多精品课程
-(instancetype)initWithModel:(id)model;
@end
