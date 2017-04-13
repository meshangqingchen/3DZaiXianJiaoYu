//
//  LCHomeViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.

#import "LCHomeViewModel.h"
#import "LCHomeSmallCollectionCellModel.h"
#import "LCHomeCollectionCellModel.h"
#import "LCTeacherCollectionCellViewModel.h"

#import "LCHomeCollectionSectionModel.h" //区VM
#import "LCHomeModel.h"
#import "LCHomeCollectionBananaViewModel.h" //bannerVM
#import "LCVideoDetailViewModel.h"          //课程的detail
#import "LCCourseCollectionViewModel.h"     //根据课程分类进课程 list
#import "LCWebImageViewModel.h"             //大图
#import "LCPiexunClassViewModel.h"          //报名的课程list
#import "LCMoreTeacherViewModel.h"          //更多老师
#import "LCSearchViewModel.h"
#import "LCTeacherDetailViewModel.h"   //老师详情
#import "JCAlertView.h"
#import "LCNewUserAlertView.h"         //新人优惠
#import "LCActivityAlertView.h"        //活动
#import "KDFileManager.h"
#import "LCVoucherViewModel.h"         //我的卡券
#import "LCMyVoucherViewController.h"
#import "UIViewController+Example.h"

@interface LCHomeViewModel ()
@property(nonatomic,strong) UIView *launchView;
@property(nonatomic,strong) JCAlertView *nnewUserAlertView;
@property(nonatomic,strong) JCAlertView *activityAlertView;
@end

