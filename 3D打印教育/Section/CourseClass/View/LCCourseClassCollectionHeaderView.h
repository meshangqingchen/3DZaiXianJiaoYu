//
//  LCCourseClassCollectionHeaderView.h
//  3D打印教育
//
//  Created by 3D on 17/1/18.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCCourseClassCollectionHeaderView : UICollectionReusableView
@property(nonatomic,strong) UIImageView *leftImageView;
@property(nonatomic,strong) UILabel *leftLB;

-(void)setupViews;
-(void)bindViewModel:(id)viewModel andIndexpath:(NSIndexPath *)indexPath;
@end
