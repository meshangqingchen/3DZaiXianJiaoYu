//
//  LCTextFiled.m
//  无限三维在线
//
//  Created by 3D on 16/3/25.
//  Copyright © 2016年 无限三维(北京)电子商务有限公司. All rights reserved.
//

#import "LCTextFiled.h"

@implementation LCTextFiled



//控制清除按钮的位置
-(CGRect)clearButtonRectForBounds:(CGRect)bounds
{
return CGRectMake(bounds.origin.x + bounds.size.width - 50, bounds.origin.y + bounds.size.height -20, 16, 16);
}

//控制placeHolder的位置，左右缩20
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    UIImage *image = [UIImage imageNamed:@"fangdajing"];
    CGRect inset = CGRectMake(bounds.origin.x +15+5+image.size.width, bounds.origin.y, bounds.size.width , bounds.size.height);//更好理解些
    
    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    UIImage *image = [UIImage imageNamed:@"fangdajing"];
    CGRect inset = CGRectMake(bounds.origin.x +15+5+image.size.width, bounds.origin.y, bounds.size.width , bounds.size.height);//更好理解些
    return inset;
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    UIImage *image = [UIImage imageNamed:@"fangdajing"];
    CGRect inset = CGRectMake(bounds.origin.x +15+5+image.size.width, bounds.origin.y, bounds.size.width -(15+5+image.size.width) , bounds.size.height);//更好理解些
    return inset;
}
//控制左视图位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    UIImage *image = [UIImage imageNamed:@"fangdajing"];
    CGRect inset = CGRectMake(bounds.origin.x +15, (self.height-image.size.height)/2, image.size.width, image.size.height);
    return inset;
    //return CGRectInset(bounds,50,0);
}

@end
