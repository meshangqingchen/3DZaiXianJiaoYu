//
//  LCSelectBirthdayAlerView.m
//  无限教育
//
//  Created by 3D on 16/11/22.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCSelectBirthdayAlerView.h"

@implementation LCSelectBirthdayAlerView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [KDColor getC0Color];
        self.layer.cornerRadius  = 4;
        [self setUpviews];
    }
    return self;
}

-(void)setUpviews{
    self.datePickerView = [UIDatePicker new];
    self.datePickerView.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
    self.datePickerView.locale = locale;
    [self addSubview:self.datePickerView];
    [self.datePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_equalTo(200);
    }];
    @weakify(self)
    [self.datePickerView addBlockForControlEvents:UIControlEventValueChanged block:^(id  _Nonnull sender) {
        @strongify(self)
        UIDatePicker *datePicker = sender;
        NSDate *birthdayDate = datePicker.date;
        NSString *timeStr = [NSString stringWithFormat:@"%.0f",[birthdayDate timeIntervalSince1970]];//要传给后台的 时间戳
        self.timeStr = timeStr;
//        NSString *birthdayStr = [[self CreatdateFormatter] stringFromDate:birthdayDate];
    }];
    
    UIView *horizontalLineView = [UIView new];
    horizontalLineView.backgroundColor = [KDColor getC15Color];
    [self addSubview:horizontalLineView];
    [horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.datePickerView.mas_bottom).mas_equalTo(0);
        make.height.mas_equalTo(0.5);//
        
    }];
    
    UIView *verticalLineView = [UIView new];
    [self addSubview:verticalLineView];
    verticalLineView.backgroundColor = [KDColor getC15Color];
    [verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.datePickerView.mas_bottom).mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(0.5);
    }];
    
    UIButton *leftBT = [UIButton new];
    self.leftBT = leftBT;
    [self addSubview: leftBT];
    [leftBT setTitle:@"取消修改" forState:UIControlStateNormal];
    [leftBT setTitleColor:[KDColor getC3Color] forState:UIControlStateNormal];
    leftBT.titleLabel.font = [[KDFont new]getF30Font];
    [leftBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.top.mas_equalTo(horizontalLineView.mas_bottom).mas_equalTo(0);
        make.right.mas_equalTo(verticalLineView.mas_left).mas_equalTo(0);
    }];
    
    UIButton *rightBt = [UIButton new];
    self.rightBt = rightBt;
    [self addSubview: rightBt];
    [rightBt setTitle:@"确定修改" forState:UIControlStateNormal];
    [rightBt setTitleColor:[KDColor getC2Color] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [[KDFont new]getF30Font];
    [rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(horizontalLineView.mas_bottom).mas_equalTo(0);
        make.left.mas_equalTo(verticalLineView.mas_right).mas_equalTo(0);
    }];
}

- (NSDateFormatter *)CreatdateFormatter {
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"YYYY--MM--dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormatter setTimeZone:timeZone];
    return dateFormatter;
}

@end
