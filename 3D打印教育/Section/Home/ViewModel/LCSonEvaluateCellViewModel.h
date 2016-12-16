//
//  LCSonEvaluateCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/15.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCSonEvaluateCellViewModel : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *sonEvalua;
@property(nonatomic,strong) YYTextLayout *textLayout;
@property(nonatomic,assign) CGFloat sonEva_H;
-(instancetype)initWithModel:(id)model;
-(instancetype)initWithName:(NSString *)string and:(NSString*)sonEvalua;

@end
