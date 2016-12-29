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
@property(nonatomic,copy) void (^networkRequests)(NSString *planID);
@property(nonatomic,copy) void (^bindViewModel)(id viewModel);

@property(nonatomic,copy) void (^downLoadVideo)(NSString* videoID);
@property(nonatomic,copy) void (^shareVideo)(NSString *videoID);
@property(nonatomic,copy) void (^collectVideo)(NSString *videoID,UIButton *collection_BT);
@property(nonatomic,copy) void (^pinglunVideo)(NSString *videoID);
@property(nonatomic,copy) void (^consultVideo)(NSString *videoID);
@property(nonatomic,copy) void (^popLcInputAccessoryView)(NSString *videoID);


@end
