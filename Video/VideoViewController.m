//
//  VideoViewController.m
//  Video
//
//  Created by 刘一智 on 15/10/16.
//  Copyright © 2015年 liuyizhi. All rights reserved.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAVPlayer];
    // Do any additional setup after loading the view.
}

- (void)setupAVPlayer {
    AVPlayerItem * playerItem = [[AVPlayerItem alloc]initWithURL:[self getUrl]];
    self.player = [[AVPlayer alloc]initWithPlayerItem:playerItem];
    
    [self.player play];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playerDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

- (NSURL *)getUrl {
    NSBundle * bundle = [NSBundle mainBundle];
    NSURL * url = nil;
    if (bundle) {
        NSString * moviePath = [bundle pathForResource:@"Movie" ofType:@"m4v"];
        url = [NSURL fileURLWithPath:moviePath];
        return url;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//循环播放
- (void)playerDidReachEnd:(NSNotification *)notification {
    AVPlayerItem * player = [notification object];
    [player seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
        if (finished) {
            [self.player play];
        }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}



@end
