//
//  LCTeachersCollectionViewCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCTeachersCollectionViewCell.h"
#import "LCTeacherCollectionCellViewModel.h"

#import "LCAboutYYWebImage.h"

@implementation TextView
-(void)setupViews{
    self.backImageView = [UIImageView new];
    [self addSubview:_backImageView];
    _backImageView.userInteractionEnabled = YES;
    _backImageView.image = [UIImage imageNamed:@"bacKshadow"];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.nameLB = [UILabel new];
    [self addSubview:_nameLB];
    _nameLB.textColor = [KDColor getC2Color];
    _nameLB.font = [[KDFont new]getF30Font];
    _nameLB.text = @"哈哈";
    [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(34);
        make.centerX.mas_equalTo(0);
    }];
    
    self.introduceLB = [UILabel new];
    [self addSubview:_introduceLB];
    _introduceLB.textColor = [KDColor getC3Color];
    _introduceLB.font = [[KDFont new]getF26Font];
    _introduceLB.text = @"成人组高级技术讲师";
    [_introduceLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nameLB);
        make.top.mas_equalTo(_nameLB.mas_bottom).mas_equalTo(9.5);
    }];
    
    self.headImageView = [UIImageView new];
    [self addSubview:_headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.right.mas_equalTo(_nameLB.mas_left).mas_equalTo(-20);
        make.width.height.mas_equalTo(55);
    }];
//    self.detailLB = [UILabel new];
//    [self addSubview:_detailLB];
//    _detailLB.numberOfLines = 2;
//    _detailLB.textColor = [KDColor getC22Color];
//    _detailLB.font = [[KDFont new]getF26Font];
//    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.headImageView.mas_bottom).mas_offset(17);
//        make.left.mas_equalTo(32);
//        make.right.mas_equalTo(-32);
//    }];
}
@end

@implementation TeacherBackView
-(void)setupViews{
    self.leftArrowBT = [UIButton new];
    [self addSubview:_leftArrowBT];
    [_leftArrowBT setImage:[UIImage imageNamed:@"leftArrow"] forState:0];
    [_leftArrowBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(56);
        make.width.mas_equalTo(36.5);
        make.centerY.mas_offset(0);
    }];
    @weakify(self)
    [_leftArrowBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        MYLog(@"===%ld",self.cell.currentItemIndex);
        if (self.cell.currentItemIndex >= self.cell.maxNum-1) {
            self.cell.currentItemIndex = -1;
        }
        MYLog(@"===%ld",self.cell.currentItemIndex);
        [self.cell.carousel scrollToItemAtIndex:++self.cell.currentItemIndex animated:YES];
        MYLog(@"%ld",self.cell.currentItemIndex);
        MYLog(@"%ld",self.cell.currentItemIndex);
        MYLog(@"%ld",self.cell.currentItemIndex);
    }];
    
    self.rightArrowBT = [UIButton new];
    [self addSubview:_rightArrowBT];
    [_rightArrowBT setImage:[UIImage imageNamed:@"rightAtrrow"] forState:0];
    [_rightArrowBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(56);
        make.width.mas_equalTo(36.5);
        make.centerY.mas_offset(0);
    }];
    [_rightArrowBT addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        @strongify(self)
        if (self.cell.currentItemIndex <= 0) {
            self.cell.currentItemIndex = self.cell.maxNum;
        }
        [self.cell.carousel scrollToItemAtIndex:--self.cell.currentItemIndex animated:YES];
        
    }];
    
    self.textView = [TextView new];
    [self addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(36.5);
        make.right.mas_equalTo(-36.5);
        make.top.mas_offset(25);
        make.bottom.mas_offset(-25);
    }];
}

-(void)bindViewModel:(id)viewModel{

    LCTeacherCollectionCellViewModel *teacherCellVM = viewModel;
    [self.textView.headImageView setImageWithURL:teacherCellVM.headImageURL
                            placeholder:[UIImage imageNamed:@"noLog_Headimage"]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager2]
                               progress:nil
                              transform:nil
                             completion:nil];
    self.textView.nameLB.text = teacherCellVM.name;
    self.textView.introduceLB.text = teacherCellVM.introduce;
//    self.textView.detailLB.text= teacherCellVM.textViewText;
    
    
}

@end

@implementation LCTeachersCollectionViewCell

-(void)setupViews{
    self.currentItemIndex = 0;
    self.maxNum = 0;
    self.carousel = [[iCarousel alloc]init];
    [self.contentView addSubview:_carousel];
    _carousel.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/750*300);
    self.carousel.type = iCarouselTypeLinear;
    self.carousel.bounceDistance = 0.01f;//多余能滚动的距离
    //    self.carousel.perspective = 20.f;   //
    self.carousel.scrollSpeed = 0.8f;
    self.carousel.delegate = self;
    self.carousel.dataSource = self;

}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.maxNum;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    UIView *cardView = view;
    if (!cardView) {
        cardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/750*300)];
        TeacherBackView *teacherBackView = [TeacherBackView new];
        [cardView addSubview:teacherBackView];
        teacherBackView.cell = self;
        [teacherBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        teacherBackView.tag  = 1000;
    }
    TeacherBackView *ta = [cardView viewWithTag:1000];
    [ta bindViewModel:self.dataArr[index]];
    return cardView;
}


//跳转教师详情
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{

    LCTeacherCollectionCellViewModel *TeacherCellVM = self.dataArr[index];
    !TeacherCellVM.pushToTeacherDetailViewModel ? : TeacherCellVM.pushToTeacherDetailViewModel(TeacherCellVM.teacherID);
}




-(void)bindViewModel:(id)viewModel{
    self.dataArr = viewModel;
}

-(void)setDataArr:(NSArray *)dataArr{
    if (![self.dataArr isEqualToArray:dataArr]) {
        _dataArr = dataArr;
        self.maxNum = _dataArr.count;
        [self.carousel reloadData];
    }
}
@end
