
//
//  ADKaiPing.m
//  百度广告例子
//
//  Created by 马宝丽 on 16/4/18.
//  Copyright © 2016年 haishusichuang. All rights reserved.
//

#import "MBLHeaderImageView.h"

@interface MBLHeaderImageView()

@property (nonatomic ,retain) id target;
@property (nonatomic) SEL selector;

@end



@implementation MBLHeaderImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (void)addTarget:(id)target withSelector:(SEL)selector
{
    if (_target != target) {
//                [_target release];
//                _target = [target retain];
    }
    _target = target;
    _selector = selector;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_target respondsToSelector:_selector] == YES) {
//        [_target performSelector:_selector withObject:self];
//        [_target performSelector:_selector withObject:self];
    }
}

@end
