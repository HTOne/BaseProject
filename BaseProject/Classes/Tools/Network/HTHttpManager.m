//
//  HTHttpManager.m
//  BaseProject
//
//  Created by HT on 17/7/25.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HTHttpManager.h"


@interface HTHttpManager()
@property (nonatomic, strong) AFHTTPSessionManager * manager;
@property (nonatomic, assign) BOOL isConnect;


@end

@implementation HTHttpManager

/**
 封装GET/Post

 @param url 路径
 @param params 参数
 @param method  GET / POST
 @param completion 完成回调
 */
-(void) loadURL:(NSString *)url parameters:(NSDictionary *)params method:(HttpRequestType)method completion:(void (^)(id responseObject, BOOL isSuccess)) completion {
   
    if ([self isConnectionAvailable]) {
        void (^success) (NSURLSessionDataTask *task, id  responseObject)  = ^ (NSURLSessionDataTask *task, id  responseObject){
            completion(responseObject, YES);
        };
        void (^failure) (NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"%@", error);
            completion(nil, NO);
        };
        if (method == HttpRequestGet) {
            [self.manager POST:url parameters:params progress:nil success:success failure:failure];
        } else {
            [self.manager GET:url parameters:params progress:nil success:success failure:failure];
        }
    }else {
        DLog(@"请检查您的网络");
    }
}

/// 专门负责拼接 token 的网络请求方法

- (void) tokenRequest:(NSString*) url parameters:(NSDictionary *)params method:(HttpRequestType)method completion:(void (^)(id responseObject, BOOL isSuccess)) completion {
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:params];
    param[@"token"] = @"";
    
    [self loadURL:url parameters:params method:method completion:completion];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        //设置请求类型
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //设置响应类型
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //        self.manager.requestSerializer.timeoutInterval = 8.f;
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        //开启监听
        [self openNetMonitoring];
    }
    return self;
}


+(instancetype) shared {
    static HTHttpManager *instance = nil;
    static dispatch_once_t oneceToken;
    dispatch_once(&oneceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (void)openNetMonitoring {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                self.isConnect = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                self.isConnect = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.isConnect = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                self.isConnect = YES;
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    self.isConnect = YES;
}

- (BOOL)isConnectionAvailable {
    return self.isConnect;
}


@end
