//
//  DropperAVFoundationViewController.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperAVFoundationViewController.h"
#import "DropperAVAudioPlayer.h"
#import "DropperAVAudioRecorder.h"


@interface DropperAVFoundationViewController ()

@property (nonatomic,strong) DropperAVAudioPlayer *Player;
@property (nonatomic,strong) DropperAVAudioRecorder *Recorder;


@end

@implementation DropperAVFoundationViewController
#pragma mark - DataRequest Method



#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//    self.Player = [[DropperAVAudioPlayer alloc]initWithObject:self];
    self.Recorder = [[DropperAVAudioRecorder alloc]initWithObject:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
