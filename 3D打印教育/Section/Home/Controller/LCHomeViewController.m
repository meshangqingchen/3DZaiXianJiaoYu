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

#import "UINavigationItem+CustomItem.h"

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
@property(nonatomic,strong) UIView *launchView;
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
    
    
    
    _tf = [[LCTextFiled alloc]initWithFrame:SEARCHTEXTFIELD_FREAM];
    _tf.delegate = self;
    _tf.layer.cornerRadius = 15;
    _tf.backgroundColor = [KDColor getC1Color];
    _tf.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fangdajing"]];
    _tf.leftViewMode = UITextFieldViewModeAlways;
    _tf.text = @"搜索想要的内容";
    _tf.textColor = [KDColor getC0Color];
    _tf.font = [[KDFont sharedKDFont] getF28Font];
    [self.navigationController.navigationBar addSubview:_tf];
    
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
    
    [kSharedAppDelegate.window addSubview:self.launchView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animationLaunchView];
    });

    [super viewDidLoad];
}

-(void)animationLaunchView{
    [UIView animateWithDuration:0.5 animations:^{
        self.launchView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.launchView removeFromSuperview];
    }];;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImage *have_image = [UIImage imageNamed:@"no_message"];
    MYLog(@"%@",@"根据接口来判断 显示那个状态的铃铛");
    CustomBarItem *rightItem = [self.navigationItem setItemWithImage:@"no_message" size:have_image.size itemType:right];
    @weakify(self)
    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        LCMyMessageViewModel *myMessageVM = [[LCMyMessageViewModel alloc]initWithServices:self.viewModel.navigationStackService params:@{KEY_TITLE:@"我的消息"}];
        [self.viewModel.navigationStackService pushViewModel:myMessageVM animated:YES];
    }];
    //设置
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    !self.viewModel.searchClick ? : self.viewModel.searchClick();
    return NO;
}

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
        [cell bindViewModel:sectionModel.data[indexPath.row]];
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
        
        return CGSizeMake(60, 66);
    }else if (indexPath.section == 1 & indexPath.row == 0){
         return CGSizeMake(BIGIMAGEADDTEXT_W, BIGIMAGEADDTEXT_H);
        
    }else if (indexPath.section == 1 & indexPath.row != 0){
        return CGSizeMake(NORMALE_COLLECTIONCELL_W, NORMALE_COLLECTIONCELL_H);
    }else if (indexPath.section == 2){
        //SCREEN_WIDTH/750*(622-88)
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH/750*504);
    }else{
        return CGSizeZero;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //{top, left, bottom, right}
    if (section == 0) {
        return  UIEdgeInsetsMake(20, 85/2, 20, 85/2);
    }else if (section == 1){
        return  UIEdgeInsetsMake(25, 15, 0, 15);
    }else if (section == 2){
        return  UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        return UIEdgeInsetsZero;
    }

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return 15;
    }else if (section == 1){
        return 0;
    }else if (section == 2){
        return 0;
    }else{
        return 0;
    }

}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return ((SCREEN_WIDTH-60*3-85)/2);
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
