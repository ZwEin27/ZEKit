//
//  ZERuntime.m
//  ZEKit
//
//  Created by zwein on 6/6/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZERuntime.h"
#import "ZELog.h"
#import "NSArray+ZEExtension.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

#undef	MAX_CALLSTACK_DEPTH
#define MAX_CALLSTACK_DEPTH	(64)

#pragma mark -

@implementation ZETypeEncoding

DEF_INT( UNKNOWN,		0 )
DEF_INT( OBJECT,		1 )
DEF_INT( NSNUMBER,		2 )
DEF_INT( NSSTRING,		3 )
DEF_INT( NSARRAY,		4 )
DEF_INT( NSDICTIONARY,	5 )
DEF_INT( NSDATE,		6 )

+ (NSUInteger)typeOf:(const char *)attr
{
	if ( attr[0] != 'T' )
		return ZETypeEncoding.UNKNOWN;
	
	const char * type = &attr[1];
	if ( type[0] == '@' )
	{
		if ( type[1] != '"' )
			return ZETypeEncoding.UNKNOWN;
		
		char typeClazz[128] = { 0 };
		
		const char * clazz = &type[2];
		const char * clazzEnd = strchr( clazz, '"' );
		
		if ( clazzEnd && clazz != clazzEnd )
		{
			unsigned int size = (unsigned int)(clazzEnd - clazz);
			strncpy( &typeClazz[0], clazz, size );
		}
		
		if ( 0 == strcmp((const char *)typeClazz, "NSNumber") )
		{
			return ZETypeEncoding.NSNUMBER;
		}
		else if ( 0 == strcmp((const char *)typeClazz, "NSString") )
		{
			return ZETypeEncoding.NSSTRING;
		}
		else if ( 0 == strcmp((const char *)typeClazz, "NSDate") )
		{
			return ZETypeEncoding.NSDATE;
		}
		else if ( 0 == strcmp((const char *)typeClazz, "NSArray") )
		{
			return ZETypeEncoding.NSARRAY;
		}
		else if ( 0 == strcmp((const char *)typeClazz, "NSDictionary") )
		{
			return ZETypeEncoding.NSDICTIONARY;
		}
		else
		{
			return ZETypeEncoding.OBJECT;
		}
	}
	else if ( type[0] == '[' )
	{
		return ZETypeEncoding.UNKNOWN;
	}
	else if ( type[0] == '{' )
	{
		return ZETypeEncoding.UNKNOWN;
	}
	else
	{
		if ( type[0] == 'c' || type[0] == 'C' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == 'i' || type[0] == 's' || type[0] == 'l' || type[0] == 'q' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == 'I' || type[0] == 'S' || type[0] == 'L' || type[0] == 'Q' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == 'f' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == 'd' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == 'B' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == 'v' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == '*' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == ':' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( 0 == strcmp(type, "bnum") )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == '^' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else if ( type[0] == '?' )
		{
			return ZETypeEncoding.UNKNOWN;
		}
		else
		{
			return ZETypeEncoding.UNKNOWN;
		}
	}
	
	return ZETypeEncoding.UNKNOWN;
}

+ (NSUInteger)typeOfAttribute:(const char *)attr
{
	return [self typeOf:attr];
}

+ (NSUInteger)typeOfObject:(id)obj
{
	if ( nil == obj )
		return ZETypeEncoding.UNKNOWN;
	
	if ( [obj isKindOfClass:[NSNumber class]] )
	{
		return ZETypeEncoding.NSNUMBER;
	}
	else if ( [obj isKindOfClass:[NSString class]] )
	{
		return ZETypeEncoding.NSSTRING;
	}
	else if ( [obj isKindOfClass:[NSArray class]] )
	{
		return ZETypeEncoding.NSARRAY;
	}
	else if ( [obj isKindOfClass:[NSDictionary class]] )
	{
		return ZETypeEncoding.NSDICTIONARY;
	}
	else if ( [obj isKindOfClass:[NSDate class]] )
	{
		return ZETypeEncoding.NSDATE;
	}
	else if ( [obj isKindOfClass:[NSObject class]] )
	{
		return ZETypeEncoding.OBJECT;
	}
	
	return ZETypeEncoding.UNKNOWN;
}

+ (NSString *)classNameOf:(const char *)attr
{
	if ( attr[0] != 'T' )
		return nil;
	
	const char * type = &attr[1];
	if ( type[0] == '@' )
	{
		if ( type[1] != '"' )
			return nil;
		
		char typeClazz[128] = { 0 };
		
		const char * clazz = &type[2];
		const char * clazzEnd = strchr( clazz, '"' );
		
		if ( clazzEnd && clazz != clazzEnd )
		{
			unsigned int size = (unsigned int)(clazzEnd - clazz);
			strncpy( &typeClazz[0], clazz, size );
		}
		
		return [NSString stringWithUTF8String:typeClazz];
	}
	
	return nil;
}

+ (NSString *)classNameOfAttribute:(const char *)attr
{
	return [self classNameOf:attr];
}

+ (Class)classOfAttribute:(const char *)attr
{
	NSString * className = [self classNameOf:attr];
	if ( nil == className )
		return nil;
	
	return NSClassFromString( className );
}

+ (BOOL)isAtomClass:(Class)clazz
{
	if ( clazz == [NSArray class] || [[clazz description] isEqualToString:@"__NSCFArray"] )
		return YES;
	if ( clazz == [NSData class] )
		return YES;
	if ( clazz == [NSDate class] )
		return YES;
	if ( clazz == [NSDictionary class] )
		return YES;
	if ( clazz == [NSNull class] )
		return YES;
	if ( clazz == [NSNumber class] || [[clazz description] isEqualToString:@"__NSCFNumber"] )
		return YES;
	if ( clazz == [NSObject class] )
		return YES;
	if ( clazz == [NSString class] )
		return YES;
	if ( clazz == [NSURL class] )
		return YES;
	if ( clazz == [NSValue class] )
		return YES;
	
	return NO;
}

@end

#pragma mark -

@interface ZECallFrame()
{
	NSUInteger			_type;
	NSString *			_process;
	NSUInteger			_entry;
	NSUInteger			_offset;
	NSString *			_clazz;
	NSString *			_method;
}

+ (NSUInteger)hex:(NSString *)text;
+ (id)parseFormat1:(NSString *)line;
+ (id)parseFormat2:(NSString *)line;

@end

#pragma mark -

@implementation ZECallFrame

DEF_INT( TYPE_UNKNOWN,	0 )
DEF_INT( TYPE_OBJC,		1 )
DEF_INT( TYPE_NATIVEC,	2 )

@synthesize type = _type;
@synthesize process = _process;
@synthesize entry = _entry;
@synthesize offset = _offset;
@synthesize clazz = _clazz;
@synthesize method = _method;

- (NSString *)description
{
	if ( ZECallFrame.TYPE_OBJC == _type )
	{
		return [NSString stringWithFormat:@"[O] %@(0x%08x + %llu) -> [%@ %@]", _process, (unsigned int)_entry, (unsigned long long)_offset, _clazz, _method];
	}
	else if ( ZECallFrame.TYPE_NATIVEC == _type )
	{
		return [NSString stringWithFormat:@"[C] %@(0x%08x + %llu) -> %@", _process, (unsigned int)_entry, (unsigned long long)_offset, _method];
	}
	else
	{
		return [NSString stringWithFormat:@"[X] <unknown>(0x%08x + %llu)", (unsigned int)_entry, (unsigned long long)_offset];
	}
}

+ (NSUInteger)hex:(NSString *)text
{
	unsigned int number = 0;
	[[NSScanner scannerWithString:text] scanHexInt:&number];
	return (NSUInteger)number;
}

+ (id)parseFormat1:(NSString *)line
{
    //	example: peeper  0x00001eca -[PPAppDelegate application:didFinishLaunchingWithOptions:] + 106
	NSError * error = NULL;
	NSString * expr = @"^[0-9]*\\s*([a-z0-9_]+)\\s+(0x[0-9a-f]+)\\s+-\\[([a-z0-9_]+)\\s+([a-z0-9_:]+)]\\s+\\+\\s+([0-9]+)$";
	NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:expr options:NSRegularExpressionCaseInsensitive error:&error];
	NSTextCheckingResult * result = [regex firstMatchInString:line options:0 range:NSMakeRange(0, [line length])];
	if ( result && (regex.numberOfCaptureGroups + 1) == result.numberOfRanges )
	{
		ZECallFrame * frame = [[ZECallFrame alloc] init];
		frame.type = ZECallFrame.TYPE_OBJC;
		frame.process = [line substringWithRange:[result rangeAtIndex:1]];
		frame.entry = [ZECallFrame hex:[line substringWithRange:[result rangeAtIndex:2]]];
		frame.clazz = [line substringWithRange:[result rangeAtIndex:3]];
		frame.method = [line substringWithRange:[result rangeAtIndex:4]];
		frame.offset = [[line substringWithRange:[result rangeAtIndex:5]] intValue];
		return frame;
	}
	
	return nil;
}

