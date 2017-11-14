//
//  NSData+WDH.m
//  WDHodoer
//
//  Created by acorld on 2017/7/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "NSData+WDH.h"
#import <zlib.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData(WDH)

- (unsigned long)wh_crc32;
{
    uLong crc = crc32(0L, Z_NULL, 0);
    crc = crc32(crc, self.bytes, (uInt)self.length);
    
    return crc;
}

@end
