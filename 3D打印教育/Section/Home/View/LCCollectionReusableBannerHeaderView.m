//
//  CollectionReusableBannerHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCollectionReusableBannerHeaderView.h"
#import "UIButton+ImageTitleStyle.h"
#import "LCHomeCollectionSectionModel.h"

#import "LCHomeCollectionBananaViewModel.h"


@implementation LCSignUpView

-(void)setupViews{

    CGFloat gap_W = (SCREEN_WIDTH- 60*3 - 85)/2;
    CGFloat backView_W = 60;
    
    UIView *backView1 = [UIView new];
    backView1.backgroundColor = [UIColor grayColor];
    [self addSubview:backView1];
    [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(85/2);
        make.top.bottom.mas_offset(0);
        make.width.mas_equalTo(backView_W);
    }];
    self.imageView1 = [UIImageView new];
    _imageView1.backgroundColor = [UIColor orangeColor];
    [backView1 addSubview:_imageView1];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.mas_equalTo(0);
    }];
    self.lable1 = [UILabel new];
    _lable1.textColor = [KDColor getC2Color];
    _lable1.font = [[KDFont sharedKDFont]getF24Font];
    _lable1.text = @"基础课程";
    [backView1 addSubview:_lable1];
    [_lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView1.mas_bottom).mas_offset(4);
        make.centerX.mas_offset(0);
    }];
    
    
    UIView *backView2 = [UIView new];
    backView2.backgroundColor = [UIColor grayColor];
    [self addSubview:backView2];
    [backView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView1.mas_right).mas_equalTo(gap_W);
        make.top.bottom.mas_offset(0);
        make.width.mas_equalTo(backView_W);
    }];
    self.imageView2 = [UIImageView new];
    _imageView2.backgroundColor = [UIColor orangeColor];
    [backView2 addSubview:_imageView2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.mas_equalTo(0);
    }];
    self.lable2 = [UILabel new];
    _lable2.textColor = [KDColor getC2Color];
    _lable2.font = [[KDFont sharedKDFont]getF24Font];
    _lable2.text = @"基础课程";
    [backView2 addSubview:_lable2];
    [_lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView1.mas_bottom).mas_offset(4);
        make.centerX.mas_offset(0);
    }];

    
    
    UIView *backView3 = [UIView new];
    backView3.backgroundColor = [UIColor grayColor];
    [self addSubview:backView3];
    [backView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView2.mas_right).mas_equalTo(gap_W);
        make.top.bottom.mas_offset(0);
        make.width.mas_equalTo(backView_W);

    }];
    self.imageView3 = [UIImageView new];
    _imageView3.backgroundColor = [UIColor orangeColor];
    [backView3 addSubview:_imageView3];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.mas_equalTo(0);
    }];
    self.lable3 = [UILabel new];
    _lable3.textColor = [KDColor getC2Color];
    _lable3.font = [[KDFont sharedKDFont]getF24Font];
    _lable3.text = @"基础课程";
    [backView3 addSubview:_lable3];
    [_lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView1.mas_bottom).mas_offset(4);
        make.centerX.mas_offset(0);
    }];

}

-(void)bindViewModel:(id)viewModel{

}

@end



@interface LCCollectionReusableBannerHeaderView ()
<SDCycleScrollViewDelegate>
@property(nonatomic,strong) NSMutableArray *imageURLArr;
@property(nonatomic,strong) NSMutableArray *titleArr;
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
    
    self.signUpView = [LCSignUpView new];
    [self addSubview:_signUpView];
    _signUpView.backgroundColor = [UIColor yellowColor];
    [_signUpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(self.bannerView.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(95);
    }];
    
    
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

//    self.centerLB = [UILabel new];
//    _centerLB.text = @"免费好课";
//    _centerLB.textColor = [KDColor getC2Color];
//    _centerLB.font = [[KDFont sharedKDFont]getF32Font];
//    [self.backImageView addSubview:_centerLB];
//    [_centerLB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//    }];
    
    
}

-(void)bindViewModel:(id)viewModel andBannerViewModel:(id)bannerVM andsignUpViewModel:(id)signUpVM{
    
    LCHomeCollectionSectionModel *sectionVM = viewModel;
    self.titleLB.text = sectionVM.sectionTitle;
    self.bannerDataArr = bannerVM;
    self.signUpDataArr = signUpVM;
}


-(void)setSignUpDataArr:(NSArray *)signUpDataArr{
    if (_signUpDataArr == signUpDataArr) return;
    _signUpDataArr = signUpDataArr;
    [self.signUpView bindViewModel:_signUpDataArr];
    
}

-(void)setBannerDataArr:(NSArray *)bannerDataArr{
    if (_bannerDataArr == bannerDataArr) return;
    _bannerDataArr = bannerDataArr;
    
    for (int i=0; i<self.bannerDataArr.count; i++) {
        LCHomeCollectionBananaViewModel *bannerVM = self.bannerDataArr[i];
        [self.imageURLArr addObject:bannerVM.imageURL];
        [self.titleArr addObject:bannerVM.name];
    }
    self.bannerView.imageURLStringsGroup = self.imageURLArr.copy;
    self.bannerView.titlesGroup = self.titleArr.copy;
}

-(NSMutableArray *)imageURLArr{
    if (!_imageURLArr) {
        _imageURLArr = [NSMutableArray array];
    }
    return _imageURLArr;
}

-(NSMutableArray *)titleArr{
    if (!_titleArr) {
        _titleArr = [NSMutableArray array];
    }
    return _titleArr;
}


-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    MYLog(@"===== %ld",index);
    LCHomeCollectionBananaViewModel *bannerVM = self.bannerDataArr[index];
//    !bannerVM.clickBanner ? : bannerVM.clickBanner(@"");
}
@end
