//
//  LCSelectBirthdayAlerView.h
//  无限教育
//
//  Created by 3D on 16/11/22.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSelectBirthdayAlerView : UIView
@property(nonatomic,strong) UIDatePicker *datePickerView;
@property(nonatomic,strong) UIButton *leftBT;
@property(nonatomic,strong) UIButton *rightBt;

@property(nonatomic,strong) NSString *timeStr;
@end
