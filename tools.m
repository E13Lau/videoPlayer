//
//  tools.m
//  Video
//
//  Created by 刘一智 on 15/10/20.
//  Copyright © 2015年 liuyizhi. All rights reserved.
//

#import "tools.h"

@implementation tools

- (NSURL *)getUrlWithResource:(NSString *)resource type:(NSString *)type {
    NSBundle * bundle = [NSBundle mainBundle];
    NSURL * url = nil;
    if (bundle) {
        NSString * zhouPath = [bundle pathForResource:resource ofType:type];
        url = [NSURL fileURLWithPath:zhouPath];
        return url;
    }else {
        return nil;
    }
}

- (NSArray *)getConstraints:(UIView *)view withView:(UIView *)toView {
    CGFloat margin = 0;
    return @[// 左边
             [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:margin],
             // 右边
             [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-margin],
             // 底部
             [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-margin],
             [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeTop multiplier:1.0 constant:margin]
             ];
}

@end
