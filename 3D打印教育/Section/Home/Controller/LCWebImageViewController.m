//
//  LCWebImageViewController.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCWebImageViewController.h"
#import "LCWebImageViewModel.h"
#import "NSObject+Common.h"
@interface LCWebImageViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) LCWebImageViewModel *viewModel;
@property(nonatomic,strong) UIWebView *webView;
@end

@implementation LCWebImageViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [UIWebView new];
    _webView.backgroundColor = [UIColor whiteColor];
    [_webView loadRequest:[NSURLRequest requestWithURL:self.viewModel.webURl]];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.top.mas_offset(64);
    }];
    
    _webView.delegate = self;
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
    if ([self.viewModel.className isEqualToString:@"LCHomeCarousellist"]) {
        bt.hidden = YES;
    }
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}
@end
