//
//  LCHistoryTalkCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/3/8.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHistoryTalkCellViewModel : NSObject

/*
 "nick_name" : "杨伟东",
 "avatar" : "http:\/\/www.wxswjy.com\/Upload\/image\/avatar\/2017-01-15\/587b47386e008.png",
 "position" : "高级讲师",
 "id" : "14",
 "nameCN" : "YANG WEI DONG",
 "time" : "01-01 08:00",
 "message" : null
 */

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSURL *avatarURL;
@property(nonatomic,strong) NSString *time;
@property(nonatomic,strong) NSString *lastMG;
@property(nonatomic,strong) NSString *teacherID;
-(instancetype)initWithModel:(id)model;
@end
