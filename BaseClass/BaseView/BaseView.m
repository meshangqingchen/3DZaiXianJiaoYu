//
//  BaseView.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

//-(instancetype)init{
//    self = [super init];
//    
//    if (self) {
//    
//    }
//    return self;
//}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{

};
-(void)bindViewModel:(id)viewModel{

};
@end
