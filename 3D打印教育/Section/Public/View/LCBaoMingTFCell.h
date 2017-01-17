//
//  LCBaoMingTFCell.h
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LCBaoMingTFCell : BaseTableViewCell
@property(nonatomic,strong) UILabel *titleLB;
@property(nonatomic,strong) UITextField *placHoderTF;

@property(nonatomic,copy) void (^TextFiledDidEndDding)(NSString *title , NSString*textFiled);
@end
