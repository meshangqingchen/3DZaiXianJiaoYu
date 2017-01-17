//
//  LCCourseClassViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassViewController.h"
#import "LCCourseClassViewModel.h"
#import "LCCourseClassCollectionCell.h"

#import "LCCourseClassSCellViewModel.h"
#import "LCCourseClassFCellViewModel.h"
#import "LCCourseClassCollectionHeaderView.h"
@interface LCCourseClassViewController ()
@property(nonatomic,strong) LCCourseClassViewModel *viewModel;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@end

static NSString *identifier = @"LCCourseClassCollectionCell";
static NSString *identifierHeader = @"LCCourseClassCollectionHeaderView";

@implementation LCCourseClassViewController
@dynamic viewModel,collectionView;
- (void)viewDidLoad {
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.minimumInteritemSpacing = 0;
    _flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/2, 44);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-(64+49)) collectionViewLayout:_flowLayout];
    self.collectionView.backgroundColor = [KDColor getC19Color];
    
    [self.collectionView registerClass:[LCCourseClassCollectionCell class] forCellWithReuseIdentifier:identifier];//LCCourseClassCollectionHeaderView
    
    [self.collectionView registerClass:[LCCourseClassCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierHeader];
   
    [self.view addSubview:self.collectionView];
    [super viewDidLoad];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.viewModel.dataSource.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    LCCourseClassFCellViewModel *fonVM = self.viewModel.dataSource[section];
    return fonVM.sonList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCCourseClassFCellViewModel *fonVM = self.viewModel.dataSource[indexPath.section];
    LCCourseClassCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:fonVM.sonList[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    LCCourseClassFCellViewModel *fcellVM = self.viewModel.dataSource[indexPath.section];
    
    LCCourseClassCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierHeader forIndexPath:indexPath];
    [headerView bindViewModel:fcellVM andIndexpath:indexPath];
    return headerView;
}
//
//这个是头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 49);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:collectionView];
}
@end
