//
//  LCCourseViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//  评论

#import "LCCourseViewModel.h"
#import "LCHomeDetailModel.h"

#import "LCCourseCellViewModel.h"

@interface LCCourseViewModel ()
@property(nonatomic,strong) NSArray *videoList;
@end


@implementation LCCourseViewModel
-(void)initialize{
    [super initialize];
    
    @weakify(self)
    [self setFromVideoVMGetData:^(id model) {
        @strongify(self)
        LCHomeDetailModel *homeDetailModel = model;
        NSArray<LCVideoDetailVideolist *> *videoList = homeDetailModel.contents.videoList;
        self.videoList = videoList;
        for (int i = 0; i<videoList.count; i++) {
            LCCourseCellViewModel *cellVM = [[LCCourseCellViewModel alloc]initWithModel:videoList[i]];
            [self.mutableDataArr addObject:cellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
        
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    LCVideoDetailVideolist *detailVideo = self.videoList[indexpath.row];
    !self.selectVideoCell ? : self.selectVideoCell(detailVideo);
}
@end
