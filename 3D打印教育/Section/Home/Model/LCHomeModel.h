//
//  LCHomeModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/27.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCHomeContents,LCHomeClasstypelist,LCHomeRecommendclasstypelist,LCHomeTeacherlist,LCHomeCarousellist,LCHomeSignuplist;
@interface LCHomeModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCHomeContents *contents;


@end

@interface LCHomeContents : NSObject

@property (nonatomic, strong) NSArray<LCHomeClasstypelist *> *classTypeList;

@property (nonatomic, strong) NSArray<LCHomeRecommendclasstypelist *> *recommendClassTypeList;

@property (nonatomic, strong) NSArray<LCHomeTeacherlist *> *teacherList;

@property (nonatomic, strong) NSArray<LCHomeCarousellist *> *carouselList;

@property (nonatomic, strong) NSArray<LCHomeSignuplist *> *signUpList;

@end

@interface LCHomeClasstypelist : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *updated_time;

@end

@interface LCHomeRecommendclasstypelist : NSObject

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *big_image;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *created_time;

@end

@interface LCHomeTeacherlist : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *discrip;

@property (nonatomic, copy) NSString *shot_discription;

@end

@interface LCHomeCarousellist : NSObject

@property (nonatomic, copy) NSString *discrip;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *url;

@end

@interface LCHomeSignuplist : NSObject

@property (nonatomic, copy) NSString *discrip;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *url;

@end

