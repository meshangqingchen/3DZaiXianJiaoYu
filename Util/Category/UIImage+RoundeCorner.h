//
//  UIImage+RoundeCorner.h
//  生成带圆角的图片
//
//  Created by 3D on 16/7/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundeCorner)
- (UIImage *)imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius;

- (UIImage*)transformWidth:(CGFloat)width
                    height:(CGFloat)height;
@end
