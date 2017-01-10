//
//  LCHomeCollectionBananaViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/28.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHomeCollectionBananaViewModel : NSObject

@property (nonatomic, copy) NSString *iid;
@property (nonatomic, copy) NSURL *imageURL;
@property (nonatomic, copy) NSURL *detailURL;

@property (nonatomic, copy) NSString *name;

//事件
@property(nonatomic,copy) void (^clickBanner)(NSInteger carouselTyp, NSString *iid);
-(instancetype)initWithModel:(id)model;
@end
