//
//  BaseCollectionViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "BaseCollectionViewModel.h"
#import <MJRefresh.h>
static void *xxcontext = &xxcontext;
@interface BaseCollectionViewController ()
@property(nonatomic,strong,readonly) BaseCollectionViewModel *viewModel;
@end

@implementation BaseCollectionViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.contentInset  = self.contentInset;
    self.collectionView.scrollIndicatorInsets = self.contentInset;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.emptyDataSetSource = self;
    self.collectionView.emptyDataSetDelegate = self;
    @weakify(self)
    if (self.viewModel.shouldPullToRefresh) {
        self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self)
            self.viewModel.curpage = 1;
            [self.viewModel.mutableDataArr removeAllObjects];
            [self.viewModel requestRemoteDataWithPage:self.viewModel.curpage completeHandle:^(id responseObj) {
                [self.collectionView.mj_header endRefreshing];
                NSDictionary *objDic = responseObj;
                NSNumber *morepage = objDic[@"morepage"];
                if ([morepage isEqual:@(1)]) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }];
        }];
    }
    
    if (self.viewModel.shouldInfiniteScrolling) {
        self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.viewModel.curpage = self.viewModel.curpage + 1;
            [self.viewModel requestRemoteDataWithPage:self.viewModel.curpage completeHandle:^(id responseObj) {
                @strongify(self)
                NSDictionary *objDic = responseObj;
                NSNumber *morepage = objDic[@"morepage"];
                if ([morepage isEqual:@(1)]) {
                    [self.collectionView.mj_footer endRefreshing];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }];
        }];
    }
    
    [self reloadData];
    for (int i=0; i<self.collectionView.subviews.count; i++) {
        UIView *emptyDataSetView = self.collectionView.subviews[i];
        MYLog(@"+++++++++%@",NSStringFromClass(emptyDataSetView.class));
        if ([NSStringFromClass(emptyDataSetView.class) isEqualToString:@"DZNEmptyDataSetView"]) {
            emptyDataSetView.hidden = YES;
        }
    }
    
    [self.viewModel requestRemoteDataWithPage:self.viewModel.curpage completeHandle:^(id responseObj) {
        
    }];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - DZNEmptyDataSetSource
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    
    if (kSharedAppDelegate.networkStatus == AFNetworkReachabilityStatusNotReachable || kSharedAppDelegate.networkStatus == AFNetworkReachabilityStatusUnknown) {
        
        MYLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(kSharedAppDelegate.networkStatus));
        return [UIImage imageNamed:@"no_network"];
    }
    return [UIImage imageNamed:@"zanwushuju"];
}


-(NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *title = @"暂无数据";
    if (kSharedAppDelegate.networkStatus == AFNetworkReachabilityStatusNotReachable || kSharedAppDelegate.networkStatus == AFNetworkReachabilityStatusUnknown) {
        title = @"请检查您的网络";
    }else{
        title = @"暂无数据";
    }
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:title attributes:nil];
    [attr addAttribute:NSFontAttributeName value:[[KDFont new] getF34Font] range:NSMakeRange(0, title.length)];
    [attr addAttribute:NSForegroundColorAttributeName value:[KDColor getC3Color] range:NSMakeRange(0, title.length)];
    return attr;
}

// 返回显示内容协议
#pragma mark - DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.viewModel.dataSource == nil || self.viewModel.dataSource.count == 0;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return -60;
}

-(void)bindViewModel{
    [super bindViewModel];
    [self.viewModel addObserver:self forKeyPath:KEY_DATASOURCE options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:xxcontext];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if(context == xxcontext) {
        if ([keyPath isEqualToString:KEY_DATASOURCE]) {
            if (change[@"old"]) {
                [self reloadData];
            }
        }
    }
}

-(void)dealloc{
    [self.viewModel removeObserver:self forKeyPath:KEY_DATASOURCE];
    self.collectionView.dataSource = nil;
    self.collectionView.delegate = nil;
}

-(void)reloadData{
    [self.collectionView reloadData];
}

- (UIEdgeInsets)contentInset
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
