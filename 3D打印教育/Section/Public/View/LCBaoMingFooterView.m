//
//  LCBaoMingFooterView.m
//  无限教育
//
//  Created by 3D on 16/11/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCBaoMingFooterView.h"
#import "LCBaoMingModel.h"
#import "UIView+BlocksKit.h"
@interface LCSimilarBaoMingLBCell ()

@end

@implementation LCSimilarBaoMingLBCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [KDColor getC13Color];//
    shadowView.layer.cornerRadius = 5;
    [self addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(34);
    }];
    
    UIView *backWhiteView = [UIView new];
    backWhiteView.backgroundColor = [KDColor getC12Color];
    backWhiteView.layer.cornerRadius = 4.5;
    [shadowView addSubview:backWhiteView];
    [backWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5));
    }];
    
//    UIImageView *pullArrowsImageView = [UIImageView new];
//    [backWhiteView addSubview:pullArrowsImageView];
//    pullArrowsImageView.image = [UIImage imageNamed:@"pullArrows"];
//    [pullArrowsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(-10);
//        make.centerY.mas_equalTo(0);
//        make.width.mas_equalTo(25/2);
//        make.height.mas_equalTo(7);
//    }];
    
    self.placHoderLB = [UILabel new];
    _placHoderLB.font = [[KDFont sharedKDFont]getF30Font];
    _placHoderLB.textColor = [KDColor getX0Color];
    _placHoderLB.text = @"请选择支付方式";
    [backWhiteView addSubview:_placHoderLB];
    [_placHoderLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    
    self.titleLB = [UILabel new];
    [self addSubview:_titleLB];
    _titleLB.font = [[KDFont sharedKDFont]getF30Font];
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.text = @"支付方式";
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(shadowView.mas_top).mas_equalTo(-10);
    }];
    @weakify(self)
    [backWhiteView bk_whenTapped:^{
        @strongify(self)
        !self.showMethodOfpaymentView ? : self.showMethodOfpaymentView();
    }];
}

-(void)bindViewModel:(id)viewModel{
    LCBaoMingModel *model = viewModel;
    _titleLB.text = model.title;
    _placHoderLB.text = model.canShu ? model.canShu : model.placeholderTitle;
    if (model.canShu) {
        _placHoderLB.textColor = [KDColor getC2Color];
    }
}
@end


@interface LCBaoMingFooterView ()
<
UITextViewDelegate
>
@end

@implementation LCBaoMingFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
//        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

-(void)setupViews{
    UILabel *remarkLB = [UILabel new];
    remarkLB.text = @"备注";
    remarkLB.textColor = [KDColor getC2Color];
    remarkLB.font = [[KDFont sharedKDFont]getF30Font];
    [self addSubview:remarkLB];
    [remarkLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(15);
    }];
    
    UILabel *xuanTian = [UILabel new];
    xuanTian.text = @":(选填)";
    xuanTian.textColor = [KDColor getX0Color];
    xuanTian.font = [[KDFont sharedKDFont]getF30Font];
    [self addSubview:xuanTian];
    [xuanTian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(remarkLB.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(15);
    }];
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [KDColor getC13Color];//
    shadowView.layer.cornerRadius = 5;
    [self addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(remarkLB.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(150);
    }];
    
    self.textView = [UITextView new];
    self.textView.delegate = self;
    [shadowView addSubview:_textView];
    _textView.backgroundColor = [KDColor getC12Color];
    _textView.textColor = [KDColor getX0Color];
    _textView.font = [[KDFont sharedKDFont]getF30Font];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5));
    }];
    
    self.similarCell = [LCSimilarBaoMingLBCell new];
    [self addSubview:_similarCell];
    [_similarCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(shadowView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(145/2);
    }];
    
}

-(void)hidenZhiFuView:(BOOL)isbool{
    self.similarCell.hidden = isbool;
}

-(void)setShowMethodOfpaymentView:(void (^)())showMethodOfpaymentView{
    _showMethodOfpaymentView = showMethodOfpaymentView;
    self.similarCell.showMethodOfpaymentView = _showMethodOfpaymentView;
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    !self.TextViewDidEndDding ? : self.TextViewDidEndDding(textView.text);
}
@end
