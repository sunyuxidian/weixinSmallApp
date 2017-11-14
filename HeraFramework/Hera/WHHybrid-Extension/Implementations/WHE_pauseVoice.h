//
//  WHE_pauseVoice.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

/**
 暂停正在播放的语音。再次调用wx.playVoice播放同一个文件时，会从暂停处开始播放。
 如果想从头开始播放，需要先调用 WHE_stopVoice。
 */
@interface WHE_pauseVoice : WHEBaseApi

@end
