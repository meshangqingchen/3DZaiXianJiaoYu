//
//  UIView+KDAdd.m
//  PetAnimals
//
//  Created by bigdata on 16/8/8.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "UIView+KDAdd.h"

@implementation UIView (KDAdd)

- (__kindof UIViewController *)getViewController
{
    UIResponder *nextResponder =  self;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}

@end
