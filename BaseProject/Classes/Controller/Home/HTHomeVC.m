//
//  HTHomeVC.m
//  BaseProject
//
//  Created by HT on 17/7/21.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HTHomeVC.h"
#import "HTDemoVC.h"
@interface HTHomeVC ()

@end

@implementation HTHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navItem.rightBarButtonItem = [UIBarButtonItem textBarButton:@"设置" fontSize:16 target:self action:@selector(pushToSetting) isBack:NO];
}
-(void) pushToSetting {
    HTDemoVC *demovc = [[HTDemoVC alloc] init];
    [self.navigationController pushViewController:demovc animated:YES];
}

@end
