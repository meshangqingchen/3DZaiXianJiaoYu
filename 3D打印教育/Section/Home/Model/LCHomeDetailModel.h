//
//  LCHomeDetailModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/28.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCVideoDetailContents,LCVideoDetailTeacher,LCVideoDetailVideolist;
@interface LCHomeDetailModel : NSObject


@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LCVideoDetailContents *contents;


@end

@interface LCVideoDetailContents : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *big_image;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *is_fav;//是否收藏

@property (nonatomic, assign) NSInteger is_play;

@property (nonatomic, assign) NSInteger is_assess;//是否评价

@property (nonatomic, copy) NSString *recommend;

@property (nonatomic, copy) NSString *is_free;

@property (nonatomic, copy) NSString *type;
                                      
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, strong) LCVideoDetailTeacher *teacher;

@property (nonatomic, copy) NSString *class_id;

@property (nonatomic, strong) NSArray<LCVideoDetailVideolist *> *videoList;

@property (nonatomic, copy) NSString *fav_count;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *status;

@end

@interface LCVideoDetailTeacher : NSObject

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *position;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *nameCN;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *discrip;

@property (nonatomic, strong) NSArray<NSString *> *shot_discription;

@end

@interface LCVideoDetailVideolist : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *plan_id;

@property (nonatomic, copy) NSString *created_time;

@property (nonatomic, copy) NSString *recommend;

@property (nonatomic, copy) NSString *series_id;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *teacher_id;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *source_id;

@property (nonatomic, copy) NSString *root_id;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *status;

@end

