//
//  LaunchViewController.m
//  无限教育
//
//  Created by 3D on 16/11/19.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *launchImageView = [UIImageView new];
    launchImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:launchImageView];
    launchImageView.image = [UIImage imageNamed:@"launch_image"];
    UILabel *label = [UILabel new];
    [launchImageView addSubview:label];
    label.text = @"Copyright © 2016年 无限三维. All rights reserved.";
    label.font = [[KDFont sharedKDFont]getF24Font];
    label.textColor = [UIColor colorWithRed:146/255.0 green:146/255.0 blue:146/255.0 alpha:1.0];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
