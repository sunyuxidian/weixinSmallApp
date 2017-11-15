//
//  WHEAVManager.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/31.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^WHAVSuccess)(NSString *);
typedef void(^WHAVFail)(NSString *);

/**
 管理音频 录音
 */
@interface WHEAVManager : NSObject

+ (instancetype)sharedManager;

- (void)startRecordWithSuccess:(WHAVSuccess )success fail:(WHAVFail) fail;

- (void)stopRecord;

- (void)startPlayVoice:(NSURL *)fileUrl fail:(WHAVFail)fail;

- (void)pauseVoice;

- (void)stopPlayVoice;


@end
