//
//  LCVideoDetailViewViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCVideoDetailViewViewModel : NSObject

//事件
//@property(nonatomic,copy) void (^downLoadVideo)(NSString* videoID);
//@property(nonatomic,copy) void (^shareVideo)(NSString *videoID);



@property(nonatomic,copy) void (^collectVideo)(NSString *courseID,UIButton *collection_BT); //收藏
@property(nonatomic,copy) void (^pinglunVideo)(NSString *courseID); //评论
@property(nonatomic,copy) void (^joinFreeCourse)(NSString *courseID); //免费加入课程
@property(nonatomic,copy) void (^creatOrder)(NSString *couresID,NSString *price,NSURL *urlStr,NSString *title);// 课程是 收费的生成订单第一步.

@property(nonatomic,assign) BOOL ifFree;
@property(nonatomic,assign) BOOL ifCollected;     //是否收藏过了
@property(nonatomic,strong) NSString *courseID;   //课程ID;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSURL  *imageURL;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,assign) NSInteger isAssess;

-(instancetype)initWithViewModel:(id)viewModel;


@end
