//
//  LCHomeViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/12.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCHomeViewController.h"
#import "LCHomeViewModel.h"
#import "LCTextFiled.h"

#import "LCSmallCollectionViewCell.h"
#import "LCBigImageAndTextCollectionViewCell.h"
#import "LCNomalCollectionViewCell.h"
#import "LCTeachersCollectionViewCell.h"


#import "LCCollectionReusableHeaderView.h"
#import "LCCollectionReusableBannerHeaderView.h"

#import "LCHomeCollectionCellModel.h"
#import "LCHomeCollectionSectionModel.h"

//#import "UINavigationItem+CustomItem.h"
#import "LCZaiXianZiXunViewModel.h"//资讯

#import "LCMyMessageViewModel.h"
#import "KDFileManager.h"

@interface LCHomeViewController ()
<
UITextFieldDelegate,
UICollectionViewDelegateFlowLayout
>
@property(nonatomic,strong) LCHomeViewModel *viewModel;
@property(nonatomic,strong) LCTextFiled *tf;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
//@property(nonatomic,strong) UIView *launchView;
@end

static NSString *identifierSmall = @"LCSmallCollectionViewCell";
static NSString *identifierBigImageAndText = @"LCBigImageAndTextCollectionViewCell";
static NSString *identifierNomal = @"LCNomalCollectionViewCell";
static NSString *identifierteacher = @"LCTeachersCollectionViewCell";


static NSString *identifierSectionHeader = @"LCCollectionReusableHeaderView";
static NSString *identifierBannerHeader = @"LCCollectionReusableBannerHeaderView";
@implementation LCHomeViewController
@dynamic viewModel,collectionView;
- (void)viewDidLoad {
    
    UIImage *logeImage = [UIImage imageNamed:@"logo"];
    UIImageView *logeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 112, 32)];
    logeImageView.image = logeImage;
    [self.navigationController.navigationBar addSubview:logeImageView];
    
