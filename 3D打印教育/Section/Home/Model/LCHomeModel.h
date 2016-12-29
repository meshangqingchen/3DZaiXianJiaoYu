//
//  LCHomeModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/27.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCHomeContents,LCHomeCarousellist,LCHomePlan,LChomeList;
@interface LCHomeModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCHomeContents *contents;

@end
@interface LCHomeContents : NSObject

@property (nonatomic, strong) NSArray<LCHomeCarousellist *> *carouselList;

@property (nonatomic, strong) NSArray<LCHomePlan *> *plan;

@end

@interface LCHomeCarousellist : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *big_image;

@property (nonatomic, copy) NSString *created_time;

//@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *recommend;

//@property (nonatomic, copy) NSString *type;

//@property (nonatomic, copy) NSString *discri;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *image;

//@property (nonatomic, copy) NSString *class_id;

//@property (nonatomic, copy) NSString *sort;

@property (nonatomic, assign) NSInteger carousel_type;

@property (nonatomic, copy) NSString *name;

@end

@interface LCHomePlan : NSObject

@property (nonatomic, assign) NSInteger template_type;

@property (nonatomic, copy) NSString *plan_type_name;

@property (nonatomic, strong) NSArray<LChomeList *> *list;

@end

@interface LChomeList : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *big_image;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *recommend;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *discription;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *class_id;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *status;

@end

