//
//  LCVideoDetailTabBar.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCVideoDetailTabBar.h"
#import "UIButton+ImageTitleStyle.h"

#import "LCVideoDetailViewViewModel.h"

@interface LCVideoDetailTabBar ()
@property(nonatomic,strong) LCVideoDetailViewViewModel *videoDetailViewViewModel;
@end

@implementation LCVideoDetailTabBar

-(void)setupViews{
    
    @weakify(self)
    CGFloat w = SCREEN_WIDTH/5;
    self.downloadBT = [UIButton new];
    [_downloadBT setImage:[UIImage imageNamed:@"xiazai"] forState:0];
    [_downloadBT setTitleColor:[KDColor getC3Color] forState:0];
    _downloadBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_downloadBT setTitle:@"下载" forState:0];
    [self addSubview:_downloadBT];
    [_downloadBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(w);
    }];
    [_downloadBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_downloadBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.videoDetailViewViewModel.downLoadVideo ? : self.videoDetailViewViewModel.downLoadVideo(@"videoID");
    }];
    
    self.shareBT = [UIButton new];
    [_shareBT setImage:[UIImage imageNamed:@"fenxiang"] forState:0];
    [_shareBT setTitleColor:[KDColor getC3Color] forState:0];
    _shareBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_shareBT setTitle:@"分享" forState:0];
    [self addSubview:_shareBT];
    [_shareBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_downloadBT.mas_right).mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(w);
    }];
    [_shareBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_shareBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.videoDetailViewViewModel.shareVideo ? : self.videoDetailViewViewModel.shareVideo(@"videoID");
    }];
    
    
    self.collectBT = [UIButton new];
    [_collectBT setImage:[UIImage imageNamed:@"normal_daxingxing"] forState:0];
    [_collectBT setImage:[UIImage imageNamed:@"select_daxingxing"] forState:UIControlStateSelected];
    [_collectBT setTitleColor:[KDColor getC3Color] forState:0];
    _collectBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_collectBT setTitle:@"收藏" forState:0];
    [self addSubview:_collectBT];
    [_collectBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_shareBT.mas_right).mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(w);
    }];
    [_collectBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_collectBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.videoDetailViewViewModel.collectVideo ? : self.videoDetailViewViewModel.collectVideo(@"videoID",sender);
    }];
    
    
    self.commentBT = [UIButton new];
    [_commentBT setImage:[UIImage imageNamed:@"pinglun"] forState:0];
    [_commentBT setTitleColor:[KDColor getC3Color] forState:0];
    _commentBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_commentBT setTitle:@"评论" forState:0];
    [self addSubview:_commentBT];
    [_commentBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_collectBT.mas_right).mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(w);
    }];
    [_commentBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_commentBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.videoDetailViewViewModel.pinglunVideo ? : self.videoDetailViewViewModel.pinglunVideo(@"videoID");
    }];
    
    
    self.counselBT = [UIButton new];
    [_counselBT setImage:[UIImage imageNamed:@"zixun"] forState:0];
    [_counselBT setTitleColor:[KDColor getC3Color] forState:0];
    _counselBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_counselBT setTitle:@"咨询" forState:0];
    [self addSubview:_counselBT];
    [_counselBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_commentBT.mas_right).mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(w);
    }];
    [_counselBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_counselBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.videoDetailViewViewModel.consultVideo ? : self.videoDetailViewViewModel.consultVideo(@"videoID");
    }];
}

-(void)bindViewModel:(id)viewModel{
    self.videoDetailViewViewModel = viewModel;
}
@end
