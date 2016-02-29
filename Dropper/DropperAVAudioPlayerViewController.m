//
//  DropperAVAudioPlayerViewController.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperAVAudioPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
#define kMusicFile @"22222"
#define kMusicTitle @"你好"
#define kMusicSinger @"刘若英"

@interface DropperAVAudioPlayerViewController () <AVAudioPlayerDelegate>

@property (nonatomic,strong) AVAudioPlayer *audioPlayer; //播放器
@property (strong, nonatomic)  UILabel *controlPanel;    //控制面板
@property (strong, nonatomic)  UIProgressView *playProgress;   //播放进度
@property (strong, nonatomic)  UILabel *musicSinger;    //演唱者
@property (strong, nonatomic)  UIButton *playOrPause;   //播放/暂停按钮(如果tag为0认为是暂停状态，1是播放状态)

@property (weak ,nonatomic) NSTimer *timer;//进度更新定时器


@end

@implementation DropperAVAudioPlayerViewController
#pragma mark - DataRequest Method



#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupUI];
    [self.view addSubview:self.playOrPause];
    [self.view addSubview:self.playProgress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Getter/Setter Method


-(UIButton*)playOrPause
{
    if (_playOrPause == nil)
    {
        _playOrPause = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playOrPause setFrame:CGRectMake(100, 100, 100, 100)];
        [_playOrPause setTitle:@"播放" forState:UIControlStateNormal];
        [_playOrPause setBackgroundColor:[UIColor greenColor]];
        [_playOrPause addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playOrPause;
}

/**
 *  创建播放器
 *
 *  @return 音频播放器
 */
-(AVAudioPlayer *)audioPlayer
{
    if (_audioPlayer == nil)
    {
        NSString *urlStr=[[NSBundle mainBundle]pathForResource:@"ios" ofType:@"mp3"];
        NSURL *url=[NSURL fileURLWithPath:urlStr];
        NSError *error=nil;
        //初始化播放器，注意这里的Url参数只能时文件路径，不支持HTTP Url
        _audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        //设置播放器属性
        _audioPlayer.numberOfLoops=0;//设置为0不循环
        _audioPlayer.delegate=self;
        [_audioPlayer prepareToPlay];//加载音频文件到缓存
        if(error)
        {
            NSLog(@"初始化播放器过程发生错误,错误信息:%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioPlayer;
}


-(UIProgressView *)playProgress
{
    if (_playProgress == nil)
    {
        _playProgress = [[UIProgressView alloc]initWithFrame:CGRectMake(10,300, kScreen_Width-20, 10)];
        [_playProgress setBackgroundColor:[UIColor greenColor]];
    }
    return _playProgress;
}



#pragma mark - Delegate Method
#pragma mark  播放器代理方法
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self play];
    NSLog(@"音乐播放完成...");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error
{
    
}


#pragma mark - Response Method



#pragma mark - PrivateMethod

/**
*  初始化UI
*/
-(void)setupUI
{
    self.title = kMusicTitle;
    self.musicSinger.text = kMusicSinger;
}

-(NSTimer *)timer
{
    if (_timer == nil)
    {
        _timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress) userInfo:nil repeats:true];
    }
    return _timer;
}



/**
 *  播放音频
 */
-(void)play
{
    if (![self.audioPlayer isPlaying])
    {
        [self.audioPlayer play];
        self.timer.fireDate = [NSDate distantPast]; //恢复定时器
    }
}


/**
 *  暂停播放
 */
-(void)pause
{
    if ([self.audioPlayer isPlaying])
    {
        [self.audioPlayer pause];
        self.timer.fireDate = [NSDate distantFuture];//暂停定时器，注意不能调用invalidate方法，此方法会取消，之后无法恢复
        
    }
}

/**
 *  点击播放/暂停按钮
 *
 *  @param sender 播放/暂停按钮
 */
- (void)playClick:(UIButton *)sender
{
    if(sender.tag)
    {
        sender.tag=0;
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor grayColor]];
        [self pause];
    }
    else
    {
        sender.tag = 1;
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor greenColor]];
        [self play];
    }
}


/**
 *  更新播放进度
 */
-(void)updateProgress
{
    float progress = self.audioPlayer.currentTime / self.audioPlayer.duration;
    [self.playProgress setProgress:progress animated:true];
}

@end
