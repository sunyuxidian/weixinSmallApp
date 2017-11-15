//
//  WHEStorageUtil.h
//  TestStorage
//
//  Created by WangYiqiao on 2017/8/17.
//  Copyright © 2017年 WangYiqiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHEStorageUtil : NSObject

+ (NSData *)dataWithDictionary:(NSDictionary *)dictionary;

+ (BOOL)saveDictionary:(NSDictionary *)dictionary toPath:(NSString *)path;

+ (NSDictionary *)dictionaryWithFilePath:(NSString *)filePath;

@end
