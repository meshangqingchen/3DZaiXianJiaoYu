//
//  LCVideoDetailViewViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailViewViewModel.h"
#import "LCHomeDetailModel.h"

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
    }
    return self;
}
@end
