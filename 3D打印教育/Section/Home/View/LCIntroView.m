//
//  LCIntroView.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCIntroView.h"
#import "UIButton+ImageTitleStyle.h"
#import "LCIntroViewViewModel.h"
#import "LCAboutYYWebImage.h"

@interface LCIntroView ()<WKNavigationDelegate>

@end

@implementation LCIntroView

-(void)setupViews{
    self.starImgV  = [UIImageView new];
    UIImage *img = [UIImage imageNamed:@"select_xiaoxingxing"];
    _starImgV.image = img;
    
    
    [self addSubview:_starImgV];
    [_starImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(12);
        make.height.mas_equalTo(img.size.height);
        make.width.mas_equalTo(img.size.width);
    }];
    
    self.numCollectLB = [UILabel new];
    [self addSubview:_numCollectLB];
    _numCollectLB.textColor = [KDColor getC3Color];
    _numCollectLB.font = [[KDFont sharedKDFont]getF24Font];
    _numCollectLB.text = @"2222人收藏";
    [_numCollectLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_starImgV.mas_right).mas_offset(5);
        make.bottom.top.mas_equalTo(_starImgV);
        make.right.mas_equalTo(0);
    }];
    
    UIView *topLV = [UIView new];
    topLV.backgroundColor = [KDColor getC2Color];
    [self addSubview:topLV];
    [topLV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(75);
        make.height.mas_equalTo(0.5);
    }];

    self.jsJJImageV = [UIImageView new];
    UIImage *jsImg = [UIImage imageNamed:@"jianshijianjie"];
    _jsJJImageV.image = jsImg;
    [self addSubview:_jsJJImageV];
    [_jsJJImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(topLV.mas_top).mas_offset(-10);
        make.width.mas_equalTo(jsImg.size.width);
        make.height.mas_equalTo(jsImg.size.height);
    }];
    
    self.headerImageV = [UIImageView new];
    [self addSubview:_headerImageV];
    [_headerImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topLV.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(55);
    }];
}

-(void)bindViewModel:(id)viewModel{
    
    LCIntroViewViewModel *IntroViewViewModel = viewModel;
    
//    @property(nonatomic,strong) UIImageView *starImgV;
//    @property(nonatomic,strong) UILabel *numCollectLB;
//    @property(nonatomic,strong) UIImageView *jsJJImageV;
//    @property(nonatomic,strong) UIImageView *headerImageV;
//    @property(nonatomic,strong) UIImageView *cJJImageV;
//    
//    @property(nonatomic,strong) UILabel *couresNLB;
//    @property(nonatomic,strong) UILabel *courseNameLB;
//    @property(nonatomic,strong) UILabel *courseDLB;
//    @property(nonatomic,strong) WKWebView *webView;

    self.numCollectLB.text = IntroViewViewModel.favCount;
//    [self.headerImageV ]
    [self.headerImageV setImageWithURL:IntroViewViewModel.teacherHeaderURL
                            placeholder:[UIImage imageNamed:@"noLog_Headimage"]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager2]
                               progress:nil
                              transform:nil
                            completion:nil];
    
//    @property(nonatomic,strong) NSString *favCount;
//    @property(nonatomic,strong) NSURL *teacherHeaderURL;
//    @property(nonatomic,strong) NSArray *teacherShaortDiscriptions;
//    @property(nonatomic,strong) NSString *courseNamel;
//    @property(nonatomic,strong) NSString *courseDisCription;
    
    UILabel *lastLB = nil;
//    NSArray *testArr  = @[@"🇨🇳3D打印技术产业联盟创始人兼董事长",
//                          @"🇨🇳3D打印技术产业联盟创始人兼董事长",
//                          @"🇨🇳3D打印技术产业联盟创始人兼董事长",
//                          @"🇨🇳3D打印技术产业联盟创始人兼董事长"];
    NSArray *testArr = IntroViewViewModel.teacherShaortDiscriptions;
    for (int i=0; i<testArr.count; i++) {
        UILabel *lable = [UILabel new];
        lastLB.numberOfLines = 1;
        lastLB.textAlignment = NSTextAlignmentLeft;
        lable.textColor = [KDColor getC3Color];
        lable.font = [[KDFont sharedKDFont]getF26Font];
        lable.text = testArr[i];
        [self addSubview:lable];
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"yellowCircle"];
        [self addSubview:imageView];
        if (i==0) {
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(64);
                make.top.mas_equalTo(_headerImageV.mas_bottom).mas_offset(20);
                make.right.mas_equalTo(-15);
            }];
            lastLB = lable;
        }else{
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(lastLB);
                make.top.mas_equalTo(lastLB.mas_bottom).mas_offset(12);
            }];
            lastLB = lable;
        }
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(lable);
            make.right.mas_equalTo(lable.mas_left).mas_offset(-10);
            make.width.height.mas_equalTo(7);
        }];
    }
    
    self.cJJImageV = [UIImageView new];
    UIImage *cimg = [UIImage imageNamed:@"kechengxiangqing"];
    _cJJImageV.image = cimg;
    [self addSubview:_cJJImageV];
    [_cJJImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(lastLB.mas_bottom).mas_offset(27);
        make.width.mas_equalTo(cimg.size.width);
        make.height.mas_equalTo(cimg.size.height);
    }];
    
    UIView *bottomLV = [UIView new];
    bottomLV.backgroundColor = [KDColor getC2Color];
    [self addSubview:bottomLV];
    [bottomLV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(_cJJImageV.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(0.5);
    }];
    
    self.couresNLB = [UILabel new];
    _couresNLB.text = @"课程名称";
    _couresNLB.font = [[KDFont sharedKDFont]getF30Font];
    _couresNLB.textColor = [KDColor getC2Color];
    [self addSubview:_couresNLB];
    [_couresNLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(54);
        make.right.mas_equalTo(-54);
        make.top.mas_equalTo(bottomLV.mas_bottom).mas_offset(27);
    }];
    
    self.courseNameLB = [UILabel new];
    _courseNameLB.textColor = [KDColor getC3Color];
    _courseNameLB.font = [[KDFont sharedKDFont]getF26Font];
    _courseNameLB.textAlignment = NSTextAlignmentLeft;
    _courseNameLB.numberOfLines = 0;
    _courseNameLB.text = IntroViewViewModel.courseNamel;
    [self addSubview:_courseNameLB];
    [_courseNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(54);
        make.right.mas_equalTo(-54);
        make.top.mas_equalTo(_couresNLB.mas_bottom).mas_equalTo(20);
    }];
    
    self.courseDLB = [UILabel new];
    _courseDLB.text = @"课程介绍";
    _courseDLB.font = [[KDFont sharedKDFont]getF30Font];
    _courseDLB.textColor = [KDColor getC2Color];
    [self addSubview:_courseDLB];
    [_courseDLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(54);
        make.top.mas_equalTo(_courseNameLB.mas_bottom).mas_equalTo(20);
    }];
    
    self.webView = [WKWebView new];
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.navigationDelegate = self;
    [self addSubview:self.webView];
    
    [self.webView loadHTMLString:IntroViewViewModel.courseDisCription baseURL:nil];

}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    @weakify(self)
    [webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        @strongify(self)
        [result doubleValue];
        
//        self.webView.height =  [result doubleValue];
//        self.courseIntroductionCellModel.callBackCell_H([result doubleValue]);
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(54);
            make.right.mas_equalTo(-54);
            make.top.mas_equalTo(self.courseDLB.mas_bottom).mas_offset(20);
            make.height.mas_equalTo([result doubleValue]);
            make.bottom.mas_equalTo(-27);
        }];
    }];
}


@end
