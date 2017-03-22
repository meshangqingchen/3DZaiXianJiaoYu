//
//  LCPiexunClassViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/3/17.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCPiexunClassViewModel.h"
#import "LCPiexunClassCellViewModel.h"
#import "LCPeixunClassModel.h"
#import "LCPeiXunClassDetailViewModel.h"
@implementation LCPiexunClassViewModel
-(void)initialize{
    [super initialize];
    self.shouldNavBackItem = YES;
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{
    LCPiexunClassCellViewModel *cellVM = self.dataSource[indexpath.row];
    
    LCPeiXunClassDetailViewModel *detailVM = [[LCPeiXunClassDetailViewModel alloc]initWithServices:self.navigationStackService params:@{KEY_TITLE:@"课程详情"}];
    /*
     @property(nonatomic,strong) NSString *name;
     @property(nonatomic,strong) NSString *long_time;
     @property(nonatomic,strong) NSString *descrip;
     @property(nonatomic,strong) NSString *classIID;
     @property (nonatomic, copy) NSString *price;
     @property (nonatomic, copy) NSString *online_price;
     */
    detailVM.name = cellVM.name;
    detailVM.long_time = cellVM.long_time;
    detailVM.descrip = cellVM.descrip;
    detailVM.classIID = cellVM.iid;
    detailVM.price = cellVM.price;
    detailVM.online_price = cellVM.online_price;
    [self.navigationStackService pushViewModel:detailVM animated:YES];
}

-(void)requestRemoteDataWithPage:(NSUInteger)curpage completeHandle:(void (^)(id))complete{
    [self.netApi_Manager getBaoMingClassList:^(id responseObj, NSError *error) {
        LCPeixunClassModel *peiXunModel = [LCPeixunClassModel parseJSON:responseObj];
        NSArray<LCPeixunClassContents *> *contents =peiXunModel.contents;
        for (int i = 0; i<contents.count; i++) {
            LCPiexunClassCellViewModel *cellVM = [[LCPiexunClassCellViewModel alloc]initWithModel:contents[i]];
            [self.mutableDataArr addObject:cellVM];
        }
        self.dataSource = self.mutableDataArr.copy;
    }];
}
@end
