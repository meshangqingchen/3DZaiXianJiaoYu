//
//  LCTeachersCollectionViewCell.h
//  3D打印教育
//
//  Created by 3D on 17/1/10.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "iCarousel.h"
#import "BaseView.h"

@interface TextView : BaseView
@property(nonatomic,strong) UITextView  *detailTextView;
@property(nonatomic,strong) UIImageView *backImageView;
@end

@class LCTeachersCollectionViewCell;
@interface TeacherBackView : BaseView
@property(nonatomic,strong) UIImageView *headImageView;
@property(nonatomic,strong) UILabel *nameLB;
@property(nonatomic,strong) UILabel *introduceLB;
@property(nonatomic,strong) UIButton *leftArrowBT;
@property(nonatomic,strong) UIButton *rightArrowBT;
@property(nonatomic,strong) TextView *textView;
@property(nonatomic,weak)   LCTeachersCollectionViewCell *cell;
@end

@interface LCTeachersCollectionViewCell : BaseCollectionViewCell <iCarouselDataSource,iCarouselDelegate>
@property(nonatomic,strong) TeacherBackView *teacherBackView;
@property(nonatomic,strong) iCarousel *carousel;
@property(nonatomic,assign) NSInteger currentItemIndex;
@property(nonatomic,assign) NSInteger maxNum;
@property(nonatomic,strong) NSArray *dataArr;
@end
