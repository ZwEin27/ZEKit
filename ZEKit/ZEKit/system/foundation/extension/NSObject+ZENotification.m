//
//  NSObject+ZENotification.m
//  ZEKit
//
//  Created by zwein on 6/5/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "NSObject+ZENotification.h"
#import "NSObject+ZEProperty.h"
//#import "ZE_Runtime.h"




// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation NSNotification(ZENotification)

- (BOOL)is:(NSString *)name
{
	return [self.name isEqualToString:name];
}

- (BOOL)isKindOf:(NSString *)prefix
{
	return [self.name hasPrefix:prefix];
}

@end

#pragma mark -

@implementation NSObject(ZENotification)

+ (NSString *)NOTIFICATION
{
	return [self NOTIFICATION_TYPE];
}

+ (NSString *)NOTIFICATION_TYPE
{
	return [NSString stringWithFormat:@"notify.%@.", [self description]];
}

- (void)handleNotification:(NSNotification *)notification
{
}

- (void)observeNotification:(NSString *)notificationName
{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:notificationName
												  object:nil];
	
	NSArray * array = [notificationName componentsSeparatedByString:@"."];
	if ( array && array.count > 1 )
	{
        //		NSString * prefix = (NSString *)[array objectAtIndex:0];
		NSString * clazz = (NSString *)[array objectAtIndex:1];
		NSString * name = (NSString *)[array objectAtIndex:2];
        
		{
			NSString * selectorName;
			SEL selector;
            
			selectorName = [NSString stringWithFormat:@"handleNotification_%@_%@:", clazz, name];
			selector = NSSelectorFromString(selectorName);
			
			if ( [self respondsToSelector:selector] )
			{
				[[NSNotificationCenter defaultCenter] addObserver:self
														 selector:selector
															 name:notificationName
														   object:nil];
				return;
			}
            
			selectorName = [NSString stringWithFormat:@"handleNotification_%@:", clazz];
			selector = NSSelectorFromString(selectorName);
			
			if ( [self respondsToSelector:selector] )
			{
				[[NSNotificationCenter defaultCenter] addObserver:self
														 selector:selector
															 name:notificationName
														   object:nil];
				return;
			}
		}
	}
    
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleNotification:)
												 name:notificationName
											   object:nil];
}

- (void)observeAllNotifications
{
	NSArray * methods = [ZERuntime allInstanceMethodsOf:[self class] withPrefix:@"handleNotification_"];
	if ( nil == methods || 0 == methods.count )
	{
		return;
	}
    
	for ( NSString * selectorName in methods )
	{
		SEL sel = NSSelectorFromString( selectorName );
		if ( NULL == sel )
			continue;
        
		NSMutableString * notificationName = [self performSelector:sel];
		if ( nil == notificationName  )
			continue;
        
		[self observeNotification:notificationName];
	}
}

- (void)unobserveNotification:(NSString *)name
{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:name
												  object:nil];
}

- (void)unobserveAllNotifications
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (BOOL)postNotification:(NSString *)name
{
	//INFO( @"'%@'", [name stringByReplacingOccurrencesOfString:@"notify." withString:@""] );
    
	[[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
	return YES;
}

+ (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object
{
	[[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
	return YES;
}

- (BOOL)postNotification:(NSString *)name
{
	return [[self class] postNotification:name];
}

- (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object
{
	return [[self class] postNotification:name withObject:object];
}

@end
