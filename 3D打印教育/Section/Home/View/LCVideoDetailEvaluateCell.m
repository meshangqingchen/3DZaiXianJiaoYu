//
//  LCVideoDetailEvaluateCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/16.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailEvaluateCell.h"
#import "LCEvaluateCellViewModel.h"
#import "UIView+BlocksKit.h"
@interface LCVideoDetailEvaluateCell ()
@property(nonatomic,strong) UIView *backView;
@property(nonatomic,strong) LCEvaluateCellViewModel *evaluateCellViewModel;
@end

@implementation LCVideoDetailEvaluateCell
-(void)setupViews{
    self.headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    self.headerImgView.userInteractionEnabled = YES;
    _headerImgView.backgroundColor = [UIColor orangeColor];
    [_headerImgView bk_whenTapped:^{
        !self.evaluateCellViewModel.headerImageViewClick ? : self.evaluateCellViewModel.headerImageViewClick(@"userID");
    }];
    [self.contentView addSubview:_headerImgView];
    
    self.nameLB = [UILabel new];
    [self.contentView addSubview:_nameLB];
    _nameLB.textColor = [KDColor getC2Color];
    _nameLB.font = [[KDFont sharedKDFont]getF28Font];
    _nameLB.left = _headerImgView.right+15;
    _nameLB.top = 21;
    _nameLB.width = 200;
    _nameLB.height = 15;
    _nameLB.backgroundColor = [UIColor yellowColor];
   
    
    self.timeLB = [UILabel new];
    [self.contentView addSubview:_timeLB];
    _timeLB.backgroundColor = [UIColor blueColor];
    _timeLB.text = @"12-13 11:49";
    _timeLB.font = [[KDFont sharedKDFont]getF28Font];
    _timeLB.textColor = [KDColor getX0Color];
    _timeLB.left = _nameLB.left;
    _timeLB.top = _nameLB.bottom+3;
    _timeLB.height = 15;
    _timeLB.width = 200;
    
    self.huifuBT = [UIButton new];
    [self.contentView addSubview:_huifuBT];
    _huifuBT.backgroundColor = [UIColor orangeColor];
    _huifuBT.top = 21;
    _huifuBT.width = 30;
    _huifuBT.height = 15;
    _huifuBT.right = SCREEN_WIDTH-25;
    _huifuBT.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _huifuBT.titleLabel.font = [[KDFont sharedKDFont]getF28Font];
    [_huifuBT setTitle:@"回复" forState:0];
    [_huifuBT setTitleColor:[KDColor getX0Color] forState:0];
    @weakify(self)
    [_huifuBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        MYLog(@"回复事件");
        !self.evaluateCellViewModel.huifu ? : self.evaluateCellViewModel.huifu(@"evaID");
    }];
    
    self.evaYLB = [YYLabel new];
    [self.contentView addSubview:_evaYLB];
    _evaYLB.backgroundColor = [UIColor redColor];
    _evaYLB.top = _timeLB.bottom+21;
    _evaYLB.left = 70;
    _evaYLB.width = SCREEN_WIDTH-70-25;
    
    UIView *backView = [UIView new];
    [self.contentView addSubview:backView];
    self.backView = backView;
    backView.backgroundColor = [KDColor getC9Color];
    backView.left = 70;
    backView.width = SCREEN_WIDTH-70-15;
    
    self.sonEvaYLB1 = [YYLabel new];
    [backView addSubview:_sonEvaYLB1];
    _sonEvaYLB1.top = 10;
    _sonEvaYLB1.left = 10;
    _sonEvaYLB1.width = SCREEN_WIDTH-70-10-10-15;
    _sonEvaYLB1.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        MYLog(@"containerView = %@",containerView);
        MYLog(@"text = %@",text);
        MYLog(@"range %@",NSStringFromRange(range));
        MYLog(@"rect = %@",NSStringFromCGRect(rect));
    };
    
    self.sonEvaYLB2 = [YYLabel new];
    [backView addSubview:_sonEvaYLB2];
    _sonEvaYLB2.left = 10;
    _sonEvaYLB2.width = SCREEN_WIDTH-70-10-10-15;
    
    self.sonEvaYLB3 = [YYLabel new];
    [backView addSubview:_sonEvaYLB3];
    _sonEvaYLB3.left = 10;
    _sonEvaYLB3.width = SCREEN_WIDTH-70-10-10-15;
    
    
    self.numHuiFu = [UIButton new];
    [backView addSubview:_numHuiFu];
    _numHuiFu.backgroundColor = [UIColor orangeColor];
    _numHuiFu.left = 10;
    _numHuiFu.width = 300;
    _numHuiFu.height = 16;
    
    [_numHuiFu setTitleColor:[KDColor getC8Color] forState:0];
    _numHuiFu.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    _numHuiFu.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
}


-(void)bindViewModel:(id)viewModel{
    LCEvaluateCellViewModel *evaluateCellViewModel = viewModel;
    self.evaluateCellViewModel = evaluateCellViewModel;
    _evaYLB.height = evaluateCellViewModel.evaluate_H;
    _backView.top = _evaYLB.bottom+15;
    _backView.height = evaluateCellViewModel.sonAllEva_H;
    
    _numHuiFu.bottom = _backView.bottom;
    _numHuiFu.top = _backView.height-26;
    
    if (evaluateCellViewModel.sonEvaluateArr.count > 0) {
        self.backView.hidden = NO;
        NSString * title = [NSString stringWithFormat:@"共%lu多少条回复 >",(unsigned long)evaluateCellViewModel.sonEvaluateArr.count];
        [_numHuiFu setTitle:title forState:0];
        for (int i=0; i<evaluateCellViewModel.sonEvaluateArr.count; i++) {
            LCSonEvaluateCellViewModel *sonEvaViewModel = evaluateCellViewModel.sonEvaluateArr[i];
            if (i==0) {
                _sonEvaYLB1.height = sonEvaViewModel.sonEva_H;
                _sonEvaYLB1.textLayout = sonEvaViewModel.textLayout;
                _sonEvaYLB2.hidden = YES;
                _sonEvaYLB3.hidden = YES;
            }
            if (i==1) {
                _sonEvaYLB2.top = _sonEvaYLB1.bottom+5;
                _sonEvaYLB2.height = sonEvaViewModel.sonEva_H;
                _sonEvaYLB2.textLayout = sonEvaViewModel.textLayout;
                _sonEvaYLB2.hidden = NO;
            }
            if (i==2) {
                _sonEvaYLB3.top = _sonEvaYLB2.bottom+5;
                _sonEvaYLB3.height = sonEvaViewModel.sonEva_H;
                _sonEvaYLB3.textLayout = sonEvaViewModel.textLayout;
                _sonEvaYLB3.hidden = NO;
                break;
            }
        }
    }else{
        self.backView.hidden = YES;
    }

    self.nameLB.text = evaluateCellViewModel.name;
    self.evaYLB.textLayout = evaluateCellViewModel.evaTextLayout;
}

@end













