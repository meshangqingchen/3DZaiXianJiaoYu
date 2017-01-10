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
@property(nonatomic,copy) void (^clickBanner)(NSInteger carouselTyp, NSString *iid);

@end
