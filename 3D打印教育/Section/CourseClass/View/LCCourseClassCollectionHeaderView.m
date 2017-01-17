//
//  LCCourseClassCollectionHeaderView.m
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCCourseClassCollectionHeaderView.h"
#import "LCCourseClassFCellViewModel.h"
#import "UIView+BlocksKit.h"

@interface LCCourseClassCollectionHeaderView ()
@property(nonatomic,strong) LCCourseClassFCellViewModel *fcellVM;
@end

@implementation LCCourseClassCollectionHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.backgroundColor = [KDColor getC19Color];
    UIView *backView = [UIView new];
    backView.backgroundColor = [KDColor getC0Color];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(44);
    }];
    @weakify(self)
    [backView bk_whenTapped:^{
        @strongify(self)
        !self.fcellVM.clickHeadView ? : self.fcellVM.clickHeadView(self.fcellVM.iid,self.fcellVM.leftTitle);
       
    }];
    
    self.leftImageView = [UIImageView new];
    self.leftImageView.userInteractionEnabled = YES;
    [backView addSubview:_leftImageView];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.mas_equalTo(15);
        make.centerY.mas_offset(0);
    }];
    self.leftLB = [UILabel new];
    _leftLB.textColor = [KDColor getC2Color];
    _leftLB.font = [[KDFont sharedKDFont] getF30Font];
    [backView addSubview:_leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(10);
        make.centerY.mas_offset(0);
    }];
    
    UIImageView *rightImageView = [UIImageView new];
    UIImage *jiantouImage = [UIImage imageNamed:@"danjiantou"];
    [backView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.right.mas_offset(15);
        make.size.mas_equalTo(jiantouImage.size);
    }];
    
}
-(void)bindViewModel:(id)viewModel andIndexpath:(NSIndexPath *)indexPath{
    LCCourseClassFCellViewModel *fcellVM = viewModel;
    self.fcellVM = fcellVM;
    [self.leftImageView setImageURL:fcellVM.imageURL];
    self.leftLB.text = fcellVM.leftTitle;
}

@end
