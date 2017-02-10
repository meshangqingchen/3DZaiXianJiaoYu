//
//  LCJoinCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCJoinCellViewModel : NSObject
@property(nonatomic,strong) NSURL *leftImageURL;
@property(nonatomic,strong) NSString *topStr;
@property(nonatomic,strong) NSString *middleStr;
@property(nonatomic,strong) NSString *bottomStr;
@property(nonatomic,strong) NSString *courseIID;

-(instancetype)initWithModel:(id)model;

@end
