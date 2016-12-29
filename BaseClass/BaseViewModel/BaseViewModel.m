//
//  BaseViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()

@property(nonatomic,strong, readwrite) KDNetAPIManager_User *netApi_Manager;
@property (nonatomic, copy, readwrite) NSDictionary *params;
@property(nonatomic,strong,readwrite) id <LCNavigationProtocol> navigationStackService;

@end

@implementation BaseViewModel

-(instancetype)initWithServices:(id<LCNavigationProtocol>)services params:(NSDictionary *)params{
    if (self = [super init]) {
        self.params = params;
        self.title = params[KEY_TITLE];
        self.navigationStackService = services;
        self.netApi_Manager = [KDNetAPIManager_User sharedKDNetAPIManager_User];
        [self initialize];
    }
    return self;
}

-(void)initialize{
//父类来实现
};
@end
