//
//  LCIntroViewViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/11.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCIntroViewViewModel : NSObject

@property(nonatomic,strong) NSString *favCount;
@property(nonatomic,strong) NSURL *teacherHeaderURL;
@property(nonatomic,strong) NSArray *teacherShaortDiscriptions;
@property(nonatomic,strong) NSString *courseNamel;
@property(nonatomic,strong) NSString *courseDisCription;

-(instancetype)initWithModel:(id)model;

@end
