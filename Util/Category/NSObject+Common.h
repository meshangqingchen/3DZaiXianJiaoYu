//
//  NSObject+Common.h
//  PetAnimals
//
//  Created by bigdata on 2016/9/26.
//  Copyright © 2016年 petle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

#pragma mark Tip M

+ (void)showWarning:(NSString *)words;
+ (void)showHudTipStr:(NSString *)tipStr;
+ (void)showStatusBarQueryStr:(NSString *)tipStr;
+ (void)showStatusBarSuccessStr:(NSString *)tipStr;
+ (void)showStatusBarErrorStr:(NSString *)errorStr;

//显示忙
- (void)showProgress;

//隐藏提示
- (void)hideProgress;
@end
