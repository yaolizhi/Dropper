//
//  DropperAVAudioPlayer.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperAVAudioPlayer.h"


#define kMusicFile @"22222"
#define kMusicTitle @"你好"
#define kMusicSinger @"刘若英"


@interface DropperAVAudioPlayer () <AVAudioPlayerDelegate>

@property (nonatomic,strong) AVAudioPlayer *audioPlayer; //播放器
@property (strong, nonatomic)  UIProgressView *playProgress;   //播放进度
@property (strong, nonatomic)  UIButton *playOrPause;   //播放/暂停按钮(如果tag为0认为是暂停状态，1是播放状态)

@property (weak ,nonatomic) NSTimer *timer;//进度更新定时器


@end




@implementation DropperAVAudioPlayer


-(instancetype)initWithObject:(UIViewController *)object
{
    self = [super init];
    if (self)
    {
        [object.view addSubview:self.playOrPause];
        [object.view addSubview:self.playProgress];
    }
    return self;
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
        _audioPlayer.numberOfLoops=0;   //设置为0不循环
        _audioPlayer.delegate=self;
        [_audioPlayer prepareToPlay];   //加载音频文件到缓存
        
        
        _audioPlayer.meteringEnabled = YES;//开启仪表计数功能
        
        
        NSLog(@"这个mp3的音频文件的时间长度为：%f",_audioPlayer.duration);
        
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
    [_audioPlayer updateMeters];//更新仪表读数
    //读取每个声道的平均电平和峰值电平，代表每个声道的分贝数,范围在-100～0之间。
    NSLog(@"声道=%ld",_audioPlayer.numberOfChannels);
    for(int i = 0; i<_audioPlayer.numberOfChannels;i++)
    {
        float power = [_audioPlayer averagePowerForChannel:i];
        float peak = [_audioPlayer peakPowerForChannel:i];
        NSLog(@"%f=%f=%d",power,peak,i);
    }
    
    
    
    
    [_audioPlayer updateMeters];
    //发送updateMeters消息来刷新平均和峰值功率。此计数是以对数刻度计量的，-160表示完全安静，0表示最大输入值
    float averagePower = [_audioPlayer averagePowerForChannel:0];
    float peakPower = [_audioPlayer peakPowerForChannel:0];
    //转换最高分贝值，范围是0到1。0最小，1最大。
    const double ALPHA = 0.05;
    peakPower = pow(10, (ALPHA * [_audioPlayer peakPowerForChannel:0]));
    averagePower = pow(10, (ALPHA * [_audioPlayer averagePowerForChannel:0]));
    NSLog(@"改变之后的音符:%f=%f",peakPower,averagePower);
    
    
    float progress = self.audioPlayer.currentTime / self.audioPlayer.duration;
    [self.playProgress setProgress:progress animated:true];
}




@end
