//
//  LCMemberTopCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMemberTopCellViewModel : NSObject

@property(nonatomic,strong) NSString *stopTime;

-(instancetype)initWithModel:(id)model;

@end
