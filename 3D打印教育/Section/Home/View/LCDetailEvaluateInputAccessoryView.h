//
//  LCDetailEvaluateInputAccessoryView.h
//  3D打印教育
//
//  Created by 3D on 16/12/22.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseView.h"
#import "UIPlaceHolderTextView.h"
#import "KDFiveStarView.h"
@interface LCDetailEvaluateInputAccessoryView : BaseView
@property(nonatomic,strong) UIPlaceHolderTextView *textView;
@property(nonatomic,strong) UIButton *fasongBT;
@property(nonatomic,strong) KDFiveStarView *starView;
@end
