//
//  NSObject+ZETypeConversion.h
//  ZEKit
//
//  Created by zwein on 6/6/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//


#import "ZEPrecompile.h"

#pragma mark -

@interface NSObject(ZETypeConversion)

- (NSInteger)asInteger;
- (float)asFloat;
- (BOOL)asBool;

- (NSNumber *)asNSNumber;
- (NSString *)asNSString;
- (NSDate *)asNSDate;
- (NSData *)asNSData;	// TODO
- (NSArray *)asNSArray;
- (NSArray *)asNSArrayWithClass:(Class)clazz;
- (NSMutableArray *)asNSMutableArray;
- (NSMutableArray *)asNSMutableArrayWithClass:(Class)clazz;
- (NSDictionary *)asNSDictionary;
- (NSMutableDictionary *)asNSMutableDictionary;

@end