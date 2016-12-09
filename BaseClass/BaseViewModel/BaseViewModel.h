//
//  BaseViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

@property (nonatomic, copy, readonly) NSDictionary *params;
@property (nonatomic, copy) NSString *title;
/// 添加导航left back item
@property (nonatomic, assign) BOOL shouldNavBackItem;


-(instancetype)initWithServices:(id)services params:(NSDictionary *)params;
- (void)initialize;
@end
