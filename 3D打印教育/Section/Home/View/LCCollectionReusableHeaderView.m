//
//  LCCollectionReusableHeaderView.m
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCollectionReusableHeaderView.h"
#import "UIButton+ImageTitleStyle.h"
#import "LCHomeCollectionSectionModel.h"

@interface LCCollectionReusableHeaderView()
@property(nonatomic,strong) LCHomeCollectionSectionModel *sectionVM;
@property(nonatomic,strong) NSIndexPath *indexPath;
@end

@implementation LCCollectionReusableHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.backImageView = [UIImageView new];
    _backImageView.image = [UIImage imageNamed:@"head_backImage"];
    [self addSubview:self.backImageView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.titleLB = [UILabel new];
    _titleLB.text = @"免费好课";
    _titleLB.textColor = [KDColor getC2Color];
    _titleLB.font = [[KDFont sharedKDFont]getF32Font];
    [self addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];
    
    self.moreBT = [UIButton new];
    [_moreBT setImage:[UIImage imageNamed:@"danjiantou"] forState:0];
    [_moreBT setTitle:@"更多" forState:0];
    _moreBT.titleLabel.font = [[KDFont sharedKDFont]getF26Font];
    [_moreBT setTitleColor:[KDColor getC4Color] forState:0];
    [self addSubview:_moreBT];
    [_moreBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(38);
    }];
    [_moreBT setButtonImageTitleStyle:ButtonImageTitleStyleRight padding:5];
    @weakify(self)
    [_moreBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        !self.sectionVM.moreClick ? : self.sectionVM.moreClick(self.indexPath);
    }];
}
-(void)bindViewModel:(id)viewModel andIndexpath:(NSIndexPath *)indexPath{
    LCHomeCollectionSectionModel *sectionVM = viewModel;
    self.sectionVM = sectionVM;
    self.indexPath = indexPath;
    self.titleLB.text = sectionVM.sectionTitle;
    
}


@end
