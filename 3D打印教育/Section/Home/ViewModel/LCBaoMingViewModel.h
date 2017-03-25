//
//  LCBaoMingViewModel.h
//  无限教育
//
//  Created by 3D on 16/11/10.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "BaseTableViewModel.h"

typedef enum{
    jiChuPeiXun,
    shuoShi
}baoMingFrom;



@interface LCBaoMingViewModel : BaseTableViewModel
@property(nonatomic,strong) NSString *topTitle;
@property(nonatomic,strong) NSString *long_time;
@property(nonatomic,strong) NSString *classIID;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *online_price;
@property(nonatomic,assign) baoMingFrom baomingTyp;

@property(nonatomic,copy) void (^TextFiledDidEndDding)(NSString *title , NSString*textFiledtext);
@property(nonatomic,copy) void (^TextViewDidEndDding)(NSString *textViewText);
@property(nonatomic,copy) void (^showMethodOfpaymentView)();
@property(nonatomic,copy) void (^bingViewModelToBottomFooterView)(id model);
-(void)networkPresent;
@end
