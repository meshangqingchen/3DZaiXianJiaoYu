//
//  LCMySelfMainCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCMySelfMainCellViewModel : NSObject
@property(nonatomic,strong) NSURL *headerImageURL;
@property(nonatomic,strong) NSString *nickName;
@property(nonatomic,strong) NSString *timeStr;
@property(nonatomic,strong) NSString *evaID;
@property(nonatomic,strong) YYTextLayout *evaDetailLayout;
@property(nonatomic,assign) CGFloat evaDetail_H;
@property(nonatomic,assign) CGFloat cell_H;

-(instancetype)initWithModel:(id)viewModel;
@end
