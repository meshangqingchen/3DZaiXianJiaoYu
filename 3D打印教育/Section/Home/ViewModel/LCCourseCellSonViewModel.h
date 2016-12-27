//
//  LCCourseCellSonViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCourseCellSonViewModel : NSObject
@property(nonatomic,strong) NSURL *videoURL;
@property(nonatomic,strong) NSString *title;
-(instancetype)initWithModel:(id)model;
@end
