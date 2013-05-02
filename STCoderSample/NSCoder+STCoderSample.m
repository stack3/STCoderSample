//
//  NSCoder+ST.m
//  STCoderSample
//
//  Created by EIMEI on 2013/05/02.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "NSCoder+STCoderSample.h"

@implementation NSCoder (STCoderSample)

- (NSString *)st_decodeStringForKey:(NSString *)key defaultValue:(NSString *)defaultValue
{
	id obj = [self decodeObjectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
    if ([obj isKindOfClass:[NSString class]]) {
		return obj;
	} else if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj stringValue];
	} else {
		return defaultValue;
	}
}

- (void)st_encodeUnsignedInteger:(NSUInteger)value forKey:(NSString*)key
{
    [self encodeObject:[NSNumber numberWithBool:value] forKey:key];
}

- (NSUInteger)st_decodeUnsignedIntegerForKey:(NSString*)key defaultValue:(NSUInteger)defaultValue
{
	id obj = [self decodeObjectForKey:key];
	if (!obj) {
		return defaultValue;
	}
    
	if ([obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj unsignedIntegerValue];
	} else if ([obj isKindOfClass:[NSString class]]) {
		return (NSInteger)strtoul([(NSString*)obj UTF8String], NULL, 0);
	} else {
		return defaultValue;
	}
}

- (void)st_encodeBool:(BOOL)value forKey:(NSString*)key
{
    [self encodeObject:[NSNumber numberWithBool:value] forKey:key];
}

- (BOOL)st_decodeBoolForKey:(NSString*)key defaultValue:(BOOL)defaultValue
{
    id obj = [self decodeObjectForKey:key];
	if (obj && [obj isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)obj boolValue];
	} else {
		return defaultValue;
	}
}

@end
