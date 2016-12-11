//
//  UIView+HUD.m
//  live
//
//  Created by kingdream on 16/5/9.
//  Copyright © 2016年 bigdata. All rights reserved.
//

#import "UIView+HUD.h"
#import <MBProgressHUD.h>

#define kShowWarningDelayDuration 1
#define kTimeoutDuration 30

@implementation UIView (HUD)

- (void)showWarning:(NSString *)words {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = words;
//        hud.label.textColor = 
        [hud hideAnimated:YES afterDelay:kShowWarningDelayDuration];
    });
}

- (void)showWarning:(NSString *)words andDelay:(unsigned int)delay andCompletion:(void(^)())completon{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.completionBlock = ^{
            !completon ?: completon();
        };
        [hud hideAnimated:YES afterDelay:delay];
    });
}

- (void)showLoading:(NSString *)words
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = words;
    });
}
- (void)showBusyHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
        [[MBProgressHUD showHUDAddedTo:self animated:YES] hideAnimated:YES afterDelay:kTimeoutDuration];
    });
}
- (void)hideBusyHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self animated:YES];
    });
}
@end
