//
//  KDColor.m
//  PetAnimals
//
//  Created by bigdata on 16/8/9.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "KDColor.h"

#define kUIColorRGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation KDColor

+ (UIColor *)getX0Color
{
    return kUIColorRGB16(0x999999);
}

+ (UIColor *)getX1Color
{
    return kUIColorRGB16(0x23dee5);
}

+ (UIColor *)getC0Color {
    return kUIColorRGB16(0xffffff);
}

+ (UIColor *)getC1Color {
    return kUIColorRGB16(0xf98a88);
}

+ (UIColor *)getC2Color {
    return kUIColorRGB16(0x333333);
}

+ (UIColor *)getC3Color {
    return kUIColorRGB16(0x666666);
}

+ (UIColor *)getC4Color {
    return kUIColorRGB16(0xf1f1f1);
}

+ (UIColor *)getC5Color {
    return kUIColorRGB16(0x989898);
}

+ (UIColor *)getC6Color {
    return kUIColorRGB16(0xefb918);
}

+ (UIColor *)getC7Color {
    return kUIColorRGB16(0xe57a23);
}

+ (UIColor *)getC8Color {
    return kUIColorRGB16(0xcccccc);
}

+ (UIColor *)getC9Color {
    return kUIColorRGB16(0xf4a752);
}

+ (UIColor *)getC10Color {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
}

+ (UIColor *)getC11Color {
    return kUIColorRGB16(0xeeeeee);
}

+ (UIColor *)getC12Color {
    return kUIColorRGB16(0xc8c8c8);
}

+ (UIColor *)getC13Color {
    return kUIColorRGB16(0xe2e2e2);
}
+ (UIColor *)getC14Color {
    return kUIColorRGB16(0xf7f7f7);
}
+ (UIColor *)getC15Color {
    return kUIColorRGB16(0xd2d2d2);
}
+ (UIColor *)getC16Color {
    return kUIColorRGB16(0xfbfbf5);
}
+ (UIColor *)getC17Color {
    return kUIColorRGB16(0xfcd757);
}
+ (UIColor *)getC18Color {
    return kUIColorRGB16(0xfda228);
}
+ (UIColor *)getC19Color {
    return kUIColorRGB16(0xc9c9c9);
}
+ (UIColor *)getC20Color {
    return kUIColorRGB16(0xCACACA);
}
+ (UIColor *)getC21Color {
    return kUIColorRGB16(0xE6E6E6);
}
+ (UIColor *)getC22Color {
    return kUIColorRGB16(0xa3a3a3);
}
+ (UIColor *)getC23Color {
    return kUIColorRGB16(0xa3a3a3);
}
+ (UIColor *)getC24Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC25Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC26Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC27Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC28Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC29Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC30Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC31Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC32Color {
    return kUIColorRGB16(0xa3a3a3);
}

+ (UIColor *)getC33Color {
    return kUIColorRGB16(0xa3a3a3);
}
@end
