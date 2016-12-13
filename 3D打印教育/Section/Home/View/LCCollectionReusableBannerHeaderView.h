//
//  CollectionReusableBannerHeaderView.h
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface LCCollectionReusableBannerHeaderView : UICollectionReusableView
@property(nonatomic,strong) UILabel *titleLB;
@property(nonatomic,strong) UIButton *moreBT;
@property(nonatomic,strong) UIImageView *centerImageView;
@property(nonatomic,strong) UIImageView *backImageView;

@property(nonatomic,strong) SDCycleScrollView *bannerView;
-(void)setupViews;
-(void)bindViewModel:(id)viewModel;
@end
