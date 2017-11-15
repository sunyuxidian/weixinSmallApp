//
//  WHEBaseApi.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/17.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHEBaseApi : NSObject

/// api名称
@property (nonatomic, readonly, copy) NSString * _Null_unspecified command;


/// 原始参数
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nullable param;

- (void)setupApiWithSuccess:(void(^_Null_unspecified)(NSDictionary<NSString *, id> * _Nonnull))success
                 failure:(void(^_Null_unspecified)(id _Nullable))failure
                  cancel:(void(^_Null_unspecified)(void))cancel;

@end
