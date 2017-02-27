//
//  LCMemberCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/2/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMemberCellViewModel : NSObject

@property (nonatomic, copy) NSString *iid;

@property (nonatomic, copy) NSString *longTime;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@property(nonatomic,copy) void (^buyMembersCreatOrder)(NSString *memberCarID,NSString *price);//后买会员或者续费
-(instancetype)initWithModel:(id)model;
@end
