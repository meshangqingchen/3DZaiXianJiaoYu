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
        make.centerY.mas_offset(0);
        make.left.mas_offset(15);
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
    
    UILabel *changeZhifuLB = [UILabel new];
    changeZhifuLB.text = @"选择支付方式";
    changeZhifuLB.textColor = [KDColor getC3Color];
    changeZhifuLB.numberOfLines = 2;
    changeZhifuLB.font = [[KDFont sharedKDFont]getF26Font];
    [self.view addSubview:changeZhifuLB];
    [changeZhifuLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_equalTo(backView3.mas_bottom).mas_equalTo(10);
    }];
//
    UIView *backView4 = [UIView new];
    backView4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView4];
    [backView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(changeZhifuLB.mas_bottom).mas_offset(15);
        make.height.mas_offset(45);
    }];
    
    UIImageView *zhifubaoImageView = [UIImageView new];
    UIImage *zhifubaoImage = [UIImage imageNamed:@"zhifubao"];
    zhifubaoImageView.image= zhifubaoImage;
    [backView4 addSubview:zhifubaoImageView];
    [zhifubaoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(zhifubaoImage.size);
    }];
    
    UIImageView *duigouInageView = [UIImageView new];
    UIImage *duigouImage = [UIImage imageNamed:@"duigou"];
    duigouInageView.image= duigouImage;
    [backView4 addSubview:duigouInageView];
    [duigouInageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(duigouImage.size);
    }];

    UIView *bottomLeftView = [UIView new];
    bottomLeftView.backgroundColor = [KDColor getC5Color];
    [self.view addSubview:bottomLeftView];
    [bottomLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_offset(0);
        make.height.mas_equalTo(49);
        make.width.mas_equalTo(SCREEN_WIDTH-100);
    }];
    UILabel *trulyLB = [UILabel new];
    trulyLB.text = @"实付金额:";
    trulyLB.textColor = [KDColor getC3Color];
    trulyLB.numberOfLines = 2;
    trulyLB.font = [[KDFont sharedKDFont]getF32Font];
    [bottomLeftView addSubview:trulyLB];
    [trulyLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_equalTo(0);
    }];
    float price = [self.viewModel.price floatValue];
    
    UILabel *trulyPriceLB = [UILabel new];
    trulyPriceLB.text = [NSString stringWithFormat:@"¥ %.2f",price];
    trulyPriceLB.textColor = [KDColor getC23Color];
    trulyPriceLB.numberOfLines = 2;
    trulyPriceLB.font = [[KDFont sharedKDFont]getF32Font];
    [bottomLeftView addSubview:trulyPriceLB];
    [trulyPriceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(trulyLB.mas_right).mas_offset(15);
        make.centerY.mas_equalTo(0);
    }];
    
    UIButton *bottomRightBT = [UIButton new];
    [bottomRightBT setTitle:@"确认支付" forState:0];
    bottomRightBT.titleLabel.font = [[KDFont sharedKDFont] getF32Font];
    [bottomRightBT setTitleColor:[KDColor getC0Color] forState:0];
    bottomRightBT.backgroundColor = [KDColor getX1Color];
    [self.view addSubview:bottomRightBT];
    [bottomRightBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_offset(0);
        make.height.mas_equalTo(49);
        make.width.mas_equalTo(100);
    }];
    @weakify(self)
    [bottomRightBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.zhifu ? : self.viewModel.zhifu();
    }];
}


//- (NSString *)generateTradeNO
//{
//    static int kNumber = 15;
//    
//    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//    NSMutableString *resultStr = [[NSMutableString alloc] init];
//    srand((unsigned)time(0));
//    for (int i = 0; i < kNumber; i++)
//    {
//        unsigned index = rand() % [sourceStr length];
//        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
//        [resultStr appendString:oneStr];
//    }
//    return resultStr;
//}


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
