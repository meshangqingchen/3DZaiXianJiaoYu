//
//  ADKaiPing.h
//  百度广告例子
//
//  Created by 马宝丽 on 16/4/18.
//  Copyright © 2016年 haishusichuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBLHeaderImageView : UIImageView

@property(nonatomic,copy)NSString * aid;

- (void)addTarget:(id)target withSelector:(SEL)selector;

@end
