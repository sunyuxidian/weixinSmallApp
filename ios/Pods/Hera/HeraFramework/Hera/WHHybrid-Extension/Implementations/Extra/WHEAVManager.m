//
//  WHEAVManager.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEAVManager.h"
#import <AVFoundation/AVFoundation.h>
#import "WHEMacro.h"
#import "WDHAppManager.h"
#import "WDHApp.h"
#import "WDHAppInfo.h"
#import "WDHFileManager.h"
#import "WHECryptUtil.h"

@interface WHEAVManager() <AVAudioRecorderDelegate>

@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (nonatomic, strong) AVAudioPlayer   *player;

@property (nonatomic, copy) WHAVSuccess recordSuccess;
@property (nonatomic, copy) WHAVFail    recordFail;

@end

@implementation WHEAVManager

+ (instancetype)sharedManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WHEAVManager alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - 录音相关

- (void)startRecordWithSuccess:(WHAVSuccess)success fail:(WHAVFail)fail {
    if ([self.recorder isRecording]) {
        fail(@"正在录音中...");
        return;
    }
    
    self.recordSuccess = success;
    self.recordFail = fail;
    
    self.recorder = [self createAudioRecord];
    
    [self.recorder prepareToRecord];
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:NULL];
    [audioSession setActive:YES error:NULL];
    [self.recorder recordForDuration:60];
}

- (void) stopRecord {
    if(self.recorder) {
        [self.recorder stop];
        self.recorder = nil;
    }
}

#pragma mark - 音频相关

- (void)startPlayVoice:(NSURL *)fileUrl fail:(WHAVFail)fail {
    if([self.player.url isEqual:fileUrl]) {
        [self.player play];
        return;
    }
    
    // 停止之前播放的
    [self stopPlayVoice];
    
    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
    if (error) {
        if (fail) {
            fail(error.localizedDescription);
        }
        return;
    }
    self.player = player;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:NULL];
    [audioSession setActive:YES error:NULL];
    [player play];
}

- (void)pauseVoice {
    if (self.player) {
        [self.player pause];
    }
}

- (void)stopPlayVoice {
    if (self.player) {
        [self.player stop];
        self.player = nil;
        [[AVAudioSession sharedInstance] setActive:NO error:nil];
    }
}

#pragma mark - Private

- (AVAudioRecorder *)createAudioRecord {
    
    // 使用此配置 录制1分钟大小200KB左右
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt: kAudioFormatMPEG4AAC], AVFormatIDKey,
                              [NSNumber numberWithFloat:16000.0], AVSampleRateKey,
                              [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                              nil];
    
    // 使用当前时间戳的md5作为文件名
    NSString *currentDt = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    NSData *data = [currentDt dataUsingEncoding:NSUTF8StringEncoding];
    NSString *nameMD5 = [WHECryptUtil md5WithBytes:(char *)[data bytes] length:data.length];
    NSString *fileName = [NSString stringWithFormat:@"tmp_%@.m4a", nameMD5];
    NSString *filePath = [[self tmpDir] stringByAppendingPathComponent:fileName];
    AVAudioRecorder *recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:filePath] settings:settings error:nil];
    recorder.delegate = self;
    return recorder;
}

- (NSString *)tmpDir {
	WDHApp *app = [[WDHAppManager sharedManager] currentApp];
    NSString *cacheDir = [WDHFileManager appTempDirPath:app.appInfo.appId];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL flag = YES;
    if (![fileManager fileExistsAtPath:cacheDir isDirectory:&flag]) {
        [fileManager createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return cacheDir;
}

#pragma mark - AVAudioRecord Delegate

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    NSLog(@"%@", recorder.url.absoluteString);
    NSString *filePath = recorder.url.lastPathComponent;
    if (flag) {
        if (self.recordSuccess) {
            self.recordSuccess([WDH_FILE_SCHEMA stringByAppendingString:filePath]);
        }
    } else {
        [recorder deleteRecording];
        if (self.recordFail) {
            self.recordFail(@"录音失败");
        }
    }
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:NULL];
    [audioSession setActive:YES error:NULL];
    
    self.recorder = nil;
    self.recordSuccess = nil;
    self.recordFail = nil;
}


@end
