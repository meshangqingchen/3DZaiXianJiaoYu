//
//  LCPersonalCenterHeaderView.m
//  3D打印教育
//
//  Created by 3D on 17/1/5.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPersonalCenterHeaderView.h"
#import "UIButton+ImageTitleStyle.h"

#import "LCPersonalCenterHeaderViewModel.h"
#import "UIView+BlocksKit.h"
#import "LCAboutYYWebImage.h"
@interface LCPersonalCenterHeaderView ()
@property(nonatomic,strong) LCPersonalCenterHeaderViewModel *headerVM;
@end

@implementation LCPersonalCenterHeaderView
-(void)setupViews{
    
    self.backgroundColor = [KDColor getC17Color];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
    backView.backgroundColor = [KDColor getC17Color];
    @weakify(self)
    [backView bk_whenTapped:^{
        @strongify(self)
        if (!self.headerVM) return ;
        if (self.headerVM.ifNeedLog) {
            //需要登录 跳转到登录界面
            !self.headerVM.goToLoginVC ? : self.headerVM.goToLoginVC();
        }else{
            //跳转到  其他几面
            !self.headerVM.pushToEditDataVM ? : self.headerVM.pushToEditDataVM(@"viewModel");
        }
    }];
    [self addSubview:backView];
    
    
    self.headerImageView = [UIImageView new];
    self.headerImageView.image = [UIImage imageNamed:@"noLog_HeadImage"];
    [backView addSubview:_headerImageView];
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.width.height.mas_equalTo(70);
        make.centerY.mas_equalTo(0);
    }];
    
    self.topTitleLB = [UILabel new];
    _topTitleLB.textColor = [KDColor getC0Color];
    _topTitleLB.font = [[KDFont sharedKDFont]getF38Font];
    //_topTitleLB.text = @"";
    [backView addSubview:_topTitleLB];
    [_topTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageView.mas_right).mas_offset(15);
        make.top.mas_offset(65);
    }];
    
    self.signatureLB = [UILabel new];
    _signatureLB.textColor = [KDColor getC0Color];
    _signatureLB.font = [[KDFont sharedKDFont]getF26Font];
    //_signatureLB.text = @"脚步匆匆只因我有梦想";
    [backView addSubview:_signatureLB];
    [_signatureLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageView.mas_right).mas_offset(15);
        make.bottom.mas_offset(-65);
    }];

    UIImageView *jiantou = [UIImageView new];
    UIImage *image = [UIImage imageNamed:@"baisejiantou"];
    jiantou.image = image;
    [backView addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(image.size);
    }];
    
//    NSArray *imageName = @[@"huancun",@"lishi",@"shoucang",@"xiaoxitixing"];
//    NSArray *titleArr = @[@"缓存",@"历史",@"收藏",@"消息"];
//    CGFloat bt_W = SCREEN_WIDTH/titleArr.count;
//    UIButton *lastBT = nil;
//    for (int i=0; i<titleArr.count; i++) {
//        UIButton *bt = [UIButton new];
//        [bt setImage:[UIImage imageNamed:imageName[i]] forState:0];
//        [bt setTitle:titleArr[i] forState:0];
//        [bt setTitleColor:[KDColor getC3Color] forState:0];
//        bt.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
//        bt.backgroundColor = [KDColor getC0Color];
//        [self addSubview:bt];
//        if (i==0) {
//            bt.backgroundColor = [UIColor orangeColor];
//            [bt mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(backView.mas_bottom).mas_offset(0);
//                make.left.bottom.mas_offset(0);
//                make.width.mas_equalTo(bt_W);
//            }];
//            lastBT = bt;
//        }else{
//            [bt mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(backView.mas_bottom).mas_offset(0);
//                make.left.mas_equalTo(lastBT.mas_right).mas_offset(0);
//                make.bottom.mas_offset(0);
//                make.width.mas_equalTo(bt_W);
//            }];
//            lastBT = bt;
//        }
//        [bt setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:5];
//    }
}

-(void)bindViewModel:(id)viewModel{
    self.headerVM = viewModel;
    self.topTitleLB.text = _headerVM.topTitle;
    self.signatureLB.text = _headerVM.signature;
    [self.headerImageView setImageWithURL:_headerVM.headerImageURL
                            placeholder:[UIImage imageNamed:@"noLog_HeadImage"]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager1]
                               progress:nil
                              transform:nil
                             completion:nil];
}

@end
