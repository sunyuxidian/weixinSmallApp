//
//  NSObject+WDHJson.h
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(WDHJson)

- (id)wdh_jsonObject;

@end

@interface NSData(WDHJson)

- (id)wdh_jsonObject;

@end

@interface NSDictionary (WDHJson)

- (NSString *)wdh_jsonString;

@end

@interface NSArray (WDHJson)

- (NSString *)wdh_jsonString;

@end
