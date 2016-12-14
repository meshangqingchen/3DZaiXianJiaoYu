//
//  LCIntroView.m
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCIntroView.h"
#import "UIButton+ImageTitleStyle.h"
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
    _headerImageV.backgroundColor = [UIColor orangeColor];
    [self addSubview:_headerImageV];
    [_headerImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topLV.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(0);
        make.width.height.mas_equalTo(55);
    }];
}

-(void)bindViewModel:(id)viewModel{
    
    UILabel *lastLB = nil;
    
    NSArray *testArr  = @[@"🇨🇳3D打印技术产业联盟创始人兼董事长",
                          @"🇨🇳3D打印技术产业联盟创始人兼董事长",
                          @"🇨🇳3D打印技术产业联盟创始人兼董事长",
                          @"🇨🇳3D打印技术产业联盟创始人兼董事长"];
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
    _courseNameLB.text = @"3D打印技术的概况与前景";
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
    
    self.courseDetailLB = [UILabel new];
    _courseDetailLB.textColor = [KDColor getC3Color];
    _courseDetailLB.font = [[KDFont sharedKDFont]getF26Font];
    _courseDetailLB.numberOfLines = 0;
    NSString *testStr = @"这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据这是一个很长很长的数据";
    NSMutableAttributedString *LBAtt  =[[NSMutableAttributedString alloc]initWithString:testStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0];
    [LBAtt addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, testStr.length)];
    _courseDetailLB.attributedText = LBAtt.copy;
    [self addSubview:_courseDetailLB];
    [_courseDetailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(54);
        make.right.mas_equalTo(-54);
        make.top.mas_equalTo(_courseDLB.mas_bottom).mas_offset(20);
        make.bottom.mas_equalTo(-27);
    }];
}

@end
