//
//  CollectionReusableBannerHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCollectionReusableBannerHeaderView.h"
#import "UIButton+ImageTitleStyle.h"

@interface LCCollectionReusableBannerHeaderView ()
<SDCycleScrollViewDelegate>

@end

@implementation LCCollectionReusableBannerHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    
    self.bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*300/750) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    
    _bannerView.currentPageDotColor = [UIColor whiteColor];
    _bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _bannerView.localizationImageNamesGroup = @[@"h1.jpg",
                                                @"h2.jpg",
                                                @"h3.jpg",
                                                @"h4.jpg",
                                                @"h7" // 本地图片请填写全名
                                                ];
    _bannerView.titlesGroup = @[@"新建交流QQ群：185534916 ",
                                @"感谢您的支持，如果下载的",
                                @"如果代码在使用过程中出现问题",
                                @"您可以发邮件到gsdios@126.com"
                                ];
    
    [self addSubview:_bannerView];
    
    self.backImageView = [UIImageView new];
    _backImageView.image = [UIImage imageNamed:@"head_backImage"];
    [self addSubview:self.backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(39);
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.text = @"免费好课";
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF32Font];
    [self.backImageView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];
    
    self.moreBT = [UIButton new];
    [_moreBT setImage:[UIImage imageNamed:@"danjiantou"] forState:0];
    [_moreBT setTitle:@"更多" forState:0];
    _moreBT.titleLabel.font = [[KDFont sharedKDFont]getF26Font];
    [_moreBT setTitleColor:[KDColor getC4Color] forState:0];
    [self.backImageView addSubview:_moreBT];
    [_moreBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(38);
    }];
    [_moreBT setButtonImageTitleStyle:ButtonImageTitleStyleRight padding:5];

    self.centerImageView = [UIImageView new];
    _centerImageView.image = [UIImage imageNamed:@"zhuantituijian"];
    [self.backImageView addSubview:_centerImageView];
    CGSize imageSize = _centerImageView.image.size;
    [_centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(imageSize.width);
        make.height.mas_equalTo(imageSize.height);
    }];


}

-(void)bindViewModel:(id)viewModel{

}
@end
