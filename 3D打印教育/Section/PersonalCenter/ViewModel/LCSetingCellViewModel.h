//
//  LCSetingCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,LCRightViewType){
    jiantou,
    kaiguan,
    shuzi,
    kong
};
@interface LCSetingCellViewModel : NSObject
@property(nonatomic,strong) NSString *leftTitle;
@property(nonatomic,strong) NSString *middleTitle;
@property(nonatomic,assign) LCRightViewType rightTyp;

-(instancetype)initWithModel:(id)model;
@end
