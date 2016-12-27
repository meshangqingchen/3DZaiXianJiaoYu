//
//  LCCourseDownLoadCell.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCCourseDownLoadCell.h"
#import "LCCourseDownLoadCellViewModel.h"


@implementation LCCourseDownLoadCell
-(void)setupViews{
    self.titleLB = [UILabel new];
    self.titleLB.textColor = [KDColor getC2Color];
    self.titleLB.font = [[KDFont sharedKDFont] getF30Font];
    [self.contentView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
    
    self.downLoadBT = [UIButton new];
    _downLoadBT.backgroundColor = [UIColor yellowColor];
    [_downLoadBT setTitle:@"已下载" forState:UIControlStateSelected];
    [_downLoadBT setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.contentView addSubview:_downLoadBT];
    [_downLoadBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
    }];
    
    
    
    
}
-(void)bindViewModel:(id)viewModel{
    LCCourseDownLoadCellViewModel *cellVM = viewModel;
    self.titleLB.text = cellVM.title;
    if (cellVM.downLoadState == DownloadStateCompleted) {
       //下载完成了
        self.downLoadBT.selected = YES;
    }else if (cellVM.downLoadState == DownloadStateNoCompleted){
        //没有下载完成
        self.downLoadBT.selected = NO;
    }
    
}
@end
