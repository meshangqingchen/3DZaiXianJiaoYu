//
//  LCHomeCollectionCellModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LCHomeCollectionCellModel : NSObject
@property(nonatomic,strong) NSURL *imgURL;
@property(nonatomic,strong) NSString *title;

-(instancetype)initWithModel:(id)model;
@end
