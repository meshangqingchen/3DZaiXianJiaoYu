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
#import "LCAboutYYWebImage.h"
@interface LCVideoDetailEvaluateCell ()
//@property(nonatomic,strong) UIView *backView;
//@property(nonatomic,strong) LCEvaluateCellViewModel *evaluateCellViewModel;
@end

@implementation LCVideoDetailEvaluateCell
-(void)setupViews{
    self.headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
    self.headerImgView.layer.cornerRadius = 20.0;
    self.headerImgView.layer.backgroundColor = [KDColor getC26Color].CGColor;
    self.headerImgView.userInteractionEnabled = YES;
//    [_headerImgView bk_whenTapped:^{
//        !self.evaluateCellViewModel.headerImageViewClick ? : self.evaluateCellViewModel.headerImageViewClick(@"userID");
//    }];
    [self.contentView addSubview:_headerImgView];
    
    self.nameLB = [UILabel new];
    [self.contentView addSubview:_nameLB];
    _nameLB.textColor = [KDColor getC2Color];
    _nameLB.font = [[KDFont sharedKDFont]getF28Font];
    _nameLB.left = _headerImgView.right+15;
    _nameLB.top = 21;
    _nameLB.width = 150;
    _nameLB.height = 15;
   
    
    self.timeLB = [UILabel new];
    [self.contentView addSubview:_timeLB];
    _timeLB.text = @"12-13 11:49";
    _timeLB.font = [[KDFont sharedKDFont]getF28Font];
    _timeLB.textColor = [KDColor getX0Color];
    _timeLB.left = _nameLB.left;
    _timeLB.top = _nameLB.bottom+3;
    _timeLB.height = 15;
    _timeLB.width = 150;
    
    self.starView = [[KDFiveStarView alloc] initWithStarSelectedImgName:@"star_selected" unselectImgName:@"star_unselect" starWH:15.f starPadding:5];
    [self.contentView addSubview:_starView];
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(21);
        make.right.mas_offset(-15);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(95);
    }];
    
    self.evaYLB = [YYLabel new];
    [self.contentView addSubview:_evaYLB];
    _evaYLB.top = _timeLB.bottom+21;
    _evaYLB.left = 70;
    _evaYLB.width = SCREEN_WIDTH-70-15;
    
//    UIView *backView = [UIView new];
//    [self.contentView addSubview:backView];
//    self.backView = backView;
//    backView.backgroundColor = [KDColor getC9Color];
//    backView.left = 70;
//    backView.width = SCREEN_WIDTH-70-15;
//    
//    self.sonEvaYLB1 = [YYLabel new];
//    [backView addSubview:_sonEvaYLB1];
//    _sonEvaYLB1.top = 10;
//    _sonEvaYLB1.left = 10;
//    _sonEvaYLB1.width = SCREEN_WIDTH-70-10-10-15;
//    _sonEvaYLB1.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
//        MYLog(@"containerView = %@",containerView);
//        MYLog(@"text = %@",text);
//        MYLog(@"range %@",NSStringFromRange(range));
//        MYLog(@"rect = %@",NSStringFromCGRect(rect));
//    };
//    
//    self.sonEvaYLB2 = [YYLabel new];
//    [backView addSubview:_sonEvaYLB2];
//    _sonEvaYLB2.left = 10;
//    _sonEvaYLB2.width = SCREEN_WIDTH-70-10-10-15;
//    
//    self.sonEvaYLB3 = [YYLabel new];
//    [backView addSubview:_sonEvaYLB3];
//    _sonEvaYLB3.left = 10;
//    _sonEvaYLB3.width = SCREEN_WIDTH-70-10-10-15;
//    
//    
//    self.numHuiFu = [UIButton new];
//    [backView addSubview:_numHuiFu];
//    _numHuiFu.backgroundColor = [UIColor orangeColor];
//    _numHuiFu.left = 10;
//    _numHuiFu.width = 300;
//    _numHuiFu.height = 16;
//    
//    [_numHuiFu setTitleColor:[KDColor getC8Color] forState:0];
//    _numHuiFu.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
//    _numHuiFu.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
}


-(void)bindViewModel:(id)viewModel{
    LCEvaluateCellViewModel *evaluateCellViewModel = viewModel;
    _evaYLB.height = evaluateCellViewModel.evaluate_H;
    
//    _backView.top = _evaYLB.bottom+15;
//    _backView.height = evaluateCellViewModel.sonAllEva_H;
    
//    _numHuiFu.bottom = _backView.bottom;
//    _numHuiFu.top = _backView.height-26;
//    
//    if (evaluateCellViewModel.sonEvaluateArr.count > 0) {
//        self.backView.hidden = NO;
//        NSString * title = [NSString stringWithFormat:@"共%lu多少条回复 >",(unsigned long)evaluateCellViewModel.sonEvaluateArr.count];
//        [_numHuiFu setTitle:title forState:0];
//        for (int i=0; i<evaluateCellViewModel.sonEvaluateArr.count; i++) {
//            LCSonEvaluateCellViewModel *sonEvaViewModel = evaluateCellViewModel.sonEvaluateArr[i];
//            if (i==0) {
//                _sonEvaYLB1.height = sonEvaViewModel.sonEva_H;
//                _sonEvaYLB1.textLayout = sonEvaViewModel.textLayout;
//                _sonEvaYLB2.hidden = YES;
//                _sonEvaYLB3.hidden = YES;
//            }
//            if (i==1) {
//                _sonEvaYLB2.top = _sonEvaYLB1.bottom+5;
//                _sonEvaYLB2.height = sonEvaViewModel.sonEva_H;
//                _sonEvaYLB2.textLayout = sonEvaViewModel.textLayout;
//                _sonEvaYLB2.hidden = NO;
//            }
//            if (i==2) {
//                _sonEvaYLB3.top = _sonEvaYLB2.bottom+5;
//                _sonEvaYLB3.height = sonEvaViewModel.sonEva_H;
//                _sonEvaYLB3.textLayout = sonEvaViewModel.textLayout;
//                _sonEvaYLB3.hidden = NO;
//                break;
//            }
//        }
//    }else{
//        self.backView.hidden = YES;
//    }

    
    self.nameLB.text = evaluateCellViewModel.name;
    self.evaYLB.textLayout = evaluateCellViewModel.evaTextLayout;
    self.timeLB.text = evaluateCellViewModel.creatTime;
    [self.starView setStarDisabledAndCount:evaluateCellViewModel.grade];
    [self.headerImgView setImageWithURL:evaluateCellViewModel.userHeaderURL
                            placeholder:[UIImage imageNamed:@"noLog_Headimage"]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager1]
                               progress:nil
                              transform:nil
                             completion:nil];
    
}

@end