+ (id)parseFormat2:(NSString *)line
{
    //	example: UIKit 0x0105f42e UIApplicationMain + 1160
	NSError * error = NULL;
	NSString * expr = @"^[0-9]*\\s*([a-z0-9_]+)\\s+(0x[0-9a-f]+)\\s+([a-z0-9_]+)\\s+\\+\\s+([0-9]+)$";
	NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:expr options:NSRegularExpressionCaseInsensitive error:&error];
	NSTextCheckingResult * result = [regex firstMatchInString:line options:0 range:NSMakeRange(0, [line length])];
	if ( result && (regex.numberOfCaptureGroups + 1) == result.numberOfRanges )
	{
		ZECallFrame * frame = [[ZECallFrame alloc] init];
		frame.type = ZECallFrame.TYPE_NATIVEC;
		frame.process = [line substringWithRange:[result rangeAtIndex:1]];
		frame.entry = [self hex:[line substringWithRange:[result rangeAtIndex:2]]];
		frame.clazz = nil;
		frame.method = [line substringWithRange:[result rangeAtIndex:3]];
		frame.offset = [[line substringWithRange:[result rangeAtIndex:4]] intValue];
		return frame;
	}
	
	return nil;
}

+ (id)unknown
{
	ZECallFrame * frame = [[ZECallFrame alloc] init];
	frame.type = ZECallFrame.TYPE_UNKNOWN;
	return frame;
}

