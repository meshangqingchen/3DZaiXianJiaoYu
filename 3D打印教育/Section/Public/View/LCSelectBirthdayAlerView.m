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
        make.edges.mas_equalTo(0);
    }];

}
@end
