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
/**
 @synthesize的语义是如果你没有手动实现setter方法和getter方法，那么编译器会自动为你加上这两个方法。
 @dynamic告诉编译器,属性的setter与getter方法由用户自己实现，不自动生成。（当然对于readonly的属性只需提供getter即可）。假如一个属性被声明为@dynamic var，然后你没有提供@setter方法和@getter方法，编译的时候没问题，但是当程序运行到instance.var =someVar，由于缺setter方法会导致程序崩溃；或者当运行到 someVar = var时，由于缺getter方法同样会导致崩溃。编译时没问题，运行时才执行相应的方法，这就是所谓的动态绑定。
 
 我们是继承baseViewController的在base中没有写@dynamic 默认就是@synthesize所以base中是是有get方法的
 这样就呢动态的 获得我么ViewMode 是神马类
 */
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
    
    [self.viewModel requestRemoteDataWithPage:self.viewModel.page completeHandle:^(id responseObj) {
        
    }];
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

-(void)dealloc{
    [self.viewModel removeObserver:self forKeyPath:KEY_DATASOURCE];
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

-(void)reloadData{
    [self.tableView reloadData];
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
