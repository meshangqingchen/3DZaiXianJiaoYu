//
//  UIView+Animation.h
//  PetAnimals
//
//  Created by bigdata on 16/8/3.
//  Copyright © 2016年 petle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

/// 抖动
- (void)shakeView;

+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve;

@end
