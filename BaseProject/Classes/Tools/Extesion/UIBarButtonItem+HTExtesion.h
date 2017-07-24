//
//  UIBarButtonItem+HTExtesion.h
//  BaseProject
//
//  Created by HT on 17/7/21.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HTExtesion)

+(instancetype) textBarButton:(NSString *)title fontSize:(CGFloat)fontSize target:(id)target action:(SEL) action isBack:(BOOL)isBack;

@end
