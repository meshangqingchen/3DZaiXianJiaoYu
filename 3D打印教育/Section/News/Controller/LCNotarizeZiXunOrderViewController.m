//
//  LCNotarizeZiXunOrderViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCNotarizeZiXunOrderViewController.h"
#import "LCAboutYYWebImage.h"
#import "LCNotarizeZiXunOrderViewModel.h"
@interface LCNotarizeZiXunOrderViewController ()
@property(nonatomic,strong) LCNotarizeZiXunOrderViewModel *viewModel;
@end

@implementation LCNotarizeZiXunOrderViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [KDColor getC19Color];
    UIView *v1 = [UIView new];
    v1.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:v1];
    v1.frame = CGRectMake(0, 69, SCREEN_WIDTH, 70);
    UIImageView *headimageView = [UIImageView new];
    [v1 addSubview:headimageView];
    [headimageView setImageWithURL:self.viewModel.viewVM.headImageURL
                        placeholder:[UIImage imageNamed:@"cracking_image"]
                            options:kNilOptions
                            manager:[LCAboutYYWebImage avatarImageManager]
                           progress:nil
                          transform:nil
                        completion:nil];
    [headimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.mas_offset(15);
    }];
    UILabel *nameLB = [UILabel new];
    nameLB.textColor = [KDColor getC2Color];
    nameLB.font = [[KDFont sharedKDFont]getF30Font];
    nameLB.text = self.viewModel.viewVM.teacherName;
    [v1 addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headimageView.mas_right).mas_equalTo(10);
        make.top.mas_offset(15);
    }];
    UILabel *zaixianzixun = [UILabel new];
    zaixianzixun.textColor = [KDColor getC3Color];
    zaixianzixun.font = [[KDFont sharedKDFont]getF26Font];
    zaixianzixun.text = @"在线资讯";
    [v1 addSubview:zaixianzixun];
    [zaixianzixun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headimageView.mas_right).mas_equalTo(10);
        make.bottom.mas_offset(-15);
    }];
    
    UILabel *jiage = [UILabel new];
    jiage.textColor = [KDColor getC23Color];
    jiage.font = [[KDFont sharedKDFont]getF26Font];
//    jiage.text = self.viewModel.viewVM.price;
    [v1 addSubview:jiage];
    [jiage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    

    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:v2];
    v2.frame = CGRectMake(0, v1.bottom+5, SCREEN_WIDTH, 44);
    
    UILabel *zixunfangshi = [UILabel new];
    zixunfangshi.text = @"资讯方式";
    zixunfangshi.textColor = [KDColor getC2Color];
    zixunfangshi.font = [[KDFont sharedKDFont] getF30Font];
    [v2 addSubview:zixunfangshi];
    [zixunfangshi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    UIButton *tuwenzixun = [UIButton new];
    [tuwenzixun setImage:[UIImage imageNamed:@""] forState:0];
    [tuwenzixun setTitle:@"图文咨询" forState:0];
    [tuwenzixun setTitleColor:[KDColor getC3Color] forState:0];
    tuwenzixun.titleLabel.font = [[KDFont sharedKDFont] getF30Font];
    [v2 addSubview:tuwenzixun];
    [tuwenzixun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:v3];
    v3.frame = CGRectMake(0, v2.bottom, SCREEN_WIDTH, 44);
    
    UILabel *gongxuzhifu = [UILabel new];
    gongxuzhifu.text = @"共需支付";
    gongxuzhifu.textColor = [KDColor getC2Color];
    gongxuzhifu.font = [[KDFont sharedKDFont] getF30Font];
    [v3 addSubview:gongxuzhifu];
    [gongxuzhifu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    UILabel *jiage2 = [UILabel new];
    jiage2.textColor = [KDColor getC23Color];
    jiage2.font = [[KDFont sharedKDFont]getF26Font];
        jiage.text = self.viewModel.viewVM.price;
    [v3 addSubview:jiage2];
    [jiage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    
    
    UIView *v4 = [UIView new];
    v4.backgroundColor = [KDColor getC19Color];
    [self.view addSubview:v4];
    v4.frame = CGRectMake(0, v3.bottom, SCREEN_WIDTH, 44);
    UILabel *xuanzezhifu = [UILabel new];
    xuanzezhifu.text = @"选择支付";
    xuanzezhifu.textColor = [KDColor getC3Color];
    xuanzezhifu.font = [[KDFont sharedKDFont] getF26Font];
    [v4 addSubview:xuanzezhifu];
    [xuanzezhifu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];

    UIView *v5 = [UIView new];
    v5.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:v5];
    v5.frame = CGRectMake(0, v4.bottom, SCREEN_WIDTH, 44);
    UIImageView *zhifubaoImageView = [UIImageView new];
    UIImage *zhifubaoImage = [UIImage imageNamed:@"zhifubao"];
    zhifubaoImageView.image= zhifubaoImage;
    [v5 addSubview:zhifubaoImageView];
    [zhifubaoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(zhifubaoImage.size);
    }];
    UIImageView *duigouInageView = [UIImageView new];
    UIImage *duigouImage = [UIImage imageNamed:@"duigou"];
    duigouInageView.image= duigouImage;
    [v5 addSubview:duigouInageView];
    [duigouInageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(duigouImage.size);
    }];
    
    UIButton *querenzhifu = [UIButton new];
    [self.view addSubview:querenzhifu];
    querenzhifu.frame = CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49);
    querenzhifu.backgroundColor = [KDColor getX1Color];
    [querenzhifu setTitle:@"确认支付" forState:0];
    querenzhifu.titleLabel.font = [[KDFont sharedKDFont] getF32Font];
    [querenzhifu setTitleColor:[KDColor getC0Color] forState:0];
    @weakify(self)
    [querenzhifu addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.qurenzhifu ? : self.viewModel.qurenzhifu();
    }];
}
@end
