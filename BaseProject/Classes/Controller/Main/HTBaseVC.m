//
//  HTBaseVC.m
//  BaseProject
//
//  Created by HT on 17/6/10.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HTBaseVC.h"

@interface HTBaseVC ()

@property (nonatomic, strong) UINavigationBar *navigationBar;

@end

@implementation HTBaseVC

-(UINavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen cz_screenWidth], 64)];
    }
    return _navigationBar;
}
- (UINavigationItem *)navItem {
    if (!_navItem) {
        _navItem = [[UINavigationItem alloc] init];
    }
    return _navItem;
}

-(void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.navItem.title = title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupNavigationBar];
}

-(void) setupUI {
    self.view.backgroundColor = [UIColor cz_randomColor];
}

-(void) setupNavigationBar {
    
    [self.view addSubview:self.navigationBar];
    self.navigationBar.items = @[self.navItem];
    // 1> 设置 navBar 整个背景的渲染颜色
    self.navigationBar.barTintColor = [UIColor cz_colorWithHex:0xF6F6F6];
    // 2> 设置 navBar 的字体颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    // 3> 设置系统按钮的文字渲染颜色
    self.navigationBar.tintColor = [UIColor orangeColor];
}


@end
