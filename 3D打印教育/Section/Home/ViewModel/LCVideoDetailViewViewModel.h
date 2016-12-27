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
@property(nonatomic,copy) void (^downLoadVideo)(NSString* videoID);
@property(nonatomic,copy) void (^shareVideo)(NSString *videoID);
@property(nonatomic,copy) void (^collectVideo)(NSString *videoID,UIButton *collection_BT);
@property(nonatomic,copy) void (^pinglunVideo)(NSString *videoID);
@property(nonatomic,copy) void (^consultVideo)(NSString *videoID);

-(instancetype)initWithViewModel:(id)viewModel;
@end
