//
//  ZERuntime.h
//  ZEKit
//
//  Created by zwein on 6/6/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZEPrecompile.h"
#import "NSObject+ZEProperty.h"


#pragma mark -

#undef	PRINT_CALLSTACK
#define PRINT_CALLSTACK( __n )	[ZERuntime printCallstack:__n]

#undef	BREAK_POINT
#define BREAK_POINT()			[ZERuntime breakPoint];

#undef	BREAK_POINT_IF
#define BREAK_POINT_IF( __x )	if ( __x ) { [ZERuntime breakPoint]; }

#undef	BB
#define BB						[ZERuntime breakPoint];

#pragma mark -

@interface ZETypeEncoding : NSObject

AS_INT( UNKNOWN )
AS_INT( OBJECT )
AS_INT( NSNUMBER )
AS_INT( NSSTRING )
AS_INT( NSARRAY )
AS_INT( NSDICTIONARY )
AS_INT( NSDATE )

+ (NSUInteger)typeOf:(const char *)attr;
+ (NSUInteger)typeOfAttribute:(const char *)attr;
+ (NSUInteger)typeOfObject:(id)obj;

+ (NSString *)classNameOf:(const char *)attr;
+ (NSString *)classNameOfAttribute:(const char *)attr;

+ (Class)classOfAttribute:(const char *)attr;

+ (BOOL)isAtomClass:(Class)clazz;

@end

#pragma mark -

@interface ZECallFrame : NSObject

AS_INT( TYPE_UNKNOWN )
AS_INT( TYPE_OBJC )
AS_INT( TYPE_NATIVEC )

@property (nonatomic, assign) NSUInteger	type;
@property (nonatomic, retain) NSString *	process;
@property (nonatomic, assign) NSUInteger	entry;
@property (nonatomic, assign) NSUInteger	offset;
@property (nonatomic, retain) NSString *	clazz;
@property (nonatomic, retain) NSString *	method;

+ (id)parse:(NSString *)line;
+ (id)unknown;

@end

#pragma mark -

@interface ZERuntime : NSObject

@property (nonatomic, readonly) NSArray *	allClasses;
@property (nonatomic, readonly) NSArray *	callstack;
@property (nonatomic, readonly) NSArray *	callframes;

AS_SINGLETON( ZERuntime )

+ (id)allocByClass:(Class)clazz;
+ (id)allocByClassName:(NSString *)clazzName;

+ (NSArray *)allClasses;
+ (NSArray *)allSubClassesOf:(Class)clazz;

+ (NSArray *)allInstanceMethodsOf:(Class)clazz;
+ (NSArray *)allInstanceMethodsOf:(Class)clazz withPrefix:(NSString *)prefix;

+ (NSArray *)callstack:(NSUInteger)depth;
+ (NSArray *)callframes:(NSUInteger)depth;

+ (void)printCallstack:(NSUInteger)depth;
+ (void)breakPoint;

@end
