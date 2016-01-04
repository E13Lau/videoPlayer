//
//  ViewController.m
//  VideoManufacturing
//
//  Created by 刘一智 on 15/10/26.
//  Copyright © 2015年 liuyizhi. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import "moviePlayer.h"
#import "tools.h"

static NSString * const resourceName = @"制造";
static NSString * const type = @"m4v";

@interface ViewController () {
    moviePlayer * player;
    tools * myTools;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myTools = [[tools alloc]init];
    NSURL * resourceUrl = [myTools getUrlWithResource:resourceName type:type];
    if (!resourceUrl) {
        return;
    }
    [self setupAVPlayerWithURL:resourceUrl];
    [self setupNotification];
    //不加没声音
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
}

- (void)setupNotification {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(appEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(appEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)removeNotification {
    [[NSNotificationCenter defaultCenter]removeObserver:UIApplicationDidEnterBackgroundNotification];
    [[NSNotificationCenter defaultCenter]removeObserver:UIApplicationWillEnterForegroundNotification];
}

- (void)setupAVPlayerWithURL:(NSURL *)url {
    player = [[moviePlayer alloc]initWithContentURL:url];
    [self.view addSubview:player.view];
    
    // 间距约束（添加到self.view身上）
    [self.view addConstraints:[myTools getConstraints:player.view withView:self.view]];
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)appEnterBackground:(NSNotification*)notice {
    [player stop];
}

- (void)appEnterForeground:(NSNotification*)notice {
    [player play];
}


-(void)dealloc {
    //去掉监听
    [self removeNotification];
}

@end
