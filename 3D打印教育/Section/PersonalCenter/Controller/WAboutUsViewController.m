//
//  WAboutUsViewController.m
//  无限教育
//
//  Created by Mr.wang on 16/11/2.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "WAboutUsViewController.h"
#import <WebKit/WebKit.h>

@interface WAboutUsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation WAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(248, 248, 248);
    self.navigationItem.title = @"关于我们";
    
    [self createUI];
    
}

- (void)createUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = RGBCOLOR(248, 248, 248);
    
    [self.view addSubview:self.tableView];
    
    // logo 图标
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
    _headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 85)/2, 60, 85, 85)];
    logo.image = [UIImage imageNamed:@"XXH"];
    
    [_headerView addSubview:logo];
    
    // 获取app版本号
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    // 版本显示label
    UILabel * version = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 155, 100, 30)];
    
    version.textColor = RGBCOLOR(51, 51, 51);
    version.text = [NSString stringWithFormat:@"iOS V%@",app_Version];
    version.textAlignment = NSTextAlignmentCenter;
    
    [_headerView addSubview:version];
    
    _tableView.tableHeaderView = _headerView;
    
    [self footView];
}

- (void)footView{
    
    UILabel *name = [[UILabel alloc]init];
    
    name.text = @"无限三维（北京）科技产业技术有限公司";
    name.font = [UIFont systemFontOfSize:12];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = RGBCOLOR(153 , 155, 153);
    [self.view addSubview:name];

    [name mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.bottom.equalTo(self.view).offset(-50);
        make.height.mas_offset(15);
    }];
    
    
    UILabel *copyright = [[UILabel alloc]init];
    
    copyright.text = @"Copyright © 2016年 无限三维. All rights reserved.";
    copyright.font = [UIFont systemFontOfSize:12];
    copyright.textAlignment = NSTextAlignmentCenter;
    copyright.textColor = RGBCOLOR(153 , 153, 153);
    [self.view addSubview:copyright];
    
    [copyright mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.mas_offset(15);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellId"];
    }
    
    cell.textLabel.text = self.dataArray[0][indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    cell.detailTextLabel.text = self.dataArray[1][indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.wxswjy.com"]]];
        [self.view addSubview:webView];
        
    }else if(indexPath.row == 1){
    
        [self MakePhoneCall];
    }
}
/**
 *  拨打电话
 */
- (void)MakePhoneCall{
    
    NSString *telStr = @"4000079838";
    UIWebView *callWebView = [[UIWebView alloc] init];
    NSURL *telURL          = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",telStr]];
    [callWebView loadRequest:[NSURLRequest requestWithURL:telURL]];
    
    [self.view addSubview:callWebView];
}

- (NSArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = @[@[@"官方网址", @"联系电话"],@[@"http://www.wxswjy.com", @"010-84783365"]];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
