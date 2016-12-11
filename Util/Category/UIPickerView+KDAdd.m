//
//  UIPickerView+KDAdd.m
//  PetAnimals
//
//  Created by bigdata on 16/8/19.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "UIPickerView+KDAdd.h"
#import <objc/runtime.h>

@implementation UIPickerView (KDAdd)

- (void)clearSpearatorLine
{
    if (!self.lineHiden)//该方法会被多次调用，加一个标示让它只调用一次
    {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.frame.size.height < 1)
            {
                obj.backgroundColor = [UIColor clearColor];
            }
        }];
    }
    self.lineHiden = YES;
}

- (BOOL)lineHiden
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setLineHiden:(BOOL)lineHiden
{
    objc_setAssociatedObject(self, @selector(lineHiden), @(lineHiden), OBJC_ASSOCIATION_ASSIGN);
}

@end
