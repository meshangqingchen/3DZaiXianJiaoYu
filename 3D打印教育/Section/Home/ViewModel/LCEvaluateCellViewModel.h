//
//  LCEvaluateCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/15.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCSonEvaluateCellViewModel.h"
@interface LCEvaluateCellViewModel : NSObject
@property(nonatomic,strong) NSURL    *imgURL;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *evaluate;
@property(nonatomic,strong) NSArray <LCSonEvaluateCellViewModel *>*sonEvaluate;

-(instancetype)initWithModel:(id)model;

@end
