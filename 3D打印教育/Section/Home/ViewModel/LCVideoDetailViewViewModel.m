//
//  LCVideoDetailViewViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailViewViewModel.h"

@implementation LCVideoDetailViewViewModel
-(instancetype)initWithViewModel:(id)viewModel{
    if (self = [super init]) {
        LCHomeDetailModel *homeDetailModel = viewModel;
        self.courseID = homeDetailModel.contents.iid;
        if ([homeDetailModel.contents.is_fav isEqualToString:@"1"]) {
            self.ifCollected = YES;
        }else if ([homeDetailModel.contents.is_fav isEqualToString:@"0"]){
            self.ifCollected = NO;
        }
        if ([homeDetailModel.contents.is_free isEqualToString:@"1"]) {
            self.ifFree = YES;
        }else if ([homeDetailModel.contents.is_free isEqualToString:@"0"]){
            self.ifFree = NO;
            if (Apponline) {
               self.ifFree = YES;
            }
        }
        if (homeDetailModel.contents.is_play == 1) {
            self.ifPlay = YES;
        }else if (homeDetailModel.contents.is_play == 0){
            self.ifPlay = NO;
        }
        self.isAssess = homeDetailModel.contents.is_assess;
        self.price = homeDetailModel.contents.price;
        self.imageURL = [NSURL URLWithString:homeDetailModel.contents.image];
        self.title = homeDetailModel.contents.name;
        LCVideoDetailVideolist *firstVideo = homeDetailModel.contents.videoList.firstObject;
        self.firstVideo = firstVideo;
    }
    return self;
}
@end
