//
//  LCHomeCollectionSectionModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LCHomeCollectionSectionModel : NSObject
//@property(nonatomic,assign) LCSectionTyp sectionTyp;
@property(nonatomic,strong) NSString *sectionTitle;
@property(nonatomic,strong) NSArray *data;
@property(nonatomic,copy) void (^moreClick)(NSIndexPath *indexpath);

-(instancetype)initWithModel:(id)model;
@end
