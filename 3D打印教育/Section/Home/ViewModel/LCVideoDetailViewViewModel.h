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
@property(nonatomic,copy) void (^joinFreeCourse)(NSString *courseID); //
@property(nonatomic,assign) BOOL ifCollected;     //是否收藏过了
@property(nonatomic,strong) NSString *courseID;   //课程ID;

-(instancetype)initWithViewModel:(id)viewModel;


@end
