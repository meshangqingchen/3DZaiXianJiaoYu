//
//  LCEditPersonalDetailCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/9.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCEditPersonalDetailCellViewModel : NSObject

@property(nonatomic,strong) NSString *leftTitle;
@property(nonatomic,strong) NSString *rightTitle;
@property(nonatomic,strong) NSURL *rightURL;
@property(nonatomic,assign) BOOL headerViewHidden;
-(instancetype)initWithModel:(id)model;
@end
