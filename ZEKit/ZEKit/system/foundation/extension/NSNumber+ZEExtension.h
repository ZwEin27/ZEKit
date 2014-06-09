//
//  NSNumber+ZEExtension.h
//  ZEKit
//
//  Created by zwein on 6/9/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZEPrecompile.h"

#pragma mark -

#undef	__INT
#define __INT( __x )			[NSNumber numberWithInteger:(NSInteger)__x]

#undef	__UINT
#define __UINT( __x )			[NSNumber numberWithUnsignedInt:(NSUInteger)__x]

#undef	__FLOAT
#define	__FLOAT( __x )			[NSNumber numberWithFloat:(float)__x]

#undef	__DOUBLE
#define	__DOUBLE( __x )			[NSNumber numberWithDouble:(double)__x]

#undef	__BOOL
#define __BOOL( __x )			[NSNumber numberWithBool:(BOOL)__x]

#pragma mark -

@interface NSNumber(ZEExtension)

@property (nonatomic, readonly) NSDate *	dateValue;

- (NSString *)stringWithDateFormat:(NSString *)format;

@end
