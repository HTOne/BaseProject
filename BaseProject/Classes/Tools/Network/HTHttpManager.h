//
//  HTHttpManager.h
//  BaseProject
//
//  Created by HT on 17/7/25.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HttpRequestType) {
    HttpRequestGet,
    HttpRequestPost,
//    HttpRequestPut,
//    HttpRequestDelete,
};


@interface HTHttpManager : NSObject

+(instancetype) shared;

-(void) loadURL:(NSString *)url  parameters:(NSDictionary *)params method:(HttpRequestType)method completion:(void (^)(id responseObject, BOOL isSuccess)) completion;

@end
