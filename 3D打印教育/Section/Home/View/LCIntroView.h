//
//  LCIntroView.h
//  3D打印教育
//
//  Created by 3D on 16/12/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseView.h"
#import <WebKit/WebKit.h>
//collectBT
@interface LCIntroView : BaseView
@property(nonatomic,strong) UIImageView *starImgV;
@property(nonatomic,strong) UILabel *numCollectLB;
@property(nonatomic,strong) UIImageView *jsJJImageV;
@property(nonatomic,strong) UIImageView *headerImageV;
@property(nonatomic,strong) UIImageView *cJJImageV;

@property(nonatomic,strong) UILabel *couresNLB;
@property(nonatomic,strong) UILabel *courseNameLB;
@property(nonatomic,strong) UILabel *courseDLB;
@property(nonatomic,strong) UIWebView *webView;
//@property(nonatomic,strong) UILabel *courseDetailLB;
@end
