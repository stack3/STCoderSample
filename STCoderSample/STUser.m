//
//  STUser.m
//  STCoderSample
//
//  Created by EIMEI on 2013/05/01.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "STUser.h"
#import "NSCoder+STCoderSample.h"

@implementation STUser

- (id)init
{
    self = [super init];
    if (self) {
        _isPrivate = YES;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _username = [decoder st_decodeStringForKey:STMemberVariableToString(_username) defaultValue:nil];
        _age = [decoder st_decodeUnsignedIntegerForKey:STMemberVariableToString(_age) defaultValue:0];
        _isPrivate = [decoder st_decodeBoolForKey:STMemberVariableToString(_isPrivate) defaultValue:YES];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_username forKey:STMemberVariableToString(_username)];
    [encoder st_encodeUnsignedInteger:_age forKey:STMemberVariableToString(_age)];
    [encoder st_encodeBool:_isPrivate forKey:STMemberVariableToString(_isPrivate)];
}

+ (STUser *)loadInstance
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults dataForKey:STAppUserDefaultsKey(@"user")];
    if (data) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    } else {
        return [[STUser alloc] init];
    }
}

- (void)save
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [defaults setObject:data forKey:STAppUserDefaultsKey(@"user")];
    [defaults synchronize];
}

@end
