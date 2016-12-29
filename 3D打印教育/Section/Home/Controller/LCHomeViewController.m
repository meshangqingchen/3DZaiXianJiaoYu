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
#import "LCNomalCollectionViewCell.h"
#import "LCBigImageAndTextCollectionViewCell.h"
#import "LCBigImageCollectionViewCell.h"
#import "LCCollectionReusableHeaderView.h"
#import "LCCollectionReusableBannerHeaderView.h"

#import "LCHomeCollectionCellModel.h"
#import "LCHomeCollectionSectionModel.h"

#import "UINavigationItem+CustomItem.h"
@interface LCHomeViewController ()
<
UITextFieldDelegate,
UICollectionViewDelegateFlowLayout
>
@property(nonatomic,strong) LCHomeViewModel *viewModel;
@property(nonatomic,strong) LCTextFiled *tf;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@end

static NSString *identifierNomal = @"LCNomalCollectionViewCell";
static NSString *identifierBigImageAndText = @"LCBigImageAndTextCollectionViewCell";
static NSString *identifierBigImage = @"LCBigImageCollectionViewCell";
static NSString *identifierSectionHeader = @"LCCollectionReusableHeaderView";
static NSString *identifierBannerHeader = @"LCCollectionReusableBannerHeaderView";
@implementation LCHomeViewController
@dynamic viewModel,collectionView;
- (void)viewDidLoad {
    
//    self.view.backgroundColor = [UIColor yellowColor];
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
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.minimumInteritemSpacing = 10;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, STATUS_HEIGHT+NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-(STATUS_HEIGHT+NAVIGATIONBAR_HEIGHT+49)) collectionViewLayout:_flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[LCNomalCollectionViewCell class] forCellWithReuseIdentifier:identifierNomal];
    [self.collectionView registerClass:[LCBigImageAndTextCollectionViewCell class] forCellWithReuseIdentifier:identifierBigImageAndText];
    [self.collectionView registerClass:[LCBigImageCollectionViewCell class] forCellWithReuseIdentifier:identifierBigImage];
    
    [self.collectionView registerClass:[LCCollectionReusableHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierSectionHeader];
    [self.collectionView registerClass:[LCCollectionReusableBannerHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierBannerHeader];
    
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImage *have_image = [UIImage imageNamed:@"have_message"];
    MYLog(@"%@",have_image);
    MYLog(@"%@",NSStringFromCGSize(have_image.size));
    
    CustomBarItem *rightItem = [self.navigationItem setItemWithImage:@"have_message" size:have_image.size itemType:right];
    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
//        [self.view endEditing:YES];
//        [self.viewModel.navigationStackService popViewModelAnimated:YES];
    }];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"asd");
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
    LCHomeCollectionSectionModel *sectionModel =  self.viewModel.dataSource[indexPath.section];
    switch (sectionModel.sectionTyp) {
        case LCNormail:{
            LCNomalCollectionViewCell *normalCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierNomal forIndexPath:indexPath];
            [normalCell bindViewModel:sectionModel.data[indexPath.row]];
            return normalCell;
            break;
        }
        case LCBigImageAddText:{
            if (indexPath.row == 0) {
                LCBigImageAndTextCollectionViewCell *bigAndTextCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierBigImageAndText forIndexPath:indexPath];
                [bigAndTextCell bindViewModel:sectionModel.data[indexPath.row]];
                return bigAndTextCell;
            }else{
                LCNomalCollectionViewCell *normalCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierNomal forIndexPath:indexPath];
                [normalCell bindViewModel:sectionModel.data[indexPath.row]];
                return normalCell;
            }
            break;
        }
        case LCBigImage:{
            LCBigImageCollectionViewCell *bigImageCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierBigImage forIndexPath:indexPath];
            [bigImageCell bindViewModel:sectionModel.data[indexPath.row]];
            return bigImageCell;
            break;
        }
        default:
            break;
    }
    return nil;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LCHomeCollectionSectionModel *sectionModel =  self.viewModel.dataSource[indexPath.section];
        LCCollectionReusableBannerHeaderView *bannerHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierBannerHeader forIndexPath:indexPath];
        [bannerHeaderView bindViewModel:sectionModel andBannerViewModel:self.viewModel.homeBannerDataArr];
        return bannerHeaderView;
    }
    
    LCHomeCollectionSectionModel *sectionModel =  self.viewModel.dataSource[indexPath.section];
    LCCollectionReusableHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierSectionHeader forIndexPath:indexPath];
    [headerView bindViewModel:sectionModel];
    return headerView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0 ) {
        return CGSizeMake(SCREEN_WIDTH, BANANER_H);
    }
    return CGSizeMake(SCREEN_WIDTH, SECTION_H);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCHomeCollectionSectionModel *model =  self.viewModel.dataSource[indexPath.section];
    switch (model.sectionTyp) {
        case LCNormail:{
            return CGSizeMake(NORMALE_COLLECTIONCELL_W, NORMALE_COLLECTIONCELL_H);
            break;
        }
        case LCBigImageAddText:{
            if (indexPath.row == 0) {
                return CGSizeMake(BIGIMAGEADDTEXT_W, BIGIMAGEADDTEXT_H);
            }else{
                return CGSizeMake(NORMALE_COLLECTIONCELL_W, NORMALE_COLLECTIONCELL_H);
            }
            break;
        }
        case LCBigImage:{
            return CGSizeMake(BIGIMAGE_W, BIGIMAGE_H);
            break;
        }
        default:
            break;
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    LCHomeCollectionSectionModel *model =  self.viewModel.dataSource[section];
    switch (model.sectionTyp) {
        case LCNormail:{
            return  UIEdgeInsetsMake(15, 15, 0, 15);
            break;
        }
        case LCBigImageAddText:{//{top, left, bottom, right}
            return  UIEdgeInsetsMake(25, 15, 0, 15);
            break;
        }
        case LCBigImage:{
            return  UIEdgeInsetsMake(15, 15, 20, 15);
            break;
        }
        default:
            break;
    }
    return UIEdgeInsetsZero;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
