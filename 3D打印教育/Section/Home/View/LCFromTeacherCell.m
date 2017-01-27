//
//  NSFromTeacherCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/3.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCFromTeacherCell.h"
#import "LCUserTeacherTalkCellViewModel.h"
#import "LCAboutYYWebImage.h"
@interface LCFromTeacherCell ()
@property(nonatomic,strong) UIImageView *backImageView1;
@end


@implementation LCFromTeacherCell

-(void)setupViews{
    self.headImageView = [UIImageView new];
    _headImageView.frame = CGRectMake(10, 10, 40, 40);
    [self.contentView addSubview:_headImageView];
    
    UIImage *userBackImage = [UIImage imageNamed:@"teacher_back"];
    CGFloat top = userBackImage.size.height/2+10;
    CGFloat left = 20;
    CGFloat bottom = userBackImage.size.height/2+11;
    CGFloat right = 20;
    
    userBackImage = [userBackImage resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right)];
    self.backImageView1 = [UIImageView new];
    self.backImageView1.image = userBackImage;
    [self.contentView addSubview:_backImageView1];
    _backImageView1.top = 10;
    _backImageView1.left = 57;
    
    self.messageBodyLB = [YYLabel new];
    [self.backImageView1 addSubview:_messageBodyLB];
    [_messageBodyLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(13);
        make.right.bottom.mas_equalTo(-13);
    }];
    
}

-(void)bindViewModel:(id)viewModel{
    LCUserTeacherTalkCellViewModel *userTeacherTalkCellVM = viewModel;
    _backImageView1.height = userTeacherTalkCellVM.messageBody_H+26;
    _backImageView1.width = userTeacherTalkCellVM.messageBody_W+26;
    
    _messageBodyLB.textLayout = userTeacherTalkCellVM.messageBodyLayout;
    [self.headImageView setImageWithURL:userTeacherTalkCellVM.headImageURL
                            placeholder:[UIImage imageNamed:@"noLog_Headimage"]
                                options:kNilOptions
                                manager:[LCAboutYYWebImage avatarImageManager2]
                               progress:nil
                              transform:nil
                             completion:nil];
}
@end
