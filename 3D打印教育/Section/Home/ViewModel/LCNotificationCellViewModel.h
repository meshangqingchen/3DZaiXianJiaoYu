//
//  LCNotificationCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/29.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCNotificationCellViewModel : NSObject
@property(nonatomic,strong) NSString *nickName;
@property(nonatomic,strong) YYTextLayout *detailLayout;
@property(nonatomic,strong) NSString *timeStr;
@property(nonatomic)BOOL ifReaded;
@property(nonatomic)CGFloat detail_H;
@property(nonatomic)CGFloat cell_H;

-(instancetype)initWithModel:(id)model;
-(instancetype)initWithDic:(id)Model;
@end
