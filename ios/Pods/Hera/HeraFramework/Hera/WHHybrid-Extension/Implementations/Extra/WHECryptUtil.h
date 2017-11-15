//
//  WHECryptUtil.h
//  Hera
//
//  Created by WangYiqiao on 2017/11/11.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHECryptUtil : NSObject

+ (NSString*)md5:(NSString*)str;
+ (NSString *)md5WithBytes:(char *)bytes length:(NSUInteger)length;
+ (NSData*)md5Data:(NSData*)data;
+ (NSString*)md5WithData:(NSData*)data;

@end
