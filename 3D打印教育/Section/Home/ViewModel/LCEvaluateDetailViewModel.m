//
//  LCEvaluateDetailViewModel.m
//  3D打印教育
//
//  Created by 3D on 16/12/19.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LCEvaluateDetailViewModel.h"
#import "LCEvaluateDetailCellViewModel.h"
@implementation LCEvaluateDetailViewModel
-(void)initialize{
    [super initialize];
    
}

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexpath in:(UITableView *)tableView{

}


-(void)requestRemoteDataWithPage:(NSUInteger)page completeHandle:(void (^)(id))complete{
    LCEvaluateDetailCellViewModel *evaDrtailCellVM1 = [[LCEvaluateDetailCellViewModel alloc]initWithName:@"开飞机小白菜" and:@"事中取胜的经验，技术以及突破传统观念的完美设计。强劲的V8和V10发动机、全时四轮驱动系统和奥迪全铝车身空间框架结构，赋予了奥迪R8出众的动力性能，以及在赛道和公路上的卓越表现。"];
    
    LCEvaluateDetailCellViewModel *evaDrtailCellVM2 = [[LCEvaluateDetailCellViewModel alloc]initWithName:@"我是土豆" and:@"你愁啥因此在邀请明星艺人这一环节中，有污点之人一律坚决拒绝。而“洪荒少女”傅园慧前一阵据说已经受邀参"];
    
    LCEvaluateDetailCellViewModel *evaDrtailCellVM3 = [[LCEvaluateDetailCellViewModel alloc]initWithName:@"地瓜小白菜" and:@"据《华西都市报》爆料，央视高层十分重视央视2017年春晚的节目创新和筹备，更重视受邀人员的公众影像，因此在邀请明星艺人这一环节中，有污点之人一律坚决拒绝。而“洪荒少女”傅园慧前一阵据说已经受邀参加本届春晚，如果最终她真能登台表演的话，那将是对傅园慧最大的认可。"];
    
    LCEvaluateDetailCellViewModel *evaDrtailCellVM4 = [[LCEvaluateDetailCellViewModel alloc]initWithName:@"大炮小白菜" and:@"厉害了我的哥。"];
    
    LCEvaluateDetailCellViewModel *evaDrtailCellVM5 = [[LCEvaluateDetailCellViewModel alloc]initWithName:@"你的名字" and:@"可不咋地"];
    [self.mutableDataArr addObjectsFromArray:@[evaDrtailCellVM1,evaDrtailCellVM2,evaDrtailCellVM3,evaDrtailCellVM4,evaDrtailCellVM5]];
    self.dataSource = self.mutableDataArr.copy;
}
@end
