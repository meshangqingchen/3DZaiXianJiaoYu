//
//  LCFeedbackViewController.m
//  无限教育
//
//  Created by 3D on 16/11/1.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCFeedbackViewController.h"
#import "LCFeedbackViewModel.h"
#import "UIPlaceHolderTextView.h"
#import "UINavigationItem+CustomItem.h"
@interface LCFeedbackViewController ()
@property(nonatomic,strong) LCFeedbackViewModel *viewModel;
@property(nonatomic,strong) UIPlaceHolderTextView *textView;
@property(nonatomic,strong) UITextField *textField;
@end

@implementation LCFeedbackViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"意见反馈";
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [KDColor getC12Color];
    UIView *shadowView = [UIView new];
    [self.view addSubview:shadowView];
    shadowView.backgroundColor = [KDColor getC25Color];
    shadowView.layer.cornerRadius = 4.0;
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20+64);
        make.height.mas_equalTo(161.5);
    }];
    
    UIView *backView = [UIView new];
    [shadowView addSubview:backView];
    backView.backgroundColor = [KDColor getC0Color];
    backView.layer.cornerRadius = 4.0;
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-1.5);
    }];
    
    self.textView = [[UIPlaceHolderTextView alloc]init];
    [backView addSubview:_textView];
    _textView.font = [[KDFont new]getF30Font];
    _textView.placeholder = @"谢谢你愿意花时间让我们变得更好";
    _textView.placeholderColor = [KDColor getX0Color];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    
    UIView *textFieldShadowView = [UIView new];
    [self.view addSubview:textFieldShadowView];
    textFieldShadowView.backgroundColor = [KDColor getC12Color];
    textFieldShadowView.layer.cornerRadius = 4.0;
    [textFieldShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(shadowView.mas_bottom).mas_equalTo(25);
        make.height.mas_equalTo(40.5);
    }];
    
    UIView *textFieldBackView = [UIView new];
    [textFieldShadowView addSubview:textFieldBackView];
    textFieldBackView.backgroundColor = [KDColor getC0Color];
    textFieldBackView.layer.cornerRadius = 4.0;
    [textFieldBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-1.5);
    }];
    
    self.textField = [UITextField new];
    [textFieldBackView addSubview:_textField];
    
    NSString *placeholderString = @"请输入QQ或邮箱等联系方式";
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:placeholderString];
    [placeholder addAttribute:NSFontAttributeName value:[[KDFont new] getF30Font] range:NSMakeRange(0, placeholderString.length)];
    [placeholder addAttribute:NSForegroundColorAttributeName value:[KDColor getX0Color] range:NSMakeRange(0,placeholderString.length)];
    self.textField.attributedPlaceholder = placeholder;

    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(8);
        make.bottom.mas_equalTo(-7);
    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CustomBarItem *rightBarItem = [self.navigationItem setItemWithTitle:@"发送" textColor:[KDColor getC0Color] fontSize:15 itemType:right];
    @weakify(self)
    [rightBarItem addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self)
        !self.viewModel.sendIder ? : self.viewModel.sendIder(self.textView.text,self.textField.text);
        [self.textField resignFirstResponder];
        [self.textView resignFirstResponder];
    }];
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
