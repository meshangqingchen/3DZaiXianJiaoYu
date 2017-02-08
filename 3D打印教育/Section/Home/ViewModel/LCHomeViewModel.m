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
#import "LCMoreTeacherViewModel.h"          //更多老师
#import "LCSearchViewModel.h"
#import "LCTeacherDetailViewModel.h"   //老师详情

@implementation LCHomeViewModel
-(void)initialize{
    [super initialize];
    
    @weakify(self)
    [self setClickBanner:^(NSString *className, NSURL *webURL,NSString *title) {
        @strongify(self)
        LCWebImageViewModel *webImageVM = [[LCWebImageViewModel alloc]initWithServices:self.navigationStackService params:@{@"className":className,@"webURL":webURL,KEY_TITLE:title}];
        [self.navigationStackService pushViewModel:webImageVM animated:YES];
    }];
    [self setClickBT:^(NSString *className, NSURL *webURL, NSString *title) {
        @strongify(self)
        LCWebImageViewModel *webImageVM = [[LCWebImageViewModel alloc]initWithServices:self.navigationStackService params:@{@"className":className,@"webURL":webURL,KEY_TITLE:title}];
        [self.navigationStackService pushViewModel:webImageVM animated:YES];
    }];
    
    [self setMoreClick:^(NSIndexPath *indexPath) {
        @strongify(self)
        if (indexPath.section == 0) {
            
        }else if (indexPath.section == 1){
            LCCourseCollectionViewModel *courseCollectionVM = [[LCCourseCollectionViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"跟多精品"}];
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
        [self.navigationStackService pushViewModel:teacherDeatilVM animated:YES];
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
    
//    LCHomeModel *homeModel = [LCHomeModel parseJSON:nil];
//    MYLog(@"+++++homeModel = %@",homeModel);
//    MYLog(@"+++++homeModel = %@",homeModel);
//    MYLog(@"+++++homeModel = %@",homeModel);
//    
//    NSMutableArray *sectionDataArr0 = [NSMutableArray array];
//    for (int i = 0; i<6; i++) {
//        LCHomeSmallCollectionCellModel *semallCellVM = [[LCHomeSmallCollectionCellModel alloc]initWithModel:homeModel.contents.classTypeList[i]];
//        semallCellVM.title = [NSString stringWithFormat:@"我是title%d",i];
//        [sectionDataArr0 addObject:semallCellVM];
//    }
//    LCHomeCollectionSectionModel *sectionVM0 = [LCHomeCollectionSectionModel new];
//    sectionVM0.sectionTitle = @"课程设置";
//    sectionVM0.data = sectionDataArr0.copy;
//    
//    
//    NSMutableArray *sectionDataArr1 = [NSMutableArray array];
//    for (int i = 0; i<5; i++) {
//        LCHomeCollectionCellModel *CellVM = [[LCHomeCollectionCellModel alloc]initWithModel:homeModel.contents.recommendClassTypeList[i]];
//        CellVM.title = [NSString stringWithFormat:@"我是title%d",i];
//        [sectionDataArr1 addObject:CellVM];
//    }
//    LCHomeCollectionSectionModel *sectionVM1 = [LCHomeCollectionSectionModel new];
//    sectionVM1.sectionTitle = @"设备工艺";
//    sectionVM1.data = sectionDataArr1.copy;
//    
//    
//    
//    NSMutableArray *sectionDataArr2 = [NSMutableArray array];
//    for (int i = 0; i<3; i++) {
//        LCTeacherCollectionCellViewModel *teacherCellVM = [[LCTeacherCollectionCellViewModel alloc]initWithModel:homeModel.contents.teacherList[i]];
//        teacherCellVM.textViewText = [NSString stringWithFormat:@"我是老师介绍%d",i];
//        [sectionDataArr2 addObject:teacherCellVM];
//    }
//    NSArray *teacherArr = @[sectionDataArr2.copy];
//    LCHomeCollectionSectionModel *sectionVM2 = [LCHomeCollectionSectionModel new];
//    sectionVM2.sectionTitle = @"名师导航";
//    sectionVM2.data = teacherArr;
//    
//    [self.mutableDataArr addObjectsFromArray:@[sectionVM0,sectionVM1,sectionVM2]];
//    self.dataSource = self.mutableDataArr.copy;

    
    
    [self.netApi_Manager homeJsonCompleteHandle:^(id responseObj, NSError *error) {
        LCHomeModel *homeModel = [LCHomeModel parseJSON:responseObj];
        
        NSMutableArray *bannerMutableArr = [NSMutableArray array];
        for (int i = 0; i<homeModel.contents.carouselList.count; i++) {
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
    }];
}
@end
