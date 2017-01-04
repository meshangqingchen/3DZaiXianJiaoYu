//
//  KDRouter.m
//  PetAnimals
//
//  Created by bigdata on 16/8/9.
//  Copyright © 2016年 petle. All rights reserved.
//

#import "KDRouter.h"

@interface KDRouter ()
@property (nonatomic, strong, readwrite) NSSet *rootViewControllers;
@property (nonatomic, copy) NSDictionary *viewModelViewMappings; // viewModel到vc的映射—

@end

@implementation KDRouter

SYNTHESIZE_SINGLETON_FOR_CLASS(KDRouter)

- (BaseViewController *)viewControllerForViewModel:(BaseViewModel *)viewModel
{
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
   
    if ([NSClassFromString(viewController) isSubclassOfClass:[BaseViewController class]]) {
        MYLog(@"====%@",viewController);
    }
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[BaseViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
	if(_viewModelViewMappings == nil) {
        _viewModelViewMappings = @{
                                   @"LCRootViewModel" : @"LCRootViewController",
                                   @"LCVideoDetailViewModel" : @"LCVideoDetailViewController",
                                   @"LCEvaluateDetailViewModel" : @"LCEvaluateDetailViewController",
                                   @"LCCourseDownLoadViewModel" : @"LCCourseDownLoadViewController",
                                   @"LCMyMessageViewModel" : @"LCMyMessageViewController",
                                   @"LCUserTeacherTalkViewModel" : @"LCUserTeacherTalkViewController"};
    }
	return _viewModelViewMappings;
}



- (NSSet *)rootViewControllers {
	if(_rootViewControllers == nil) {
       _rootViewControllers = [NSSet setWithObjects:@"LCHomeViewController",
                                                    @"LCMyCourseViewController",
                                                    @"LCNewsViewController",
                                                    @"LCPersonalCenterViewController", nil];
        }
	return _rootViewControllers;
}

@end
