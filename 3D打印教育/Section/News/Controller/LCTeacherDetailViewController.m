//
//  LCTeacherDetailViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTeacherDetailViewController.h"
#import "LCTeacherDetailViewModel.h"
#import "LCTeacherDetailViewViewModel.h"

#import "LCAboutYYWebImage.h"
@interface LCTeacherDetailViewController ()
@property(nonatomic,strong) LCTeacherDetailViewModel *viewModel;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) LCTeacherDetailViewViewModel *viewNM;
@end

@implementation LCTeacherDetailViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [KDColor getC19Color];
    self.navigationController.navigationBar.hidden = YES;
    self.viewModel.networkRequests(self.viewModel.teacherID);
    
    
    UIView *topView = [UIView new];
    [self.view addSubview:topView];
    topView.backgroundColor = [KDColor getX1Color];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 142);
    
    UIButton *fanhui = [UIButton new];
    [topView addSubview:fanhui];
    fanhui.backgroundColor = [UIColor blackColor];
    fanhui.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [fanhui setImage:[UIImage imageNamed:@"Myself_back_image"] forState:0];
    [fanhui setTitleColor:[KDColor getC0Color] forState:0];
    fanhui.titleLabel.font = [[KDFont sharedKDFont] getF26Font];
    [fanhui mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(28);
        make.size.mas_equalTo(CGSizeMake(20, 26));
        
    }];
    @weakify(self)
    [fanhui addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        [self.viewModel.navigationStackService popViewModelAnimated:YES];
    }];

    UIImageView *headerImageView = [UIImageView new];
    headerImageView.backgroundColor = [UIColor orangeColor];
    [topView addSubview:headerImageView];
    [headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(25);
        make.bottom.mas_offset(-15);
        make.size.mas_equalTo(70);
    }];
    
    UILabel *nameLB = [UILabel new];
    nameLB.textColor = [KDColor getC0Color];
    nameLB.font = [[KDFont sharedKDFont] getF32Font];
    [topView addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headerImageView.mas_top).mas_offset(10);
        make.left.mas_equalTo(headerImageView.mas_right).mas_offset(10);
    }];
    
    UILabel *shortDetail = [UILabel new];
    shortDetail.textColor = [KDColor getC0Color];
    shortDetail.font = [[KDFont sharedKDFont] getF26Font];
    [topView addSubview:shortDetail];
    [shortDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-25);
        make.left.mas_equalTo(headerImageView.mas_right).mas_offset(10);
        make.right.mas_offset(-15);
    }];
    
    UIView *middleView = [UIView new];
    middleView.backgroundColor = [KDColor getC0Color];
    middleView.top = topView.bottom+5;
    middleView.left = 0;
    middleView.width = SCREEN_WIDTH;
    [self.view addSubview:middleView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(25, 20, SCREEN_WIDTH-50, 0)];
    [middleView addSubview:self.scrollView];
    YYLabel *detailLB = [YYLabel new];
    [self.scrollView addSubview:detailLB];
    detailLB.top = 0;
    detailLB.left = 0;
    detailLB.width = SCREEN_WIDTH-50;
    
    
    UIView *bottomView = [UIView new];
    [self.view addSubview:bottomView];
    bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49);
    bottomView.backgroundColor = [KDColor getC5Color];
    
    UILabel *wenda = [UILabel new];
    wenda.font = [[KDFont sharedKDFont] getF26Font];
    wenda.textColor = [KDColor getC2Color];
    wenda.text = @"问答:";
    [bottomView addSubview:wenda];
    [wenda mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    
    UILabel *priceLB = [UILabel new];
    priceLB.font = [[KDFont sharedKDFont] getF26Font];
    priceLB.textColor = [KDColor getC23Color];
    [bottomView addSubview:priceLB];
    [priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wenda.mas_right).mas_offset(15);
        make.centerY.mas_offset(0);
    }];
    
    UIButton *zixun = [UIButton new];
    [bottomView addSubview:zixun];
    zixun.backgroundColor = [KDColor getX1Color];
    [zixun setTitle:@"咨询" forState:0];
    [zixun setTitleColor:[KDColor getC0Color] forState:0];
    zixun.titleLabel.font = [[KDFont sharedKDFont] getF26Font];
    [zixun mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_offset(0);
        make.width.mas_equalTo(90);
    }];
    [zixun addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        if (self.viewNM.ifProblem) {
            !self.viewModel.pushTackWithTeacher ? : self.viewModel.pushTackWithTeacher(self.viewNM);
        }else{
            !self.viewModel.pushZhiFuForZiXun ? : self.viewModel.pushZhiFuForZiXun(self.viewNM);
        }
    }];
    
    [self.viewModel setBingViewModel:^(LCTeacherDetailViewViewModel *viewModel) {
        @strongify(self)
        self.viewNM = viewModel;
        [headerImageView setImageWithURL:viewModel.headImageURL
                                placeholder:[UIImage imageNamed:@""]
                                    options:kNilOptions
                                    manager:[LCAboutYYWebImage avatarImageManager2]
                                   progress:nil
                                  transform:nil
                                 completion:nil];
        nameLB.text = viewModel.teacherName;
        shortDetail.text = viewModel.shortDis;
        detailLB.textLayout = viewModel.disLayout;
        priceLB.text = viewModel.price;
        
        middleView.height = viewModel.backView_H;
        self.scrollView.height = viewModel.scro_H;
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH-50, viewModel.disLB_H);
        detailLB.height = viewModel.disLB_H;
        
        
    }];
}

@end
