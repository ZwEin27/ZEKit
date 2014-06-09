//
//  NSNumber+ZEExtension.m
//  ZEKit
//
//  Created by zwein on 6/9/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "NSNumber+ZEExtension.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation NSNumber(BeeExtension)

@dynamic dateValue;

- (NSDate *)dateValue
{
	return [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
}

- (NSString *)stringWithDateFormat:(NSString *)format
{
#if 0
	
	NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
	NSString * result = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[self doubleValue]]];
	[dateFormatter release];
	return result;
	
#else
	
	// thanks @lancy, changed: "NSDate depend on NSNumber" to "NSNumber depend on NSDate"
	
	return [[NSDate dateWithTimeIntervalSince1970:[self doubleValue]] stringWithDateFormat:format];
	
#endif
}

@end
