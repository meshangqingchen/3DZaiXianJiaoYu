//
//  LCTeachersCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTeachersCollectionViewCell.h"
#import "LCTeacherCollectionCellViewModel.h"
#import "UIView+BlocksKit.h"
#import "LCAboutYYWebImage.h"

//@implementation TextView
//-(void)setupViews{
//    self.backImageView = [UIImageView new];
//    [self addSubview:_backImageView];
//    _backImageView.userInteractionEnabled = YES;
//    _backImageView.image = [UIImage imageNamed:@"bacKshadow"];
//    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
//    
//    self.nameLB = [UILabel new];
//    [self addSubview:_nameLB];
//    _nameLB.textColor = [KDColor getC2Color];
//    _nameLB.font = [[KDFont new]getF30Font];
//    _nameLB.text = @"哈哈";
//    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(34);
//        make.centerX.mas_equalTo(0);
//    }];
//    
//    self.introduceLB = [UILabel new];
//    [self addSubview:_introduceLB];
//    _introduceLB.textColor = [KDColor getC3Color];
//    _introduceLB.font = [[KDFont new]getF26Font];
//    _introduceLB.text = @"成人组高级技术讲师";
//    [_introduceLB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_nameLB);
//        make.top.mas_equalTo(_nameLB.mas_bottom).mas_equalTo(9.5);
//    }];
//    
//    self.headImageView = [UIImageView new];
//    [self addSubview:_headImageView];
//    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(25);
//        make.right.mas_equalTo(_nameLB.mas_left).mas_equalTo(-20);
//        make.width.height.mas_equalTo(55);
//    }];
//}
//@end

@implementation TeacherBackView
-(void)setupViews{
    
    self.layer.cornerRadius = 4.0;
    self.layer.borderWidth =1.0;
    self.layer.borderColor = [KDColor getC12Color].CGColor;
    
    
    UILabel *zixunLB = [UILabel new];
    zixunLB.textColor = [KDColor getX1Color];
    zixunLB.font = [[KDFont sharedKDFont] getF28Font];
    zixunLB.layer.cornerRadius = 3.0;
    zixunLB.layer.borderColor = [KDColor getX1Color].CGColor;
    zixunLB.layer.borderWidth = 1.0;
    zixunLB.text = @"咨询";
    zixunLB.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:zixunLB];
    [zixunLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.bottom.mas_offset(-20);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(20);
    }];
    
    self.introduceLB = [UILabel new];
    [self addSubview:_introduceLB];
    _introduceLB.textColor = [KDColor getC3Color];
    _introduceLB.font = [[KDFont new]getF26Font];
    _introduceLB.text = @"高级技术讲师";
    [_introduceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.bottom.mas_equalTo(zixunLB.mas_top).mas_offset(-15);
    }];
    
    self.nameLB = [UILabel new];
    [self addSubview:_nameLB];
    _nameLB.textColor = [KDColor getC2Color];
    _nameLB.font = [[KDFont new]getF30Font];
    _nameLB.text = @"吕文敏";
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(self.introduceLB.mas_top).mas_offset(-5);
    }];
    
    
    
    self.headImageView = [UIImageView new];
    [self addSubview:_headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(self.nameLB.mas_top).mas_offset(-10);

        make.width.height.mas_equalTo(55);
    }];

    
}

-(void)bindViewModel:(id)viewModel{
    LCTeacherCollectionCellViewModel *teacherCellVM = viewModel;
    [self.headImageView setImageWithURL:teacherCellVM.headImageURL
                            placeholder:[UIImage imageNamed:@"noLog_Headimage"]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager]
                               progress:nil
                              transform:nil
                             completion:nil];
    self.nameLB.text = teacherCellVM.name;
    self.introduceLB.text = teacherCellVM.introduce;
}

@end

@implementation LCTeachersCollectionViewCell

-(void)setupViews{
//    self.scrollView.backgroundColor = [KDColor getC0Color];
    self.scrollView = [UIScrollView new];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_offset(25);
        make.bottom.mas_offset(-25);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    if (self.dataArr) {
        return;
    }
    self.dataArr = viewModel;
    
    NSUInteger n = self.dataArr.count;
    CGFloat gap = 10.0;
    CGFloat border = 15.0;
    CGFloat itemW = 125.0;
    CGFloat itemH = 175.0;
    
    self.scrollView.contentSize = CGSizeMake(125*n+gap*(n-1)+border*2, itemH);
    for (int i=0; i<n; i++) {
        TeacherBackView *teacherView = [[TeacherBackView alloc]initWithFrame:CGRectMake(i*(itemW+gap)+border, 0, itemW, itemH)];
//        teacherView.backgroundColor =[UIColor yellowColor];
        [self.scrollView addSubview:teacherView];
        [teacherView bindViewModel:self.dataArr[i]];
        @weakify(self)
        [teacherView bk_whenTapped:^{
            @strongify(self)
            LCTeacherCollectionCellViewModel *TeacherCellVM = self.dataArr[i];
            !TeacherCellVM.pushToTeacherDetailViewModel ? : TeacherCellVM.pushToTeacherDetailViewModel(TeacherCellVM.teacherID);
        }];
    }
}

//-(void)setDataArr:(NSArray *)dataArr{
//    if (![self.dataArr isEqualToArray:dataArr]) {
//        _dataArr = dataArr;
//        self.maxNum = _dataArr.count;
//        [self.carousel reloadData];
//    }
//}





@end
