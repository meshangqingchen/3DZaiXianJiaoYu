//
//  KDFont.m
//  PetAnimals
//
//  Created by bigdata on 16/8/9.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "KDFont.h"

@implementation KDFont

SYNTHESIZE_SINGLETON_FOR_CLASS(KDFont)

- (instancetype)init
{
    self = [super init];
    if (self) {
        //        if ([xxx currentLanguageIsChinese]) {
        //            self.deviation=-2;
        //        }
        self.deviation = 0;
        self.font = [UIFont systemFontOfSize:10.0];
    }
    return self;
}

- (UIFont *)getF10Font {
    return [self.font fontWithSize:5 + self.deviation];
}
- (UIFont *)getF12Font {
    return [self.font fontWithSize:6 + self.deviation];
}
- (UIFont *)getF14Font {
    return [self.font fontWithSize:7 + self.deviation];
}
- (UIFont *)getF16Font {
    return [self.font fontWithSize:8 + self.deviation];
}
- (UIFont *)getF18Font {
    return [self.font fontWithSize:9 + self.deviation];
}
- (UIFont *)getF20Font {
    return [self.font fontWithSize:10 + self.deviation];
}
- (UIFont *)getF22Font {
    return [self.font fontWithSize:11 + self.deviation];
}
- (UIFont *)getF24Font {
    return [self.font fontWithSize:12 + self.deviation];
}
- (UIFont *)getF26Font {
    return [self.font fontWithSize:13 + self.deviation];
}
- (UIFont *)getF28Font {
    return [self.font fontWithSize:14 + self.deviation];
}
- (UIFont *)getF30Font {
    return [self.font fontWithSize:15 + self.deviation];
}
- (UIFont *)getF32Font {
    return [self.font fontWithSize:16 + self.deviation];
}
- (UIFont *)getF34Font {
    return [self.font fontWithSize:17 + self.deviation];
}
- (UIFont *)getF36Font {
    return [self.font fontWithSize:18 + self.deviation];
}
- (UIFont *)getF38Font {
    return [self.font fontWithSize:19 + self.deviation];
}
- (UIFont *)getF40Font {
    return [self.font fontWithSize:20 + self.deviation];
}
- (UIFont *)getF42Font {
    return [self.font fontWithSize:21 + self.deviation];
}
- (UIFont *)getF44Font {
    return [self.font fontWithSize:22 + self.deviation];
}
- (UIFont *)getF46Font {
    return [self.font fontWithSize:23 + self.deviation];
}
- (UIFont *)getF48Font {
    return [self.font fontWithSize:24 + self.deviation];
}
- (UIFont *)getF50Font {
    return [self.font fontWithSize:25 + self.deviation];
}
- (UIFont *)getF58Font {
    return [self.font fontWithSize:29 + self.deviation];
}
- (UIFont *)getF72Font {
    return [self.font fontWithSize:36 + self.deviation];
}
@end
