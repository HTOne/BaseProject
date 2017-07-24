//
//  UIBarButtonItem+HTExtesion.m
//  BaseProject
//
//  Created by HT on 17/7/21.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "UIBarButtonItem+HTExtesion.h"

@implementation UIBarButtonItem (HTExtesion)

+(instancetype) textBarButton:(NSString *)title fontSize:(CGFloat)fontSize target:(id)target action:(SEL) action isBack:(BOOL)isBack{
    UIButton *btn = [UIButton cz_textButton:title fontSize:fontSize normalColor:[UIColor darkGrayColor] highlightedColor:[UIColor orangeColor]];
    if (isBack) {
        NSString *imageName = @"navigationbar_back_withtext";
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", imageName]] forState:UIControlStateHighlighted];
        [btn sizeToFit];
    }
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}

@end
