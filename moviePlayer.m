//
//  moviePlayer.m
//  Video
//
//  Created by 刘一智 on 15/10/20.
//  Copyright © 2015年 liuyizhi. All rights reserved.
//

#import "moviePlayer.h"

@implementation moviePlayer

- (instancetype)initWithContentURL:(NSURL *)url
{
    self = [super initWithContentURL:url];
    if (self) {
        [self setupPlayer];
    }
    return self;
}

- (void)setupPlayer {
    self.controlStyle = MPMovieControlStyleFullscreen;//播放控制器style
    self.repeatMode = MPMovieRepeatModeOne;//循环
    self.scalingMode = MPMovieScalingModeAspectFit;//视频缩放
    [self prepareToPlay];
    //不设为NO，Constraints不起用
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self setFullscreen:YES animated:YES];

}

@end
