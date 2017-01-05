//
//  LCPersonalCenterCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCPersonalCenterCellViewModel : NSObject
@property(nonatomic,strong) NSString *titleName;
@property(nonatomic,strong) NSString *imageName;

-(instancetype)initWithModel:(id)model;
@end
