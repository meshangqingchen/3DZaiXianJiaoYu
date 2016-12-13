//
//  LCReactiveViewProtocol.h
//  3D打印教育
//
//  Created by 3D on 16/12/13.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LCReactiveViewProtocol <NSObject>
- (void)setupViews;

- (void)bindViewModel:(id)viewModel;
@end
