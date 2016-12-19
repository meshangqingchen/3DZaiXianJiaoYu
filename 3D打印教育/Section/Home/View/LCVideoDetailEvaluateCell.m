//
//  LCVideoDetailEvaluateCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/16.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailEvaluateCell.h"
#import "LCEvaluateCellViewModel.h"

@interface LCVideoDetailEvaluateCell ()
@property(nonatomic,strong) UIView *backView;
@end

@implementation LCVideoDetailEvaluateCell
-(void)setupViews{
    self.headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    _headerImgView.backgroundColor = [UIColor orangeColor];
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
   
    
    self.tiemLB = [UILabel new];
    [self.contentView addSubview:_tiemLB];
    _tiemLB.backgroundColor = [UIColor blueColor];
    _tiemLB.text = @"12-13 11:49";
    _tiemLB.font = [[KDFont sharedKDFont]getF28Font];
    _tiemLB.textColor = [KDColor getX0Color];
    _tiemLB.left = _nameLB.left;
    _tiemLB.top = _nameLB.bottom+3;
    _tiemLB.height = 15;
    _tiemLB.width = 200;
    
    self.evaYLB = [YYLabel new];
    [self.contentView addSubview:_evaYLB];
    _evaYLB.backgroundColor = [UIColor redColor];
    _evaYLB.top = _tiemLB.bottom+21;
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













