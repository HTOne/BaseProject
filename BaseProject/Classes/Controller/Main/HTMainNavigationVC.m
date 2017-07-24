//
//  HTMainNavigationVC.m
//  BaseProject
//
//  Created by HT on 17/6/10.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HTMainNavigationVC.h"
#import "HTBaseVC.h"
#import "UIBarButtonItem+HTExtesion.h"

@interface HTMainNavigationVC ()

@end

@implementation HTMainNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.hidden = YES;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        NSString *title = @"返回";
        if ([viewController isKindOfClass:[HTBaseVC class]]) {
            if (self.childViewControllers.count == 1) {
                title = self.childViewControllers.firstObject.title;
            }
            HTBaseVC *vc = (HTBaseVC *)viewController;
            vc.navItem.leftBarButtonItem = [UIBarButtonItem textBarButton:title fontSize:16 target:self action:@selector(popToParent) isBack:YES];
        }
    }
    [super pushViewController:viewController animated:animated];
}
- (void) popToParent {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
