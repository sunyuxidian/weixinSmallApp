//
//  NSObject+WDHJson.m
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "NSObject+WDHJson.h"

@implementation NSString(WDHJson)

- (id)wdh_jsonObject
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return object;
}

@end

@implementation NSData(WDHJson)

- (id)wdh_jsonObject
{
    id object = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
    return object;
}

@end

@implementation NSDictionary (WDHJson)

- (NSString *)wdh_jsonString
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    if (!data) {
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end

@implementation NSArray (WDHJson)

- (NSString *)wdh_jsonString
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    if (!data) {
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
