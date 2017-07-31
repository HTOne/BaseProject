//
//  HTDemoVC.m
//  BaseProject
//
//  Created by HT on 17/7/21.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HTDemoVC.h"

@interface HTDemoVC ()

@end

@implementation HTDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"测试";
}

-(void) setupUI {
    UITextField *text = [[UITextField alloc] init];
    [self.view addSubview:text];
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    
}
@end