//    _tf = [[LCTextFiled alloc]initWithFrame:SEARCHTEXTFIELD_FREAM];
//    _tf.delegate = self;
//    _tf.layer.cornerRadius = 15;
//    _tf.backgroundColor = [KDColor getC0Color];
//    
//    _tf.leftView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"fangdajing"]imageByTintColor:[KDColor getC3Color]]];
//    _tf.leftViewMode = UITextFieldViewModeAlways;
//    _tf.text = @"搜索想要的内容";
//    _tf.textColor = [KDColor getC3Color];
//    _tf.font = [[KDFont sharedKDFont] getF28Font];
//    [self.navigationController.navigationBar addSubview:_tf];
    
    
    
    UIImage *zixunImage= [UIImage imageNamed:@"zixunkefu"];
    
    UIButton *searchBT = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-88, 0, 44, 44)];
    
    [searchBT setImage:[UIImage imageNamed:@"shouyefangdajing"] forState:0];
    [self.navigationController.navigationBar addSubview:searchBT];
    @weakify(self);
    [searchBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.searchClick ? : self.viewModel.searchClick();
    }];

    UIButton *zixunBT = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-44, 0, 44, 44)];
    [zixunBT setImage:zixunImage forState:0];
    [self.navigationController.navigationBar addSubview:zixunBT];
    [zixunBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        LCZaiXianZiXunViewModel *zixunVM = [[LCZaiXianZiXunViewModel alloc]initWithServices:self.viewModel.navigationStackService params:@{KEY_TITLE:@"在线咨询"}];
        [self.viewModel.navigationStackService pushViewModel:zixunVM animated:YES];
    }];

    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-(64+49)) collectionViewLayout:_flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    
    
    [self.collectionView registerClass:[LCSmallCollectionViewCell class] forCellWithReuseIdentifier:identifierSmall];
    
    [self.collectionView registerClass:[LCBigImageAndTextCollectionViewCell class] forCellWithReuseIdentifier:identifierBigImageAndText];

    
    [self.collectionView registerClass:[LCNomalCollectionViewCell class] forCellWithReuseIdentifier:identifierNomal];
    
    [self.collectionView registerClass:[LCTeachersCollectionViewCell class] forCellWithReuseIdentifier:identifierteacher];
    
    
    [self.collectionView registerClass:[LCCollectionReusableHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierSectionHeader];
    
    [self.collectionView registerClass:[LCCollectionReusableBannerHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierBannerHeader];
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    !self.viewModel.searchClick ? : self.viewModel.searchClick();
//    return NO;
//}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.viewModel.dataSource.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    LCHomeCollectionSectionModel *model = self.viewModel.dataSource[section];
    return model.data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LCHomeCollectionSectionModel *sectionModel = self.viewModel.dataSource[indexPath.section];
    
    if (indexPath.section == 0) {
        LCSmallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierSmall forIndexPath:indexPath];
        [cell bindViewModel:sectionModel.data[indexPath.row] AndIndexPath:indexPath andDateCount:sectionModel.data.count];
        return cell;
    }else if (indexPath.section == 1 & indexPath.row == 0){
        LCBigImageAndTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierBigImageAndText forIndexPath:indexPath];
        [cell bindViewModel:sectionModel.data[indexPath.row]];
        return cell;
        
    }else if (indexPath.section == 1 & indexPath.row != 0){
        LCNomalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierNomal forIndexPath:indexPath];
        [cell bindViewModel:sectionModel.data[indexPath.row]];
        return cell;
    }else if (indexPath.section == 2){
        LCTeachersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierteacher forIndexPath:indexPath];
        [cell bindViewModel:sectionModel.data[indexPath.row]];
        return cell;
    }else{
        
        return nil;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    LCHomeCollectionSectionModel *sectionModel =  self.viewModel.dataSource[indexPath.section];
    if (indexPath.section == 0) {
        LCCollectionReusableBannerHeaderView *bannerHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierBannerHeader forIndexPath:indexPath];
        [bannerHeaderView bindViewModel:sectionModel andBannerViewModel:self.viewModel.homeBannerDataArr andsignUpViewModel:self.viewModel.homesignUpListDataArr andIndexPath:indexPath];
        return bannerHeaderView;
    }
    LCCollectionReusableHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierSectionHeader forIndexPath:indexPath];
    [headerView bindViewModel:sectionModel andIndexpath:indexPath];
    return headerView;
}

//这个是头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0 ) {
        return CGSizeMake(SCREEN_WIDTH, BANANER_H);
    }
    return CGSizeMake(SCREEN_WIDTH, SECTION_H);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH/3,90);//SCREEN_WIDTH/3.5
    }else if (indexPath.section == 1 & indexPath.row == 0){
         return CGSizeMake(BIGIMAGEADDTEXT_W, BIGIMAGEADDTEXT_H);
        
    }else if (indexPath.section == 1 & indexPath.row != 0){
        return CGSizeMake(NORMALE_COLLECTIONCELL_W, NORMALE_COLLECTIONCELL_H);
    }else if (indexPath.section == 2){
        //SCREEN_WIDTH/750*(622-88)
        //SCREEN_WIDTH/750*413)
        return CGSizeMake(SCREEN_WIDTH, 200);
    }else{
        return CGSizeZero;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //{top, left, bottom, right}
    if (section == 0) {
        return  UIEdgeInsetsMake(0, 0, 0, 0);
    }else if (section == 1){
        return  UIEdgeInsetsMake(25, 15, 0, 15);
    }else if (section == 2){
        return  UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        return UIEdgeInsetsZero;
    }

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return (0);
    }else if (section == 1){
        return 10;
    }else if (section == 2){
        return 0;
    }else{
        return 0;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dailifangfa:(NSString *)canshu index:(NSIndexPath *)index{

//    self.viewModel.block(canshu ,index);
    
}
@end
