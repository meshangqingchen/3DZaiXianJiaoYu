//
//  LCVideoDetailViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseViewModel.h"

@interface LCVideoDetailViewModel : BaseViewModel
@property(nonatomic,strong) NSString *planID;
@property(nonatomic,strong) NSURL *imageUrl;
@property(nonatomic,strong) NSString *titleti;

@property(nonatomic,copy) void (^networkRequests)(NSString *planID);
@property(nonatomic,copy) void (^bindViewModel)(id viewModel);
@property(nonatomic,copy) void (^chuanShuData)(id model);


@property(nonatomic,copy) void (^collectVideo)(NSString *courseID,UIButton *collection_BT);//收藏
@property(nonatomic,copy) void (^pinglunVideo)(NSString *courseID);//评论
@property(nonatomic,copy) void (^joinFreeCourse)(NSString *courseID); //免费参加课程
@property(nonatomic,copy) void (^joinFreeCourseSucceed)();

@property(nonatomic,copy) void (^creatOrder)(NSString *couresID,NSString *price,NSURL *urlStr,NSString *title);// 课程是 收费的生成订单第一步.

@property(nonatomic,copy) void (^sendPingLun)(NSString *courseID,NSString* des,int garde);

@property(nonatomic,copy) void (^popLcInputAccessoryView)(NSString *courseID); //弹出评论键盘

@property(nonatomic,copy) void (^creatplayerModel)(); //付费成功之后毁掉过来 在回调控制器 创建playerModel.自动播放
@end
