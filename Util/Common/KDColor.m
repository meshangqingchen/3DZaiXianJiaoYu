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
    return kUIColorRGB16(0x15c2c9);//1EB7BD
}

+ (UIColor *)getC2Color {
    return kUIColorRGB16(0x333333);
}

+ (UIColor *)getC3Color {
    return kUIColorRGB16(0x666666);
}

+ (UIColor *)getC4Color {
    return kUIColorRGB16(0xbbc1c3);
}

+ (UIColor *)getC5Color {
    return kUIColorRGB16(0xf5f9fa);
}

+ (UIColor *)getC6Color {
    return kUIColorRGB16(0xdedede);
}

+ (UIColor *)getC7Color {
    return kUIColorRGB16(0xd9d9d9);
}

+ (UIColor *)getC8Color {
    return kUIColorRGB16(0x63a7ca);
}

+ (UIColor *)getC9Color {
    return kUIColorRGB16(0xf2f2f2);
}

+ (UIColor *)getC10Color {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
}

+ (UIColor *)getC11Color {
    return kUIColorRGB16(0xcbe7f5);
}

+ (UIColor *)getC12Color {
    return kUIColorRGB16(0xeeeeee);
}

+ (UIColor *)getC13Color {
    return kUIColorRGB16(0xcbcbcb);
}
+ (UIColor *)getC14Color {
    return kUIColorRGB16(0xdddddd);
}
+ (UIColor *)getC15Color {
    return kUIColorRGB16(0xcccccc);
}
+ (UIColor *)getC16Color {
    return kUIColorRGB16(0xfbfbf5);
}
+ (UIColor *)getC17Color {
    return kUIColorRGB16(0x23dee5);
}
+ (UIColor *)getC18Color {
    return kUIColorRGB16(0x1bb8be);
}
+ (UIColor *)getC19Color {
    return kUIColorRGB16(0xf5f5f5);
}
+ (UIColor *)getC20Color {
    return kUIColorRGB16(0xec2222);
}
+ (UIColor *)getC21Color {
    return kUIColorRGB16(0xf4a752);
}
+ (UIColor *)getC22Color {
    return kUIColorRGB16(0x989898);
}
+ (UIColor *)getC23Color {
    return kUIColorRGB16(0xf15518);
}
+ (UIColor *)getC24Color {
    return kUIColorRGB16(0xfcd757);
}

+ (UIColor *)getC25Color {
    return kUIColorRGB16(0xc8c8c8);
}

+ (UIColor *)getC26Color {
    return kUIColorRGB16(0xF1F6F7);
}

+ (UIColor *)getC27Color {
    return kUIColorRGB16(0xdab95c);
}

+ (UIColor *)getC28Color {
    return kUIColorRGB16(0xebc55c);
}

+ (UIColor *)getC29Color {
    return kUIColorRGB16(0xeebb40);
}

+ (UIColor *)getC30Color {
    return kUIColorRGB16(0xf26b6b);
}

+ (UIColor *)getC31Color {
    return kUIColorRGB16(0xf68b3c);
}

+ (UIColor *)getC32Color {
    return kUIColorRGB16(0x91acd5);
}

+ (UIColor *)getC33Color {
    return kUIColorRGB16(0xa3a3a3);
}
@end
