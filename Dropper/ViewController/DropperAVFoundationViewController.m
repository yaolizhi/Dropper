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
#import "DropperExportSession.h"



@interface DropperAVFoundationViewController ()

@property (nonatomic,strong) DropperAVAudioPlayer *Player;
@property (nonatomic,strong) DropperAVAudioRecorder *Recorder;
@property (nonatomic,strong) DropperExportSession *ExportSession;


@end

@implementation DropperAVFoundationViewController
#pragma mark - DataRequest Method



#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.Player = [[DropperAVAudioPlayer alloc]initWithObject:self];
    self.Recorder = [[DropperAVAudioRecorder alloc]initWithObject:self];
//    self.ExportSession = [[DropperExportSession alloc]initWithObject:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
