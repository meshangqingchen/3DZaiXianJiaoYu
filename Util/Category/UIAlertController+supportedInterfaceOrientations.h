//
//  UIAlertController+supportedInterfaceOrientations.h
//  PetAnimals
//
//  Created by bigdata on 16/8/19.
//  Copyright © 2016年 petle. All rights reserved.

// 解决 UIAlertController 错误
// reason: 'UIAlertController:supportedInterfaceOrientations was invoked recursively!'

#import <UIKit/UIKit.h>

@interface UIAlertController (supportedInterfaceOrientations)

@end
