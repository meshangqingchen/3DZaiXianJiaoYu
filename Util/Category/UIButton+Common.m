//
//  UIButton+Common.m
//  PetAnimals
//
//  Created by bigdata on 16/8/11.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "UIButton+Common.h"
#import "KDFont.h"
@implementation UIButton (Common)

+ (UIButton *)tweetBtnWithFrame:(CGRect)frame alignmentLeft:(BOOL)alignmentLeft{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [[[KDFont alloc]init] getF24Font];
    //    [button setTitleColor:[UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
    if (alignmentLeft) {
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -2.5, 0, 2.5);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -2.5, 0, -2.5);
    }else{
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    }
    return button;
}

- (void)buttonImageChangeRight
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.image.size.width + 2.5, 0, self.imageView.image.size.width + 2.5);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width + 2.5, 0, -self.titleLabel.bounds.size.width - 2.5);
}

@end

