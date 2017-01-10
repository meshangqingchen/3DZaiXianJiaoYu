//
//  LCHomeSmallCollectionCellModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHomeSmallCollectionCellModel : NSObject
@property(nonatomic,strong) NSURL *smallImgURL;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *idd;

-(instancetype)initWithModel:(id)model;

@end
