
//
//  LCSelectZhiYuanAlerView.m
//  无限教育
//
//  Created by 3D on 16/11/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCSelectZhiYuanAlerView.h"
#import "LCZXBaoMingClassTypCell.h"
@interface LCSelectZhiYuanAlerView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation LCSelectZhiYuanAlerView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [KDColor getC0Color];
        self.layer.cornerRadius  = 4;
        self.layer.masksToBounds = YES;
        self.dataArr = @[@"3D打印桌面机特色班",
                         @"3D扫描定制班",
                         @"三维建模软件特色学习班",
                         @"3D打印培训初级班",
                         @"3D打印创意班",
                         @"3D打印梦想班"
                         ];
        [self setUpviews];
    }
    return self;
}

-(void)setUpviews{
//    self.zhiyeBT = [UIButton new];
//    [self addSubview:_zhiyeBT];
//    [_zhiyeBT setTitle:@"职业教育" forState:0];
//    [_zhiyeBT setTitleColor:[KDColor getC2Color] forState:0];
//    [_zhiyeBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
//    _zhiyeBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
//    [_zhiyeBT mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.mas_equalTo(0);
//        make.height.mas_equalTo(44);
//    }];
//    
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = [KDColor getC15Color];
//    [self addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.centerY.mas_equalTo(0);
//        make.height.mas_equalTo(0.5);
//    }];
//    
//    self.shuoshiBT = [UIButton new];
//    [self addSubview:_shuoshiBT];
//    [_shuoshiBT setTitle:@"硕士教育" forState:0];
//    [_shuoshiBT setTitleColor:[KDColor getC2Color] forState:0];
//    [_shuoshiBT setTitleColor:[KDColor getX1Color] forState:UIControlStateSelected];
//    _shuoshiBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
//    [_shuoshiBT mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(44);
//    }];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self addSubview: self.tableView];
    self.tableView.rowHeight = 38;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[LCZXBaoMingClassTypCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCZXBaoMingClassTypCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell bindViewModel:self.dataArr[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    
}

-(void)dealloc{
    MYLog(@"这个 销毁了");
}

@end
