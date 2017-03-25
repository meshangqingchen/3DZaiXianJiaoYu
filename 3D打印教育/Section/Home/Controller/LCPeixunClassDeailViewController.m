//
//  LCPeixunClassDeailViewController.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPeixunClassDeailViewController.h"
#import "LCPeiXunClassDetailViewModel.h"
#import <WebKit/WKWebView.h>
@interface LCPeixunClassDeailViewController ()
@property(nonatomic,strong) LCPeiXunClassDetailViewModel *viewModel;
@property(nonatomic,strong) UIWebView *wkwebView;
@end

@implementation LCPeixunClassDeailViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * topView = [self creatheaderView];
    [self.view addSubview:topView];
   
    UIView *Lanview = [self creatLanseView];
    [self.view addSubview:Lanview];
    [Lanview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom).mas_equalTo(30);
        make.right.mas_equalTo(0);
    }];
    
    self.wkwebView = [UIWebView new];
    _wkwebView.backgroundColor = [KDColor getC0Color];
    [self.view addSubview:_wkwebView];
    [_wkwebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Lanview.mas_bottom).mas_equalTo(42);
        make.left.right.bottom.mas_equalTo(0);
    }];
   
    [self.wkwebView loadHTMLString:self.viewModel.descrip baseURL:nil];
    
    UIButton *bt = [UIButton new];
    [self.view addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-59);
        make.width.height.mas_equalTo(70);
    }];
    [bt setImage:[UIImage imageNamed:@"bao_ming"] forState:UIControlStateNormal];
    @weakify(self)
    [bt addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.viewModel.baoMing ? : self.viewModel.baoMing();
    }];
}

-(UIView *)creatheaderView{
    UIView *hview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH/75*30)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/75*30)];
    imageView.image = [UIImage imageNamed:@"PeiXundetailTou"];
    [hview addSubview:imageView];
    return hview;
}

-(UIView *)creatLanseView{
    UIView *view = [UIView new];
    
    UIView *leftView = [UIView new];
    leftView.backgroundColor = [KDColor getC32Color];
    UILabel *nameLb = [UILabel new];
    nameLb.textColor = [KDColor getC0Color];
    nameLb.font = [[KDFont sharedKDFont] getF34Font];
    nameLb.text = self.viewModel.name;
    [leftView addSubview:nameLb];
    [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(8);
        make.right.mas_offset(-15);
        make.left.mas_equalTo(28);
    }];
    
    UILabel *timeLb = [UILabel new];
    timeLb.textColor = [KDColor getC2Color];
    timeLb.font = [[KDFont sharedKDFont] getF28Font];
    timeLb.text = @"学习时间4";//self.viewModel.name;
    [leftView addSubview:timeLb];
    [timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-5);
        make.right.mas_offset(-15);
    }];
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"PeiXundetailYuan"];
    
    [view addSubview:leftView];
    [view addSubview:imageView];
    
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.left.bottom.mas_equalTo(0);
        make.right.mas_equalTo(leftView.mas_left).mas_equalTo(25);
    }];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.mas_equalTo(0);
    }];
    return view;
}
@end


/*
 self.webView = [WKWebView new];
 self.webView.scrollView.scrollEnabled = NO;
 self.webView.navigationDelegate = self;
 [self addSubview:self.webView];
 
 [self.webView loadHTMLString:IntroViewViewModel.courseDisCription baseURL:nil];
 
 }
 
 - (void)webView:( *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
 @weakify(self)
 [webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
 @strongify(self)
 [result doubleValue];
 
 //        self.webView.height =  [result doubleValue];
 //        self.courseIntroductionCellModel.callBackCell_H([result doubleValue]);
 [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.mas_equalTo(54);
 make.right.mas_equalTo(-54);
 make.top.mas_equalTo(self.courseDLB.mas_bottom).mas_offset(20);
 make.height.mas_equalTo([result doubleValue]);
 make.bottom.mas_equalTo(-27);
 }];
 }];
 }

 */


