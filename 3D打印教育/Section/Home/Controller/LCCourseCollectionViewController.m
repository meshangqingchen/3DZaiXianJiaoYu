//
//  LCCourseCollectionViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/16.
//  Copyright © 2017年 3D. All rights reserved.
//  course....

#import "LCCourseCollectionViewController.h"
#import "LCCourseCollectionViewModel.h"
#import "LCCourseCollectionCell.h"

#define IETM_WIDTH  ((SCREEN_WIDTH - 16 - 9)/2)
#define IETM_HEIGHT IETM_WIDTH / 350 * 275
@interface LCCourseCollectionViewController ()
@property(nonatomic,strong) LCCourseCollectionViewModel *viewModel;
@property(nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *identifier = @"LCVideoCollectionViewCell";

@implementation LCCourseCollectionViewController
@dynamic viewModel,collectionView;
- (void)viewDidLoad {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 9;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 8, 10, 8);
    flowLayout.itemSize = CGSizeMake(IETM_WIDTH, IETM_HEIGHT);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [KDColor getC0Color];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[LCCourseCollectionCell class] forCellWithReuseIdentifier:identifier];
    
    [super viewDidLoad];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    LCCourseCollectionCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel didSelectRowAtIndexPath:indexPath in:collectionView];
}

@end
