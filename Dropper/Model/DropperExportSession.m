//
//  DropperExportSession.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/29.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperExportSession.h"

#define EXPORT_NAME @"sss.mp3"

@implementation DropperExportSession

-(instancetype)initWithObject:(UIViewController *)object
{
    self = [super init];
    if (self)
    {
        [self sss];
    }
    return self;
}


-(void)sss
{
//    三、音频剪切（截取）
//    1. 创建AVURLAsset对象（继承了AVAsset）
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ios" ofType:@"mp3"];
    NSURL *songURL = [NSURL fileURLWithPath:path];
    AVURLAsset *songAsset = [AVURLAsset URLAssetWithURL:songURL options:nil];
    
    
    
    
    
//    2.创建音频文件
    NSString *exportPath = [HomeDirectoryDocumentLastObjectFilePath stringByAppendingPathComponent:EXPORT_NAME];
    
    NSError *assetError = [[NSError alloc]init];
    
    
    //EXPORT_NAME为导出音频文件名
    if ([[NSFileManager defaultManager] fileExistsAtPath:exportPath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:exportPath error:&assetError];
    }
    
    [NSFileManager defaultManager] ;
    
    NSURL *exportURL = [NSURL fileURLWithPath:exportPath];
    
//    AVAssetWriter *assetWriter = [AVAssetWriter assetWriterWithURL:exportURL
//                                                           fileType:AVFileTypeCoreAudioFormat
//                                                              error:&assetError];
    
    
//    if (assetWriter)
//    {
//        
//    }
//
//    NSLog(@"%@",assetWriter);
    
//    if (assetError)
//    {
//        NSLog (@"error: %@", assetError);
//        return;
//    }
    
//    3.创建音频输出会话
    AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:songAsset
                                                                            presetName:AVAssetExportPresetAppleM4A];
    
    
    
    
    
    NSString *filePath = [NSString stringWithFormat:@"%@/sss.mp3",HomeDirectoryDocumentFilePath];
    
    
    
    
//    4.设置音频截取时间区域 （CMTime在Core Medio框架中，所以要事先导入框架）
    CMTime startTime = CMTimeMake(10, 1);
    CMTime stopTime = CMTimeMake(30, 1);
    CMTimeRange exportTimeRange = CMTimeRangeFromTimeToTime(startTime, stopTime);
//    5.设置音频输出会话并执行
    exportSession.outputURL = [NSURL fileURLWithPath:exportPath]; // output path
    exportSession.outputFileType = AVFileTypeAppleM4A;            // output file type
    exportSession.timeRange = exportTimeRange;                    // trim time range
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        
        if (AVAssetExportSessionStatusCompleted == exportSession.status)
        {
            NSLog(@"AVAssetExportSessionStatusCompleted");
        }
        else if (AVAssetExportSessionStatusFailed == exportSession.status)
        {
            // a failure may happen because of an event out of your control
            // for example, an interruption like a phone call comming in
            // make sure and handle this case appropriately
            NSLog(@"AVAssetExportSessionStatusFailed");
        }
        else
        {
            NSLog(@"Export Session Status: %ld", (long)exportSession.status);
        }
    }];
}



//-(void)sssss
//{
//    NSData *data = [NSData dataWithContentsOfURL:movieUrl];
//    NSString *path = [NSString stringWithFormat:@"%@/%@", HomeDirectoryDocumentLastObjectFilePath,@"capturedvideo1.MOV"];
//    NSURL *url = [NSURL URLWithString:path];
//    [data writeToFile:path atomically:YES];
//    
//    //Delete the original asset
//
//    NSString *path1 = [NSString stringWithFormat:@"%@/%@", HomeDirectoryDocumentLastObjectFilePath,@"capturedvideo11.MOV"];
//    NSURL *url1 = [NSURL URLWithString:path1];
//    
//    [self convertVideoToLowQuailtyWithInputURL:url outputURL:url1 handler:Nil];
//    
//
//}


- (void)convertVideoToLowQuailtyWithInputURL:(NSURL*)inputURL
                                   outputURL:(NSURL*)outputURL
                                     handler:(void (^)(AVAssetExportSession*))handler

{
    
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:inputURL options:nil];
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:asset presetName:AVAssetExportPresetMediumQuality];
    exportSession.outputURL = outputURL;
    if ([[UIApplication sharedApplication]canOpenURL:inputURL]){
        NSLog(@"open");
    }
    exportSession.outputFileType = AVFileTypeQuickTimeMovie;
    NSLog(@"%@", exportSession.error);
    [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
     {
         if(exportSession.status != AVAssetExportSessionStatusCompleted){
             NSLog(@"%@", exportSession.error);
         }
         
     }];
}


