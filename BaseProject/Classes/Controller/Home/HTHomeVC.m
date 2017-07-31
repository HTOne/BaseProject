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

@property (nonatomic, strong) UIView *red;

@end

@implementation HTHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navItem.rightBarButtonItem = [UIBarButtonItem textBarButton:@"设置" fontSize:16 target:self action:@selector(pushToSetting) isBack:NO];

    RACSignal *singnal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"第一次使用信号"];
        
        return nil;
    }];
    
    [singnal subscribeNext:^(id  _Nullable x) {
        DLog(@"%@", x);
    }];
    
 //   [self fetch_IndexAllBtn];
}
-(void) setupUI {
    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 40, 40)];
    red.backgroundColor = [UIColor redColor];
    _red = red;
    [self.view addSubview:red];
    
    DLog(@"super");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.byValue = @200;
    animation.duration = 3;
   
    [_red.layer addAnimation:animation forKey:@"basic"];
}

- (void) fetch_IndexAllBtn {
    NSString *path = [NSString stringWithFormat:@"http://api.sinter.cn:8081/sinter_api/api/client/userService/getServiceTypeList"];
    
    [[HTHttpManager shared] loadURL:path parameters:nil method:HttpRequestGet completion:^(id responseObject, BOOL isSuccess) {
        DLog(@"%@", responseObject);
    }];
    
}

-(void) pushToSetting {
    HTDemoVC *demovc = [[HTDemoVC alloc] init];
    [self.navigationController pushViewController:demovc animated:YES];
}

@end
