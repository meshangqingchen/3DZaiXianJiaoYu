//
//  CollectionReusableBannerHeaderView.h
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "BaseView.h"

@interface LCSignUpView :BaseView
@property(nonatomic,strong) UIImageView *imageView1;
@property(nonatomic,strong) UIImageView *imageView2;
@property(nonatomic,strong) UIImageView *imageView3;
@property(nonatomic,strong) UILabel *lable1;
@property(nonatomic,strong) UILabel *lable2;
@property(nonatomic,strong) UILabel *lable3;
@end


@interface LCCollectionReusableBannerHeaderView : UICollectionReusableView
@property(nonatomic,strong) SDCycleScrollView *bannerView;
@property(nonatomic,strong) UILabel *titleLB;
@property(nonatomic,strong) UIButton *moreBT;
@property(nonatomic,strong) UIImageView *backImageView;
@property(nonatomic,strong) LCSignUpView *signUpView;
@property(nonatomic,strong) NSArray *bannerDataArr;
@property(nonatomic,strong) NSArray *signUpDataArr;


-(void)setupViews;
-(void)bindViewModel:(id)viewModel andBannerViewModel:(id)bannerVM andsignUpViewModel:(id)signUpVM andIndexPath:(NSIndexPath *)indexPath;
@end
