//
//  NSCoder+ST.h
//  STCoderSample
//
//  Created by EIMEI on 2013/05/02.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCoder (STCoderSample)

- (NSString *)st_decodeStringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (void)st_encodeUnsignedInteger:(NSUInteger)value forKey:(NSString *)key;
- (NSUInteger)st_decodeUnsignedIntegerForKey:(NSString*)key defaultValue:(NSUInteger)defaultValue;
- (void)st_encodeBool:(BOOL)value forKey:(NSString*)key;
- (BOOL)st_decodeBoolForKey:(NSString*)key defaultValue:(BOOL)defaultValue;

@end
