//
//  LCBaoMingViewModel.h
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface LCBaoMingViewModel : BaseTableViewModel
@property(nonatomic,copy) void (^TextFiledDidEndDding)(NSString *title , NSString*textFiledtext);
@property(nonatomic,copy) void (^TextViewDidEndDding)(NSString *textViewText);
-(void)networkPresent;
@end
