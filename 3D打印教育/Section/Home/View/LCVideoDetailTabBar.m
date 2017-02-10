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
#import "NSObject+Common.h"

@interface LCVideoDetailTabBar ()
@property(nonatomic,strong) LCVideoDetailViewViewModel *videoDetailViewViewModel;
@end

@implementation LCVideoDetailTabBar

-(void)setupViews{
    
    @weakify(self)
    CGFloat w = SCREEN_WIDTH/5;
//    self.downloadBT = [UIButton new];
//    [_downloadBT setImage:[UIImage imageNamed:@"xiazai"] forState:0];
//    [_downloadBT setTitleColor:[KDColor getC3Color] forState:0];
//    _downloadBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
//    [_downloadBT setTitle:@"下载" forState:0];
//    [self addSubview:_downloadBT];
//    [_downloadBT mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(w);
//    }];
//    [_downloadBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
//    [_downloadBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
//        @strongify(self)
//        !self.videoDetailViewViewModel.downLoadVideo ? : self.videoDetailViewViewModel.downLoadVideo(@"videoID");
//    }];
    
//    self.shareBT = [UIButton new];
//    [_shareBT setImage:[UIImage imageNamed:@"fenxiang"] forState:0];
//    [_shareBT setTitleColor:[KDColor getC3Color] forState:0];
//    _shareBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
//    [_shareBT setTitle:@"分享" forState:0];
//    [self addSubview:_shareBT];
//    [_shareBT mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_downloadBT.mas_right).mas_equalTo(0);
//        make.top.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(w);
//    }];
//    [_shareBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
//    [_shareBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
//        @strongify(self)
//        !self.videoDetailViewViewModel.shareVideo ? : self.videoDetailViewViewModel.shareVideo(@"videoID");
//    }];
    
    
    self.commentBT = [UIButton new];
    [_commentBT setImage:[UIImage imageNamed:@"pinglun"] forState:0];
    [_commentBT setTitleColor:[KDColor getC3Color] forState:0];
    _commentBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_commentBT setTitle:@"评论" forState:0];
    [self addSubview:_commentBT];
    [_commentBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.bottom.mas_offset(0);
        make.width.mas_equalTo(w);
    }];
    [_commentBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_commentBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
        @strongify(self)
        //is_assess
//        if (self.videoDetailViewViewModel.isAssess == 0) {
//            [NSObject showWarning:@"请先加入该课程"];
//            return ;
//        }
        !self.videoDetailViewViewModel.pinglunVideo ? : self.videoDetailViewViewModel.pinglunVideo(self.videoDetailViewViewModel.courseID);
    }];

    
    self.collectBT = [UIButton new];
    [_collectBT setImage:[UIImage imageNamed:@"normal_daxingxing"] forState:0];
    [_collectBT setImage:[UIImage imageNamed:@"select_daxingxing"] forState:UIControlStateSelected];
    [_collectBT setTitleColor:[KDColor getC3Color] forState:0];
    _collectBT.titleLabel.font = [[KDFont sharedKDFont]getF20Font];
    [_collectBT setTitle:@"收藏" forState:0];
    [self addSubview:_collectBT];
    [_collectBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.commentBT.mas_right).mas_offset(0);
        make.top.bottom.mas_offset(0);
        make.width.mas_offset(w);
    }];
    [_collectBT setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:7];
    [_collectBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.videoDetailViewViewModel.collectVideo ? : self.videoDetailViewViewModel.collectVideo(self.videoDetailViewViewModel.courseID,sender);
    }];
    
    self.joinFreeCourseBT = [UIButton new];
    [self.joinFreeCourseBT setTitleColor:[KDColor getC0Color] forState:0];
    self.joinFreeCourseBT.titleLabel.font = [[KDFont sharedKDFont]getF30Font];
    
    [self addSubview:_joinFreeCourseBT];
    [self.joinFreeCourseBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.collectBT.mas_right).mas_offset(0);
        make.bottom.top.mas_offset(0);
        make.right.mas_offset(0);
    }];
    [self.joinFreeCourseBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        
        if (self.videoDetailViewViewModel.ifPlay) {
            return ;
        }
        
        if (self.videoDetailViewViewModel.ifFree) {
            !self.videoDetailViewViewModel.joinFreeCourse ? : self.videoDetailViewViewModel.joinFreeCourse(self.videoDetailViewViewModel.courseID);
        }else{
            //(NSString *couresID,NSString *price,NSString *urlStr,NSString *title)
            !self.videoDetailViewViewModel.creatOrder ? : self.videoDetailViewViewModel.creatOrder(self.videoDetailViewViewModel.courseID,self.videoDetailViewViewModel.price,self.videoDetailViewViewModel.imageURL,self.videoDetailViewViewModel.title);
        }
    }];
}

-(void)bindViewModel:(id)viewModel{
    self.videoDetailViewViewModel = viewModel;
    self.collectBT.selected = self.videoDetailViewViewModel.ifCollected;
    if (self.videoDetailViewViewModel.ifPlay) {
        [self.joinFreeCourseBT setTitle:@"已加入该课程" forState:0];
        self.joinFreeCourseBT.backgroundColor = [KDColor getX0Color];
    }else{
        [self.joinFreeCourseBT setTitle:@"请加入该课程" forState:0];
        self.joinFreeCourseBT.backgroundColor = [KDColor getX1Color];
    }
}
@end
