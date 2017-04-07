//
//  LCSearchViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSearchViewController.h"
#import "LCSearchViewModel.h"
#import "LCTextFiled.h"
#import "UINavigationItem+CustomItem.h"
#import "LCCourseCollectionCell.h"
#import "NSObject+Common.h"
#import <MJRefresh.h>

#define IETM_WIDTH  ((SCREEN_WIDTH - 16 - 9)/2)
#define IETM_HEIGHT IETM_WIDTH / 350 * 275
@interface LCSearchViewController ()
@property(nonatomic,strong) LCSearchViewModel *viewModel;
@property(nonatomic,strong) LCTextFiled *tf;
@property(nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *identifier = @"LCVideoCollectionViewCell";

@implementation LCSearchViewController
@dynamic viewModel,collectionView;
- (void)viewDidLoad {
    
    _tf = [[LCTextFiled alloc]initWithFrame:CGRectMake(35, 7, SCREEN_WIDTH - 90, 30)];
    _tf.layer.cornerRadius = 15;
    _tf.backgroundColor = [KDColor getC0Color];
    _tf.leftView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"fangdajing"]imageByTintColor:[KDColor getC3Color]]];
    _tf.leftViewMode = UITextFieldViewModeAlways;


    
    
    _tf.textColor = [KDColor getC3Color];
    _tf.font = [[KDFont sharedKDFont] getF28Font];
    NSString *placeholderString = @"搜一搜";
    

    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:placeholderString];
    [placeholder addAttribute:NSFontAttributeName value:[[KDFont sharedKDFont] getF28Font] range:NSMakeRange(0, placeholderString.length)];
    [placeholder addAttribute:NSForegroundColorAttributeName value:[KDColor getC3Color] range:NSMakeRange(0,placeholderString.length)];
    _tf.attributedPlaceholder = placeholder;
    [self.navigationController.navigationBar addSubview:_tf];
    
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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CustomBarItem *rightItem = [self.navigationItem setItemWithTitle:@"搜索" textColor:[UIColor whiteColor] fontSize:15 itemType:right];
    @weakify(self)
    [rightItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        [self.tf resignFirstResponder];
        if (self.tf.text == nil | self.tf.text.length == 0) {
            [NSObject showWarning:@"搜索内容不能为空"];
            return ;
        }
        
        [self.collectionView.mj_footer resetNoMoreData];
        !self.viewModel.searchKeyWord ? :self.viewModel.searchKeyWord(self.tf.text);
    }];
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
