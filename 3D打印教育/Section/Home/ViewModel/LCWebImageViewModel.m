//
//  LCWebImageViewModel.m
//  3D打印教育
//
//  Created by 3D on 17/1/15.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCWebImageViewModel.h"

@implementation LCWebImageViewModel
-(void)initialize{
    [super initialize];

}

-(instancetype)initWithServices:(id<LCNavigationProtocol>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        self.className = params[@"className"];
        self.webURl = params[@"webURL"];
    }
    return self;
}
@end
