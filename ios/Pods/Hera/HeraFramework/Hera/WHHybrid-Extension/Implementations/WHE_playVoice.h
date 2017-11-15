//
//  WHE_playVoice.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 开始播放语音，同时只允许一个语音文件正在播放，
 如果前一个语音文件还没播放完，将中断前一个语音播放。
 */
@interface WHE_playVoice : WHEBaseApi

@property (nonatomic, copy) NSString *filePath;

@end
