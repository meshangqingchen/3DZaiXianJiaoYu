//
//  LCZaiXianZiXunViewController.m
//  3D打印教育
//
//  Created by 3D on 17/3/20.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCZaiXianZiXunViewController.h"
#import "LCZaiXianZiXunViewModel.h"
#import "NSObject+Common.h"
#import <WebKit/WebKit.h>
@interface LCZaiXianZiXunViewController ()
<UIWebViewDelegate,
WKNavigationDelegate>
@property(nonatomic,strong) UIWebView *webView;
@property(nonatomic,strong) WKWebView *wkWebView;
@end

@implementation LCZaiXianZiXunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _wkWebView = [WKWebView new];
    _wkWebView.backgroundColor = [UIColor whiteColor];//www.baidu.com
    
    NSURL *url = [NSURL URLWithString:@"http://p.qiao.baidu.com/cps/chat?siteId=10451744&userId=17909419"];
    
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:self.wkWebView];
    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.top.mas_offset(64);
    }];
    _wkWebView.navigationDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate


-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [self showProgress]; //旋转提示
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self hideProgress];
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [self hideProgress];
}
@end
