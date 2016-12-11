//
//  UIView+HUD.h
//  live
//
//  Created by kingdream on 16/5/9.
//  Copyright © 2016年 bigdata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)

/** 显示文字提示 */
- (void)showWarning:(NSString *)words;
/** 显示文字提示 completon */
- (void)showWarning:(NSString *)words andDelay:(unsigned int)delay andCompletion:(void(^)())completon;
/** 显示忙提示 */
- (void)showBusyHUD;
/** 显示忙文字提示 */
- (void)showLoading:(NSString *)words;
/** 隐藏忙提示 */
- (void)hideBusyHUD;

@end