@implementation LCHomeViewModel
-(void)initialize{
    [super initialize];
    
    @weakify(self)
    [self setClickBanner:^(NSString *className, NSURL *webURL,NSString *title) {
        @strongify(self)
        LCWebImageViewModel *webImageVM = [[LCWebImageViewModel alloc]initWithServices:self.navigationStackService params:@{@"className":className,@"webURL":webURL,KEY_TITLE:title}];
        [self.navigationStackService pushViewModel:webImageVM animated:YES];
    }];
    
    //三个按钮push到下级界面
    [self setClickBT:^(NSString *className, NSURL *webURL, NSString *title) {
        @strongify(self)
        NSLog(@"%@",className);
        NSLog(@"%@",title);

        LCHomeCollectionBananaViewModel *model = self.homesignUpListDataArr.firstObject;
                                       //LCHomeSignuplist
        if ([className isEqualToString:model.className]&&[title isEqualToString:model.name]) {
            LCPiexunClassViewModel *viewModel = [[LCPiexunClassViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:title}];
            [self.navigationStackService pushViewModel:viewModel animated:YES];
            
        }else{
            LCWebImageViewModel *webImageVM = [[LCWebImageViewModel alloc]initWithServices:self.navigationStackService params:@{@"className":className,@"webURL":webURL,KEY_TITLE:title}];
            [self.navigationStackService pushViewModel:webImageVM animated:YES];
        }
    }];
    
    [self setMoreClick:^(NSIndexPath *indexPath) {
        @strongify(self)
        if (indexPath.section == 0) {
            
        }else if (indexPath.section == 1){
            LCCourseCollectionViewModel *courseCollectionVM = [[LCCourseCollectionViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"更多精品"}];
            [self.navigationStackService pushViewModel:courseCollectionVM animated:YES];
        }else if (indexPath.section == 2){
            LCMoreTeacherViewModel *moreTeacherVM = [[LCMoreTeacherViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"讲师列表"}];
            [self.navigationStackService pushViewModel:moreTeacherVM animated:YES];
        }
    }];
    
    [self setSearchClick:^{
        @strongify(self)
        LCSearchViewModel *searchVM = [[LCSearchViewModel alloc]initWithServices:self.navigationStackService params:nil];
        [self.navigationStackService pushViewModel:searchVM animated:YES];
    }];
    
    [self setPushToTeacherDetailViewModel:^(NSString * teacherID) {
        @strongify(self)
        LCTeacherDetailViewModel *teacherDeatilVM = [[LCTeacherDetailViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"讲师详情"}];
        teacherDeatilVM.teacherID = teacherID;
        teacherDeatilVM.frome = hiddenFromTYP;
        [self.navigationStackService pushViewModel:teacherDeatilVM animated:YES];
    }];
    __block int a = 0;
    [self setPushMyVoucherVC:^(JCAlertView *AlertView){
        @strongify(self)
        if (a == 0) {
            LCVoucherViewModel *voucherViewModel = [[LCVoucherViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"我的卡券"}];
            [self.navigationStackService pushViewModel:voucherViewModel animated:YES];
            a++;
        }
        [AlertView dismissWithCompletion:nil];
    }];
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UICollectionView *)collectionView{
    
    LCHomeCollectionSectionModel *sectionModel = self.dataSource[indexpath.section];
    if (indexpath.section == 0) {
        LCHomeSmallCollectionCellModel *cellVM = sectionModel.data[indexpath.row];
        LCCourseCollectionViewModel *courseCollectionVM = [[LCCourseCollectionViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:cellVM.title}];
        courseCollectionVM.typeId = cellVM.iid;
        [self.navigationStackService pushViewModel:courseCollectionVM animated:YES];
    }else if (indexpath.section == 1){
        LCHomeCollectionCellModel *cellViewModel = sectionModel.data[indexpath.row];
        
        LCVideoDetailViewModel *videoDetailVM = [[LCVideoDetailViewModel alloc]initWithServices:self.navigationStackService params:nil];
        videoDetailVM.planID = cellViewModel.idd;
        videoDetailVM.imageUrl = cellViewModel.smallImgURL;
        videoDetailVM.titleti = cellViewModel.title;
        [self.navigationStackService pushViewModel:videoDetailVM animated:YES];
    }else if (indexpath.section == 2){
    
    }
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void(^)(id responseObj))complete{
    
    
    [self.netApi_Manager isOnlineCardCompleteHandle:^(id responseObj, NSError *error) {
        NSDictionary *contents = responseObj[@"contents"];
        NSNumber *online = contents[@"onlineing"];
        NSLog(@"%@",online);
        ApponlineIng = [online boolValue]; //yes 正在上线
        //这个是判断是否正在上线还是是否正在上线 的版本..
    }];
    
    
    MYLog(@" = = = %@",[KDFileManager getCachePath]);
    MYLog(@" = = = %@",[KDFileManager getCachePath]);
    [self starLaunch];
    [self creatNewUserView];
    [self creatActivityView];
    
    [self.netApi_Manager homeJsonCompleteHandle:^(id responseObj, NSError *error) {
        LCHomeModel *homeModel = [LCHomeModel parseJSON:responseObj];
        NSMutableArray *bannerMutableArr = [NSMutableArray array];
        for (int i = 0; i<homeModel.contents.carouselList.count; i++) {
            //这个是 是头部的的viewModel
            LCHomeCollectionBananaViewModel *bannerVM = [[LCHomeCollectionBananaViewModel alloc]initWithModel:homeModel.contents.carouselList[i]];
            bannerVM.clickBanner = self.clickBanner;
            [bannerMutableArr addObject:bannerVM];
        }
        self.homeBannerDataArr = bannerMutableArr.copy;
        NSMutableArray *signUpListMutableArr = [NSMutableArray array];
        for (int i = 0; i<homeModel.contents.signUpList.count; i++) {
            //signUpList 和 carouselList 的model 一样 所以就创建 signUpList的ViewModel了
            LCHomeCollectionBananaViewModel *ignUpVM = [[LCHomeCollectionBananaViewModel alloc]initWithModel:homeModel.contents.signUpList[i]];
            
            ignUpVM.clickBT = self.clickBT;
            [signUpListMutableArr addObject:ignUpVM];
        }
        self.homesignUpListDataArr = signUpListMutableArr.copy;
        NSMutableArray *sectionDataArr0 = [NSMutableArray array];
        for (int i = 0; i<homeModel.contents.classTypeList.count; i++) {
            LCHomeSmallCollectionCellModel *semallCellVM = [[LCHomeSmallCollectionCellModel alloc]initWithModel:homeModel.contents.classTypeList[i]];
            [sectionDataArr0 addObject:semallCellVM];
        }
        LCHomeCollectionSectionModel *sectionVM0 = [LCHomeCollectionSectionModel new];
        sectionVM0.sectionTitle = @"课程设置";
        sectionVM0.data = sectionDataArr0.copy;
        sectionVM0.moreClick = self.moreClick;
        
        NSMutableArray *sectionDataArr1 = [NSMutableArray array];
        for (int i = 0; i<homeModel.contents.recommendClassTypeList.count; i++) {
            LCHomeCollectionCellModel *CellVM = [[LCHomeCollectionCellModel alloc]initWithModel:homeModel.contents.recommendClassTypeList[i]];
            [sectionDataArr1 addObject:CellVM];
        }
        LCHomeCollectionSectionModel *sectionVM1 = [LCHomeCollectionSectionModel new];
        sectionVM1.sectionTitle = @"精品课程";
        sectionVM1.data = sectionDataArr1.copy;
        sectionVM1.moreClick = self.moreClick;
        
        
        NSMutableArray *sectionDataArr2 = [NSMutableArray array];
        for (int i = 0; i<homeModel.contents.teacherList.count; i++) {
            LCTeacherCollectionCellViewModel *teacherCellVM = [[LCTeacherCollectionCellViewModel alloc]initWithModel:homeModel.contents.teacherList[i]];
//            @property(nonatomic,copy) void (^pushToTeacherDetailViewModel)(NSString *teacherID); //跳转到teacher的详情
            teacherCellVM.pushToTeacherDetailViewModel = self.pushToTeacherDetailViewModel;
            [sectionDataArr2 addObject:teacherCellVM];
        }
        NSArray *teacherArr = @[sectionDataArr2.copy];
        LCHomeCollectionSectionModel *sectionVM2 = [LCHomeCollectionSectionModel new];
        sectionVM2.sectionTitle = @"名师导航";
        sectionVM2.data = teacherArr;
        sectionVM2.moreClick = self.moreClick;
        
        
        [self.mutableDataArr addObjectsFromArray:@[sectionVM0,sectionVM1,sectionVM2]];
        self.dataSource = self.mutableDataArr.copy;
        //弹出来
        if ([KDFileManager readUserDataForKey:LCACTIVEMSG]) {
            [self.nnewUserAlertView show];
            [KDFileManager removeUserDataForkey:LCACTIVEMSG];
        }
        
        if ([KDFileManager readUserDataForKey:LCNEWUSERMSG]) {
            [self.activityAlertView show];
            [KDFileManager removeUserDataForkey:LCNEWUSERMSG];
        }
    }];
}