+ (id)parse:(NSString *)line
{
	if ( 0 == [line length] )
		return nil;
    
	id frame1 = [ZECallFrame parseFormat1:line];
	if ( frame1 )
		return frame1;
	
	id frame2 = [ZECallFrame parseFormat2:line];
	if ( frame2 )
		return frame2;
    
	return [ZECallFrame unknown];
}

//- (void)dealloc
//{
//	[_process release];
//	[_clazz release];
//	[_method release];
//    
//	[super dealloc];
//}

@end

#pragma mark -

static void __uncaughtExceptionHandler( NSException * exception )
{
	//DDLogError( @"uncaught exception: %@\n%@", exception, [exception callStackSymbols] );
}

#pragma mark -

@implementation ZERuntime

@dynamic allClasses;
@dynamic callstack;
@dynamic callframes;

DEF_SINGLETON( ZERuntime )

+ (void)load
{
	NSSetUncaughtExceptionHandler( &__uncaughtExceptionHandler );
}

+ (id)allocByClass:(Class)clazz
{
	if ( nil == clazz )
		return nil;
	
	return [clazz alloc];
}

+ (id)allocByClassName:(NSString *)clazzName
{
	if ( nil == clazzName || 0 == [clazzName length] )
		return nil;
	
	Class clazz = NSClassFromString( clazzName );
	if ( nil == clazz )
		return nil;
	
	return [clazz alloc];
}

+ (NSArray *)allClasses
{
	static NSMutableArray * __allClasses = nil;
	
	if ( nil == __allClasses )
	{
		__allClasses = [NSMutableArray nonRetainingArray];
	}
	
	if ( 0 == __allClasses.count )
	{
		static const char * __blackList[] =
		{
			"AGActionSheet",
			"AGShareActionSheet",
			"AGAlertView",
			"AGSharePublishContentView",
			"AG_SKJDictionary",
			"AG_SKJSerializer",
			"AG_SKJSONDecoder",
			"AG_SKJDictionaryEnumerator",
			"AG_SKJArray",
			"AGCommon",
			"AGShareItemView",
			"AGSharePageContentView",
			"AGBackground"
		};
        
		unsigned int	classesCount = 0;
		Class *			classes = objc_copyClassList( &classesCount );
		
		for ( unsigned int i = 0; i < classesCount; ++i )
		{
			Class classType = classes[i];
			Class superClass = class_getSuperclass( classType );
			
			if ( nil == superClass )
				continue;
            //			if ( NO == class_conformsToProtocol( classType, @protocol(NSObject)) )
            //				continue;
			if ( NO == class_respondsToSelector( classType, @selector(doesNotRecognizeSelector:) ) )
				continue;
			if ( NO == class_respondsToSelector( classType, @selector(methodSignatureForSelector:) ) )
				continue;
            //			if ( class_respondsToSelector( classType, @selector(initialize) ) )
            //				continue;
            //			if ( NO == [classType isSubclassOfClass:[NSObject class]] )
            //				continue;
            
			BOOL			isBlack = NO;
			const char *	className = class_getName( classType );
			NSInteger		listSize = sizeof( __blackList ) / sizeof( __blackList[0] );
            
			for ( int i = 0; i < listSize; ++i )
			{
				if ( 0 == strcmp( className, __blackList[i] ) )
				{
					isBlack = YES;
					break;
				}
			}
			
			if ( isBlack )
				continue;
            
			[__allClasses addObject:classType];
		}
		
		free( classes );
	}
	
	return __allClasses;
}

+ (NSArray *)allSubClassesOf:(Class)superClass
{
	NSMutableArray * results = [[NSMutableArray alloc] init];
	
	for ( Class classType in [self allClasses] )
	{
		if ( classType == superClass )
			continue;
		
		if ( NO == [classType isSubclassOfClass:superClass] )
			continue;
        
		[results addObject:classType];
	}
	
	return results;
}

