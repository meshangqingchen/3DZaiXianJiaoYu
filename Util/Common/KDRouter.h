//
//  KDRouter.h
//  PetAnimals
//
//  Created by bigdata on 16/8/9.
//  Copyright © 2016年 petle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"
#import "SynthesizeSingleton.h"

@interface KDRouter : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(KDRouter)

/// tabBar的itemVC
@property (nonatomic, strong, readonly) NSSet *rootViewControllers;

/// Retrieves the view corresponding to the given view model.
///
/// viewModel - The view model
///
/// Returns the view corresponding to the given view model.
- (BaseViewController *)viewControllerForViewModel:(BaseViewModel *)viewModel;



@end
