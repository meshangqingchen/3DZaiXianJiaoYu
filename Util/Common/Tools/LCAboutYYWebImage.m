//
//  LCAboutYYWebImage.m
//  无限教育
//
//  Created by 3D on 16/11/16.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCAboutYYWebImage.h"

@implementation LCAboutYYWebImage

+ (YYWebImageManager *)avatarImageManager {
    static YYWebImageManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *path = [[UIApplication sharedApplication].cachesPath stringByAppendingPathComponent:@"teacher.avatar"];
        YYImageCache *cache = [[YYImageCache alloc] initWithPath:path];
        
        manager = [[YYWebImageManager alloc] initWithCache:cache queue:[YYWebImageManager sharedManager].queue];
        manager.sharedTransformBlock = ^(UIImage *image, NSURL *url) {
            if (!image) return image;
            UIImage *newImg = image;
            if (image.size.width != image.size.height) {
                CGFloat min = MIN(image.size.width, image.size.height);
                newImg = [image imageByResizeToSize:CGSizeMake(min, min) contentMode:UIViewContentModeCenter];
            }
            
            UIImage *img = [newImg imageByRoundCornerRadius:newImg.size.width/2];
            return img; // a large value
        };
    });
    return manager;
}

+ (YYWebImageManager *)avatarImageManager1 {
    static YYWebImageManager *manager;
    static dispatch_once_t onceToken;
 
    dispatch_once(&onceToken, ^{
        NSString *path = [[UIApplication sharedApplication].cachesPath stringByAppendingPathComponent:@"my.avatar1"];
        YYImageCache *cache = [[YYImageCache alloc] initWithPath:path];
        
        manager = [[YYWebImageManager alloc] initWithCache:cache queue:[YYWebImageManager sharedManager].queue];
        manager.sharedTransformBlock = ^(UIImage *image, NSURL *url) {
            if (!image) return image;
            UIImage *newImg = image;
            if (image.size.width != image.size.height) {
                CGFloat min = MIN(image.size.width, image.size.height);
                newImg = [image imageByResizeToSize:CGSizeMake(min, min) contentMode:UIViewContentModeCenter];
            }
            UIImage *imgg = [newImg imageByRoundCornerRadius:newImg.size.width/2 borderWidth:10 borderColor:[KDColor getX1Color]];
            return imgg; // a large value
        };
    });
    return manager;
}

+ (YYWebImageManager *)avatarImageManager2 {
    static YYWebImageManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *path = [[UIApplication sharedApplication].cachesPath stringByAppendingPathComponent:@"teacher.avatar1"];
        YYImageCache *cache = [[YYImageCache alloc] initWithPath:path];
        
        manager = [[YYWebImageManager alloc] initWithCache:cache queue:[YYWebImageManager sharedManager].queue];
        manager.sharedTransformBlock = ^(UIImage *image, NSURL *url) {
            if (!image) return image;
            UIImage *newImg = image;
            if (image.size.width != image.size.height) {
                CGFloat min = MIN(image.size.width, image.size.height);
                newImg = [image imageByResizeToSize:CGSizeMake(min, min) contentMode:UIViewContentModeScaleAspectFill];
            }
            
            UIImage *imgg = [newImg imageByRoundCornerRadius:newImg.size.width/2 borderWidth:newImg.size.width/50 borderColor:[KDColor getX1Color]];
            return imgg; // a large value
        };
    });
    return manager;
}
@end
