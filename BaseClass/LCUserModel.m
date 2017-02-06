//
//  LCUserModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/12.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCUserModel.h"
#import "NSString+PJR.h"
@implementation LCUserModel


@end
@implementation LCUserContents

@end

@implementation LCUser
-(instancetype)initWithUserContents:(LCUserContents *)userContents{
    if (self = [super init]) {
       
//        @property (nonatomic, copy) NSString *nick_name;
//        
//        @property (nonatomic, copy) NSString *sex;
//        
//        @property (nonatomic, copy) NSString *email;
//        
//        @property (nonatomic, copy) NSString *avatar;
//        
//        @property (nonatomic, copy) NSString *des;
//        
//        @property (nonatomic, copy) NSString *user_name;
//        
//        @property(nonatomic,strong) NSString *brithday;
        
        self.nick_name = @" ";
        self.sex = @" ";
        self.email = @" ";
        self.avatar = @" ";
        self.des = @" ";
        self.user_name = @" ";
        self.birthday = @" ";
        
        if (userContents.nick_name) {
            self.nick_name = userContents.nick_name;
        }
        if (userContents.sex) {
            self.sex = userContents.sex;
        }
        if (userContents.email) {
            self.email = userContents.email;
        }
        if (userContents.avatar) {
            self.avatar = userContents.avatar;
        }
        if (userContents.des) {
            self.des = userContents.des;
        }
        if (userContents.user_name) {
            self.user_name = userContents.user_name;
        }
        if (userContents.birthday) {
            self.birthday = [NSString getDataStrWithIntStr:userContents.birthday];
            
        }
    }
    return self;
}
@end
