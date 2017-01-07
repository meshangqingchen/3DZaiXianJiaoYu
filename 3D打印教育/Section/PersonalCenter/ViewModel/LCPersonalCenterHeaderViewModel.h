//
//  LCPersonalCenterHeaderViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCPersonalCenterHeaderViewModel : NSObject
@property(nonatomic,strong) NSURL *headerImageURL;
@property(nonatomic,strong) NSString *topTitle;
@property(nonatomic,strong) NSString *signature;
@property(nonatomic,assign) BOOL ifNeedLog;

//事件
@property(nonatomic,copy) void (^goToLoginVC)();


-(instancetype)initWithModel:(id)model;
@end
