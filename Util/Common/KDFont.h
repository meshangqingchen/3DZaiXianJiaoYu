//
//  KDFont.h
//  PetAnimals
//
//  Created by bigdata on 16/8/9.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "SynthesizeSingleton.h"
#import <UIKit/UIKit.h>

@interface KDFont : NSObject

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) int deviation;

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(KDFont)

- (UIFont *)getF10Font;
- (UIFont *)getF12Font;
- (UIFont *)getF14Font;
- (UIFont *)getF16Font;
- (UIFont *)getF18Font;
- (UIFont *)getF20Font;
- (UIFont *)getF22Font;
- (UIFont *)getF24Font;
- (UIFont *)getF26Font;
- (UIFont *)getF28Font;
- (UIFont *)getF30Font;
- (UIFont *)getF32Font;
- (UIFont *)getF34Font;
- (UIFont *)getF36Font;
- (UIFont *)getF38Font;
- (UIFont *)getF40Font;
- (UIFont *)getF42Font;
- (UIFont *)getF44Font;
- (UIFont *)getF46Font;
- (UIFont *)getF48Font;
- (UIFont *)getF50Font;
- (UIFont *)getF58Font;
- (UIFont *)getF72Font;

@end
