//
//  BaseCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        {
            for (UIView *view in self.subviews) {
                if([view isKindOfClass:[UIScrollView class]]) {
                    ((UIScrollView *)view).delaysContentTouches = NO; // Remove touch delay for iOS 7
                    break;
                }
            }
            self.backgroundView.backgroundColor = [UIColor clearColor];
            self.contentView.backgroundColor = [UIColor clearColor];
            self.backgroundColor = [UIColor clearColor];
            [self setupViews];
        }
    }
    
    return self;
}

-(void)setupViews{};

-(void)bindViewModel:(id)viewModel{};


@end
