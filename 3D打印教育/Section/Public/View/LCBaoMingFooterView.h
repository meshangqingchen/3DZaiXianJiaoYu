//
//  LCBaoMingFooterView.h
//  无限教育
//
//  Created by 3D on 16/11/11.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSimilarBaoMingLBCell : UIView
@property(nonatomic,strong) UILabel *titleLB;
@property(nonatomic,strong) UILabel *placHoderLB;
@property(nonatomic,copy) void (^showMethodOfpaymentView)();
-(void)bindViewModel:(id)viewModel;
@end


@interface LCBaoMingFooterView : UIView
@property(nonatomic,strong) UITextView *textView;
@property(nonatomic,strong) LCSimilarBaoMingLBCell *similarCell;
@property(nonatomic,copy) void (^TextViewDidEndDding)(NSString *textViewText);
@property(nonatomic,copy) void (^showMethodOfpaymentView)();

-(void)hidenZhiFuView:(BOOL)isbool;
@end
