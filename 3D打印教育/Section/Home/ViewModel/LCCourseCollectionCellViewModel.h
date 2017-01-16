//
//  LCCourseCollectionCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCourseCollectionCellViewModel : NSObject
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *iid;
@property(nonatomic,strong) NSURL *imageURL;
-(instancetype)initWithModel:(id)model;
@end
