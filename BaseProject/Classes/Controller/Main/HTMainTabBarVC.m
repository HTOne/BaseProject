//
//  HTMainTabBarVC.m
//  BaseProject
//
//  Created by HT on 17/6/10.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HTMainTabBarVC.h"

@interface HTMainTabBarVC ()

@end

@implementation HTMainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 控制屏幕支持的方向
/**
 portrait    : 竖屏，肖像
 landscape   : 横屏，风景画
 
 - 使用代码控制设备的方向，好处，可以在在需要横屏的时候，单独处理！
 - 设置支持的方向之后，当前的控制器及子控制器都会遵守这个方向！
 - 如果播放视频，通常是通过 modal 展现的！
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
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