-(void)starLaunch{
    [kSharedAppDelegate.window addSubview:self.launchView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animationLaunchView];
    });
}

- (UIView *)launchView {
    if(_launchView == nil) {
        _launchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _launchView.backgroundColor = [UIColor whiteColor];
        UIImageView *bottomImage = [UIImageView new];
        bottomImage.image = [UIImage imageNamed:@"qidong"];
        [_launchView addSubview:bottomImage];
        [bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_offset(0);
            make.bottom.mas_offset(-40);
            make.size.mas_equalTo(CGSizeMake(193, 50));
        }];
        
        if ([[UIImage alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",[KDFileManager getCachePath],@"LCimage"]]) {
            UIImage *topLaunchImage = [[UIImage alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",[KDFileManager getCachePath],@"LCimage"]];
            UIImageView *topimageView = [UIImageView new];
            topimageView.image = topLaunchImage;
            [_launchView addSubview:topimageView];
            [topimageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.mas_offset(0);
                make.height.mas_equalTo(SCREEN_WIDTH*97/75);
            }];
        }
    }
    return _launchView;
}

-(void)animationLaunchView{
    [UIView animateWithDuration:0.5 animations:^{
        self.launchView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.launchView removeFromSuperview];
    }];;
}

-(void)creatNewUserView{
    LCNewUserAlertView *newUserView= [[LCNewUserAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/750*526)];
    newUserView.pushMyVoucherVC = self.pushMyVoucherVC;
    newUserView.jcalertView = self.nnewUserAlertView;
    
    JCAlertView *nnewUserAlertView = [[JCAlertView alloc]initWithCustomView:newUserView dismissWhenTouchedBackground:YES];
    newUserView.jcalertView = nnewUserAlertView;
    self.nnewUserAlertView = nnewUserAlertView;
    if ([KDFileManager readUserDataForKey:LCACTIVEMSG]) {
        newUserView.msgLB.text = [KDFileManager readUserDataForKey:LCACTIVEMSG];
    }
}

-(void)creatActivityView{
    
    LCActivityAlertView *activityView = [[LCActivityAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/750*407)];
    activityView.pushMyVoucherVC = self.pushMyVoucherVC;
    JCAlertView *activityAlertView = [[JCAlertView alloc]initWithCustomView:activityView dismissWhenTouchedBackground:YES];
    activityView.jcalertView = activityAlertView;
    self.activityAlertView = activityAlertView;
    
    if ([KDFileManager readUserDataForKey:LCNEWUSERMSG]) {
        activityView.msgLB.text = [KDFileManager readUserDataForKey:LCACTIVEMSG];
    }
}
@end
