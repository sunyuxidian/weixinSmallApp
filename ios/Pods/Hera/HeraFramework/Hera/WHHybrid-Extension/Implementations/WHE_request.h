//
//  WHE_request.h
//  WHHybridDemo
//
//  Created by acorld on 2017/4/19.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_request : WHEBaseApi

/// url
@property (nonatomic, copy) NSString *url;

/// data，Json String /Dictionary
@property (nonatomic, strong) id data;

/// header
@property (nonatomic, strong) NSDictionary *header;

/// method
@property (nonatomic, copy) NSString *method;

/// dataType
@property (nonatomic, copy) NSString *dataType;

@end
