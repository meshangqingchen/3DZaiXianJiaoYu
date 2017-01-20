//
//  LCHomeViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseCollectionViewModel.h"

@interface LCHomeViewModel : BaseCollectionViewModel
@property(nonatomic,strong) NSArray *homeBannerDataArr;
@property(nonatomic,strong) NSArray *homesignUpListDataArr;
@property(nonatomic,copy) void (^clickBanner)(NSString *className, NSURL *webURL);
@property(nonatomic,copy) void (^clickBT)(NSString *className, NSURL *webURL); //跳转banner下面的三个按钮
@property(nonatomic,copy) void (^pushToTeacherDetailViewModel)(NSString *teacherID); //跳转到teacher的详情


@property(nonatomic,copy) void (^moreClick)(NSIndexPath *indexpath);
@property(nonatomic,copy) void (^searchClick)();
@end
