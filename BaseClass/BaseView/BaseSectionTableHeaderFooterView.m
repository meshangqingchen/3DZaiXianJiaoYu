//
//  BaseSectionTableHeaderFooterView.m
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseSectionTableHeaderFooterView.h"

@implementation BaseSectionTableHeaderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{};
-(void)bindViewModel:(id)viewModel{}
-(void)bindViewModel:(id)viewModel AndIndexPath:(NSIndexPath *)indexPath{};
@end
