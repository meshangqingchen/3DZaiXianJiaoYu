//
//  LCNotarizeOrderViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCNotarizeOrderViewController.h"
#import "LCNotarizeOrderViewModel.h"

@interface LCNotarizeOrderViewController ()
@property(nonatomic,strong) LCNotarizeOrderViewModel *viewModel;
@end

@implementation LCNotarizeOrderViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.viewModel.networkRequest();
    self.view.backgroundColor = [KDColor getC19Color];
   
    UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, 44)];
    backView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView1];
    UILabel *lb = [UILabel new];
    lb.backgroundColor = [UIColor redColor];
    lb.text = @"课程对应有效时间范围,请合理安排学习时间";
    lb.textColor = [KDColor getC2Color];
    lb.font = [[KDFont sharedKDFont]getF28Font];
    [backView1 addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_offset(0);
//        make.left.mas_offset();
        make.edges.mas_equalTo(0);
    }];
    
    
    
    
    
    UIView *backView2 = [[UIView alloc]initWithFrame:CGRectMake(0, backView1.bottom+5, SCREEN_WIDTH, 100)];
    backView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView2];
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor orangeColor];

    [imageView setImageWithURL:self.viewModel.imageURL placeholder:[UIImage imageNamed:@""]];
    [backView2 addSubview:imageView];
    imageView.frame = CGRectMake(15, 15, 100, 70);
    
    UILabel *titleLB = [UILabel new];
    titleLB.text = self.viewModel.titleName;
    titleLB.textColor = [KDColor getC2Color];
    titleLB.numberOfLines = 2;
    titleLB.font = [[KDFont sharedKDFont]getF28Font];
    [backView2 addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).mas_offset(10);
        make.right.mas_offset(-15);
        make.top.mas_offset(15);
    }];
    
    UILabel *priceLB = [UILabel new];
    priceLB.text = [NSString stringWithFormat:@"¥ %@",self.viewModel.price];
    priceLB.textColor = [KDColor getC3Color];
    priceLB.font = [[KDFont sharedKDFont]getF26Font];
    [backView2 addSubview:priceLB];
    [priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).mas_offset(10);
        make.bottom .mas_equalTo(imageView);
    }];
    
    UIView *backView3 = [[UIView alloc]initWithFrame:CGRectMake(0, backView2.bottom+5, SCREEN_WIDTH, 44)];
    backView3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView3];
    UILabel *allPrice = [UILabel new];
    allPrice.text = [NSString stringWithFormat:@"%@:%@",@"总计",self.viewModel.price];
    allPrice.textColor = [KDColor getC2Color];
    allPrice.font = [[KDFont sharedKDFont]getF30Font];
    [backView3 addSubview:allPrice];
    [allPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_equalTo(0);
    }];
    
//    UIView *backView4 = [[UIView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, 44)];
//    backView4.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:backView4];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
