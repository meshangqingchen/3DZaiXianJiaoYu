//
//  LCPiexunClassCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCPiexunClassCellViewModel : NSObject
@property (nonatomic, copy) NSString *long_time;

@property (nonatomic, copy) NSURL *imgURL;

@property (nonatomic, copy) NSString *people;

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *online_price;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *updated_time;

@property (nonatomic, copy) NSString *descrip;//descrip//description

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *created_time;

-(instancetype)initWithModel:(id)model;

@end