//- (void) loadVideoByPath:(NSString*) v_strVideoPath andSavePath:(NSString*) v_strSavePath
//{
//    NSLog(@"\nv_strVideoPath = %@ \nv_strSavePath = %@\n ",v_strVideoPath,v_strSavePath);
//    
//    
//    AVAsset *avAsset = [AVAsset assetWithURL:[NSURL fileURLWithPath:v_strVideoPath]];
//    CMTime assetTime = [avAsset duration];
//    Float64 duration = CMTimeGetSeconds(assetTime);
//    NSLog(@"视频时长 %f\n",duration);
//    
//    AVMutableComposition *avMutableComposition = [AVMutableComposition composition];
//    
//    AVMutableCompositionTrack *avMutableCompositionTrack = [avMutableComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
//    
//    AVAssetTrack *avAssetTrack = [[avAsset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
//    
//    NSError *error = nil;
//    // 这块是裁剪,rangtime .前面的是开始时间,后面是裁剪多长 (我这裁剪的是从第二秒开始裁剪，裁剪2.55秒时长.)
//    [avMutableCompositionTrack insertTimeRange:CMTimeRangeMake(CMTimeMakeWithSeconds(2.0f, 30), CMTimeMakeWithSeconds(2.55f, 30))
//                                       ofTrack:avAssetTrack
//                                        atTime:kCMTimeZero
//                                         error:&error];
//    
//    AVMutableVideoComposition *avMutableVideoComposition = [AVMutableVideoComposition videoComposition];
//    // 这个视频大小可以由你自己设置。比如源视频640*480.而你这320*480.最后出来的是320*480这么大的，640多出来的部分就没有了。并非是把图片压缩成那么大了。
//    avMutableVideoComposition.renderSize = CGSizeMake(320.0f, 480.0f);
//    avMutableVideoComposition.frameDuration = CMTimeMake(1, 30);
//    // 这句话暂时不用理会，我正在看是否能添加logo而已。
////    [self addDataToVideoByTool:avMutableVideoComposition.animationTool];
//    
//    AVMutableVideoCompositionInstruction *avMutableVideoCompositionInstruction = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
//    
//    [avMutableVideoCompositionInstruction setTimeRange:CMTimeRangeMake(kCMTimeZero, [avMutableComposition duration])];
//    
//    AVMutableVideoCompositionLayerInstruction *avMutableVideoCompositionLayerInstruction = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:avAssetTrack];
//    [avMutableVideoCompositionLayerInstruction setTransform:avAssetTrack.preferredTransform atTime:kCMTimeZero];
//    
//    avMutableVideoCompositionInstruction.layerInstructions = [NSArray arrayWithObject:avMutableVideoCompositionLayerInstruction];
//    
//    
//    avMutableVideoComposition.instructions = [NSArray arrayWithObject:avMutableVideoCompositionInstruction];
//    
//    
//    NSFileManager *fm = [[NSFileManager alloc] init];
//    if ([fm fileExistsAtPath:v_strSavePath])
//    {
//        NSLog(@"video is have. then delete that");
//        if ([fm removeItemAtPath:v_strSavePath error:&error])
//        {
//            NSLog(@"delete is ok");
//        }
//        else
//        {
//            NSLog(@"delete is no error = %@",error.description);
//        }
//    }
//    
//    AVAssetExportSession *avAssetExportSession = [[AVAssetExportSession alloc] initWithAsset:avMutableComposition presetName:AVAssetExportPreset640x480];
//    [avAssetExportSession setVideoComposition:avMutableVideoComposition];
//    [avAssetExportSession setOutputURL:[NSURL fileURLWithPath:v_strSavePath]];
//    [avAssetExportSession setOutputFileType:AVFileTypeAppleM4A];
//    [avAssetExportSession setShouldOptimizeForNetworkUse:YES];
//    [avAssetExportSession exportAsynchronouslyWithCompletionHandler:^(void){
//        switch (avAssetExportSession.status) {
//            case AVAssetExportSessionStatusFailed:
//                NSLog(@"exporting failed %@",[avAssetExportSession error]);
//                break;
//            case AVAssetExportSessionStatusCompleted:
//                NSLog(@"exporting completed");
//                // 想做什么事情在这个做
//                [self cutImageByVideoPath:v_strSavePath];
//                break;
//            case AVAssetExportSessionStatusCancelled:
//                NSLog(@"export cancelled");
//                break;
//        }
//    }];
//    if (avAssetExportSession.status != AVAssetExportSessionStatusCompleted){
//        NSLog(@"Retry export");
//    }
//    [avMutableVideoComposition release];
//    [avAssetExportSession release];
//}


@end
