//
//  BaseTableViewController.m
//  3D打印教育
//
//  Created by 3D on 16/12/9.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseTableViewModel.h"
#import <MJRefresh.h>

static void *xxcontext = &xxcontext;
@interface BaseTableViewController ()
@property (nonatomic, assign, readwrite) UIEdgeInsets contentInset;

@property (nonatomic, strong, readonly) BaseTableViewModel *viewModel;
@end

@implementation BaseTableViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset  = self.contentInset;
    self.tableView.scrollIndicatorInsets = self.contentInset;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    @weakify(self)
    if (self.viewModel.shouldPullToRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self)
            self.viewModel.curpage = 1;
            [self.viewModel requestRemoteDataWithPage:self.viewModel.curpage completeHandle:^(id responseObj) {
                [self.tableView.mj_header endRefreshing];
                
                // 这是下拉刷新 当上啦记载跟多的时候 没有了数据mj_footer 的状态就是endRefreshingWithNoMoreData就不能上啦了 所以在加载更多的时候 把状态改过来resetNoMoreData
                
//                NSDictionary *objDic = responseObj;
//                NSNumber *morepage = objDic[@"morepage"];
//                if ([morepage isEqual:@(1)]) {
//                    [self.tableView.mj_footer resetNoMoreData];
//                }else{
//                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
//                }
            }];
        }];
    }
    
    if (self.viewModel.shouldInfiniteScrolling) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @strongify(self)
            self.viewModel.curpage = self.viewModel.curpage + 1;
            [self.viewModel requestRemoteDataWithPage:self.viewModel.curpage completeHandle:^(id responseObj) {
                //morepage = 1是还有数据就用endRefreshing morepage=0没有更多数据了 endRefreshingWithNoMoreData
                
//                NSDictionary *objDic = responseObj;
//                NSNumber *morepage = objDic[@"morepage"];
//                if ([morepage isEqual:@(1)]) {
//                    [self.tableView.mj_footer endRefreshing];
//                }else{
//                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
//                }
            }];
        }];
    }
}


#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)bindViewModel{
    [super bindViewModel];
    [self.viewModel addObserver:self forKeyPath:KEY_DATASOURCE options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:xxcontext];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
   
    if (context == xxcontext) {
        if ([keyPath isEqualToString:KEY_DATASOURCE]) {
            if (change[@"old"]) {
                [self reloadData];
            }
        }
    }
}

-(void)reloadData{
    [self.tableView reloadData];
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
