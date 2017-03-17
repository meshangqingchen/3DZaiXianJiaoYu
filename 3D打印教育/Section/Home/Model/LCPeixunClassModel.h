//
//  LCBaoMingClassModel.h
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCPeixunClassContents;
@interface LCPeixunClassModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger needlogin;

@property (nonatomic, assign) NSInteger morepage;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<LCPeixunClassContents *> *contents;

@end
@interface LCPeixunClassContents : NSObject

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

@end

