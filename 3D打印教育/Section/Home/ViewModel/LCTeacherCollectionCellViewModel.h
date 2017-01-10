//
//  LCTeacherCollectionCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTeacherCollectionCellViewModel : NSObject
@property(nonatomic,strong) NSURL *headImageURL;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *introduce;
@property(nonatomic,strong) NSString *textViewText;
@property(nonatomic,strong) NSString *teacherID;

-(instancetype)initWithModel:(id)model;
@end
