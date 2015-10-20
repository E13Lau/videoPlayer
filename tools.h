//
//  tools.h
//  Video
//
//  Created by 刘一智 on 15/10/20.
//  Copyright © 2015年 liuyizhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface tools : NSObject

- (NSURL *)getUrlWithResource:(NSString *)resource type:(NSString *)type;
- (NSArray *)getConstraints:(UIView *)view withView:(UIView *)toView;

@end