+ (NSArray *)allInstanceMethodsOf:(Class)clazz
{
	static NSMutableDictionary * __cache = nil;
	
	if ( nil == __cache )
	{
		__cache = [[NSMutableDictionary alloc] init];
	}
	
	NSMutableArray * methodNames = [__cache objectForKey:[clazz description]];
	if ( nil == methodNames )
	{
		methodNames = [NSMutableArray array];
		
		Class thisClass = clazz;
		
		while ( NULL != thisClass )
		{
			unsigned int	methodCount = 0;
			Method *		methods = class_copyMethodList( thisClass, &methodCount );
            
			for ( unsigned int i = 0; i < methodCount; ++i )
			{
				SEL selector = method_getName( methods[i] );
				if ( selector )
				{
					const char * cstrName = sel_getName(selector);
					if ( NULL == cstrName )
						continue;
					
					NSString * selectorName = [NSString stringWithUTF8String:cstrName];
					if ( NULL == selectorName )
						continue;
                    
					[methodNames addObject:selectorName];
				}
			}
            
			thisClass = class_getSuperclass( thisClass );
			if ( thisClass == [NSObject class] )
			{
				break;
			}
		}
		
		[__cache setObject:methodNames forKey:[clazz description]];
	}
	
	return methodNames;
}

+ (NSArray *)allInstanceMethodsOf:(Class)clazz withPrefix:(NSString *)prefix
{
	NSArray * methods = [self allInstanceMethodsOf:clazz];
	if ( nil == methods || 0 == methods.count )
	{
		return nil;
	}
	
	if ( nil == prefix )
	{
		return methods;
	}
	
	NSMutableArray * result = [NSMutableArray array];
	
	for ( NSString * selectorName in methods )
	{
		if ( NO == [selectorName hasPrefix:prefix] )
		{
			continue;
		}
		
		[result addObject:selectorName];
	}
	
	return result;
}

+ (NSArray *)callstack:(NSUInteger)depth
{
	NSMutableArray * array = [[NSMutableArray alloc] init];
	
	void * stacks[MAX_CALLSTACK_DEPTH] = { 0 };
    
	depth = backtrace( stacks, (int)((depth > MAX_CALLSTACK_DEPTH) ? MAX_CALLSTACK_DEPTH : depth) );
	if ( depth )
	{
		char ** symbols = backtrace_symbols( stacks, (int)depth );
		if ( symbols )
		{
			for ( int i = 0; i < depth; ++i )
			{
				NSString * symbol = [NSString stringWithUTF8String:(const char *)symbols[i]];
				if ( 0 == [symbol length] )
					continue;
                
				NSRange range1 = [symbol rangeOfString:@"["];
				NSRange range2 = [symbol rangeOfString:@"]"];
                
				if ( range1.length > 0 && range2.length > 0 )
				{
					NSRange range3;
					range3.location = range1.location;
					range3.length = range2.location + range2.length - range1.location;
					[array addObject:[symbol substringWithRange:range3]];
				}
				else
				{
					[array addObject:symbol];
				}
			}
            
			free( symbols );
		}
	}
	
	return array;
}

+ (NSArray *)callframes:(NSUInteger)depth
{
	NSMutableArray * array = [[NSMutableArray alloc] init];
	
	void * stacks[MAX_CALLSTACK_DEPTH] = { 0 };
	
	depth = backtrace( stacks, (int)((depth > MAX_CALLSTACK_DEPTH) ? MAX_CALLSTACK_DEPTH : depth) );
	if ( depth )
	{
		char ** symbols = backtrace_symbols( stacks, (int)depth );
		if ( symbols )
		{
			for ( int i = 0; i < depth; ++i )
			{
				NSString * line = [NSString stringWithUTF8String:(const char *)symbols[i]];
				if ( 0 == [line length] )
					continue;
                
				ZECallFrame * frame = [ZECallFrame parse:line];
				if ( nil == frame )
					continue;
				
				[array addObject:frame];
			}
			
			free( symbols );
		}
	}
	
	return array;
}

+ (void)printCallstack:(NSUInteger)depth
{
	NSArray * callstack = [self callstack:depth];
	if ( callstack && callstack.count )
	{
		//VAR_DUMP( callstack );
	}
}

+ (void)breakPoint
{
#if __ZE_DEVELOPMENT__
#if defined(__ppc__)
	asm("trap");
#elif defined(__i386__)
	asm("int3");
#endif	// #elif defined(__i386__)
#endif	// #if __ZE_DEVELOPMENT__
}

- (NSArray *)allClasses
{
	return [ZERuntime allClasses];
}

- (NSArray *)callstack
{
	return [ZERuntime callstack:MAX_CALLSTACK_DEPTH];
}

- (NSArray *)callframes
{
	return [ZERuntime callframes:MAX_CALLSTACK_DEPTH];
}

@end