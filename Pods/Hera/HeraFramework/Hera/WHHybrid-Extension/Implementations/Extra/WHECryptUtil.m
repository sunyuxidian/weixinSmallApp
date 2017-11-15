//
//  WHECryptUtil.m
//  Hera
//
//  Created by WangYiqiao on 2017/11/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHECryptUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation WHECryptUtil

+ (NSString*)md5:(NSString*)str {
	const char *cStr = [str UTF8String];
	unsigned char result[16];
	CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
	return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}

+ (NSString *)md5WithBytes:(char *)bytes length:(NSUInteger)length
{
	unsigned char result[16];
	CC_MD5( bytes, (CC_LONG)length, result );
	return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}

+ (NSString*)md5WithData:(NSData*)data {
	NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	return [WHECryptUtil md5:str];
}

+ (NSData*)md5Data:(NSData*)data {
	return [[WHECryptUtil md5WithData:data] dataUsingEncoding:NSUTF8StringEncoding];
}

@end
