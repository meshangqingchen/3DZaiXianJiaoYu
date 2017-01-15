//
//  LCUserTeacherTalkCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/3.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    fromTeacher = 0,
    fromUser
}messageFromWho;



@interface LCUserTeacherTalkCellViewModel : NSObject
@property(nonatomic,strong) NSURL *headImageURL;
@property(nonatomic,strong) NSString *messageBody;
@property(nonatomic,strong) YYTextLayout *messageBodyLayout;
@property(nonatomic,assign) CGFloat cell_H;
@property(nonatomic,assign) CGFloat messageBody_H;
@property(nonatomic,assign) CGFloat messageBody_W;
@property(nonatomic,assign) messageFromWho fromWho;


-(instancetype)initWithModel:(id)viewModel;

@end
