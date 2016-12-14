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
    [self addSubview:_starImgV];
    [_starImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(12);
        make.height.mas_equalTo(img.size.height);
        make.width.mas_equalTo(img.size.width);
    }];
    
    self.numCollectLB = [UILabel new];
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
        make.left.mas_equalTo(-15);
        make.top.mas_equalTo(75);
        make.height.mas_equalTo(0.5);
    }];

    self.jsJJImageV = [UIImageView new];
    UIImage *jsImg = [UIImage imageNamed:@"jianshijianjie"];
    [self addSubview:_jsJJImageV];
    [_jsJJImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(15);
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
        lable.textColor = [KDColor getC2Color];
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
                make.right.mas_equalTo(15);
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
}

@end
