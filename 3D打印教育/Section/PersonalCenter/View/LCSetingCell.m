//
//  LCSetingCell.m
//  3D打印教育
//
//  Created by 3D on 17/1/7.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCSetingCell.h"
#import "LCSetingCellViewModel.h"
#import "KDFileManager.h"
#import "UIView+BlocksKit.h"
@implementation LCSetingCell
-(void)setupViews{
    
    self.contentView.backgroundColor = [KDColor getC0Color];
    
    self.leftLB = [UILabel new];
    _leftLB.font = [[KDFont sharedKDFont] getF22Font];
    _leftLB.textColor = [KDColor getC2Color];
    [self.contentView addSubview:_leftLB];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(15);
    }];
    
    self.middleLB = [UILabel new];
    _middleLB.font = [[KDFont sharedKDFont] getF24Font];
    _middleLB.textColor = [KDColor getC20Color];
    _middleLB.text = @"推出登录";
    [self.contentView addSubview:_middleLB];
    [_middleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
    }];
    
    self.rightLB = [UILabel new];
    _rightLB.font = [[KDFont sharedKDFont] getF22Font];
    _rightLB.textColor = [KDColor getX0Color];
    _rightLB.text = @"0M";
    [self.contentView addSubview:_rightLB];
    [_rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
    }];
    
    self.rightImageView = [UIImageView new];
    UIImage *image = [UIImage imageNamed:@"danjiantou"];
    _rightImageView.image = image;
    [self.contentView addSubview:_rightImageView];
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.mas_offset(0);
        make.size.mas_equalTo(image.size);
    }];
    
    self.rightSwitch = [[NKColorSwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-33-15, 7.5, 33, 20)];
    _rightSwitch.on = NO;
    NSNumber *bofangNUM = [KDFileManager readUserDataForKey:LCCBOFANG];
    if ([bofangNUM isEqualToNumber:@1]) {
       _rightSwitch.on = YES;
    }else{
       _rightSwitch.on = NO;
    }
    
    [_rightSwitch setTintColor:[KDColor getC7Color]];
    [_rightSwitch setOnTintColor:[UIColor greenColor]];
    [_rightSwitch setThumbTintColor:[UIColor whiteColor]];
    [_rightSwitch setShape:kNKColorSwitchShapeOval];
    [self.contentView addSubview:_rightSwitch];
    
    [_rightSwitch addTarget:self action:@selector(clickSwich) forControlEvents:UIControlEventValueChanged];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [KDColor getC7Color];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_offset(0);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)bindViewModel:(id)viewModel AndIndexPath:(NSIndexPath *)indexPath{
    LCSetingCellViewModel *cellVM = viewModel;
    self.leftLB.text = cellVM.leftTitle;
    self.middleLB.text = cellVM.middleTitle;
    
    switch (cellVM.rightTyp) {
        case jiantou:
            self.rightImageView.hidden = NO;
            self.rightLB.hidden = YES;
            self.rightSwitch.hidden = YES;
            break;
            
        case kaiguan:
            self.rightImageView.hidden = YES;
            self.rightLB.hidden = YES;
            self.rightSwitch.hidden = NO;
            break;
            
        case shuzi:
            self.rightImageView.hidden = YES;
            self.rightLB.hidden = NO;
            self.rightSwitch.hidden = YES;
            break;
            
        case kong:
            self.rightImageView.hidden = YES;
            self.rightLB.hidden = YES;
            self.rightSwitch.hidden = YES;
            break;
        default:
            break;
    }
}


-(void)clickSwich{
    NSNumber *bofangNUM = [KDFileManager readUserDataForKey:LCCBOFANG];
    if ([bofangNUM isEqualToNumber:@1]) {
        [KDFileManager saveUserData:@0 forKey:LCCBOFANG];
    }else{
        [KDFileManager saveUserData:@1 forKey:LCCBOFANG];
    }

}
@end
