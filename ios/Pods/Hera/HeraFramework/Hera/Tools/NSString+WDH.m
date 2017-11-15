//
//  NSString+WDH.m
//  WDHodoer
//
//  Created by acorld on 2017/8/7.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "NSString+WDH.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(WDH)

- (unsigned long long)unsignedLongLongValue
{
    unsigned long long ullvalue = strtoull([self UTF8String], NULL, 0);
    return ullvalue;
}
@end
