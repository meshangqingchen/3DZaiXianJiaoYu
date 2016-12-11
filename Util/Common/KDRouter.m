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
                                   @"KDRootViewModel" : @"KDRootViewController",
                                   @"WVideoDetailsViewModel":@"WVideoDetailsViewController",
                                   @"LCClassViewModel":@"LCClassViewController",
                                   @"LCBenKeViewModel":@"LCBenKeViewController",
                                   @"LCShuoShiViewModel":@"LCShuoShiViewController",
                                   @"LC3DCollegeViewModel":@"LC3DCollegeViewController",
                                   @"LCBenKeOptionalViewModel":@"LCBenKeOptionalViewController",
                                   @"LCTeenagerEducationViewModel":@"LCTeenagerEducationViewController",
                                   @"LCApplicationEducationViewModel":@"LCApplicationEducationViewController",
                                   @"LCWonderfulThemeViewModel":@"LCWonderfulThemeViewController",
                                   @"LCVideoParentViewModel":@"LCVideoParentViewController",
                                   @"LCCourseIntroductionViewMode":@"LCCourseIntroductionViewController",
                                   @"LCSyllabusViewModel":@"LCSyllabusViewController",
                                   @"LCLoginViewModel":@"LCLoginViewController",
                                   @"LCForgotPasswordViewModel":@"LCForgotPasswordViewController",
                                   @"LCRegisteredViewModel":@"LCRegisteredViewController",
                                   @"LCMyCollectionViewModel":@"LCMyCollectionViewController",
                                   @"LCCommonSettingViewModel":@"LCCommonSettingViewController",
                                   @"LCFeedbackViewModel":@"LCFeedbackViewController",
                                   @"LCClassListViewModel":@"LCClassListViewController",
                                   @"LCEditdataViewModel":@"LCEditdataViewController",
                                   @"WAboutUsViewModel":@"WAboutUsViewController",
                                   @"LCChangePhoneViewModel":@"LCChangePhoneViewController",
                                   @"LCChangePasswordViewModel":@"LCChangePasswordViewController",
                                   @"LCTeacherTableViewModel":@"LCTeacherTableViewController",
                                   @"LCTeacherViewModel":@"LCTeacherDetailViewController",
                                   @"LCVideoCollectionViewModel":@"LCVideoCollectionViewController",
                                   @"LCBaoMingViewModel":@"LCBaoMingViewController"
                                   };
    }
	return _viewModelViewMappings;
}



- (NSSet *)rootViewControllers {
	if(_rootViewControllers == nil) {
       _rootViewControllers = [NSSet setWithObjects:@"LCClassViewController",
                                                    @"KDMyselfViewController", nil];
        }
	return _rootViewControllers;
}

@end
