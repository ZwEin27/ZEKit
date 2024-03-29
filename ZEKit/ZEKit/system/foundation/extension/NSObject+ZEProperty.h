//
//  NSObject+ZEProperty.h
//  ZEKit
//
//  Created by zwein on 6/5/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZEPrecompile.h"

#pragma mark - Property


// STATIC_PROPERTY

#undef	AS_STATIC_PROPERTY
#define AS_STATIC_PROPERTY( __name ) \
- (NSString *)__name; \
+ (NSString *)__name;

#if __has_feature(objc_arc)

#undef	DEF_STATIC_PROPERTY
#define DEF_STATIC_PROPERTY( __name ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%s", #__name]; \
}

#else   // #if __has_feature(objc_arc)

#undef	DEF_STATIC_PROPERTY
#define DEF_STATIC_PROPERTY( __name ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%s", #__name]; \
}

#endif  //#if __has_feature(objc_arc)


// STATIC_PROPERTY2

#if __has_feature(objc_arc)

#undef	DEF_STATIC_PROPERTY2
#define DEF_STATIC_PROPERTY2( __name, __prefix ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%s", __prefix, #__name]; \
}

#else

#undef	DEF_STATIC_PROPERTY2
#define DEF_STATIC_PROPERTY2( __name, __prefix ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%s", __prefix, #__name]; \
}

#endif


// STATIC_PROPERTY3

#if __has_feature(objc_arc)

#undef	DEF_STATIC_PROPERTY3
#define DEF_STATIC_PROPERTY3( __name, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__name]; \
}

#else

#undef	DEF_STATIC_PROPERTY3
#define DEF_STATIC_PROPERTY3( __name, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__name]; \
}

#endif


// STATIC_PROPERTY4

#if __has_feature(objc_arc)

#undef	DEF_STATIC_PROPERTY4
#define DEF_STATIC_PROPERTY4( __name, __value, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__value]; \
}

#else

#undef	DEF_STATIC_PROPERTY4
#define DEF_STATIC_PROPERTY4( __name, __value, __prefix, __prefix2 ) \
- (NSString *)__name \
{ \
return (NSString *)[[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return [NSString stringWithFormat:@"%@.%@.%s", __prefix, __prefix2, #__value]; \
}

#endif

#pragma mark - NSInteger

#undef	AS_STATIC_PROPERTY_INT
#define AS_STATIC_PROPERTY_INT( __name ) \
- (NSInteger)__name; \
+ (NSInteger)__name;

#undef	DEF_STATIC_PROPERTY_INT
#define DEF_STATIC_PROPERTY_INT( __name, __value ) \
- (NSInteger)__name \
{ \
return (NSInteger)[[self class] __name]; \
} \
+ (NSInteger)__name \
{ \
return __value; \
}

#undef	AS_INT
#define AS_INT	AS_STATIC_PROPERTY_INT

#undef	DEF_INT
#define DEF_INT	DEF_STATIC_PROPERTY_INT

#pragma mark - NSNumber

#undef	AS_STATIC_PROPERTY_NUMBER
#define AS_STATIC_PROPERTY_NUMBER( __name ) \
- (NSNumber *)__name; \
+ (NSNumber *)__name;

#undef	DEF_STATIC_PROPERTY_NUMBER
#define DEF_STATIC_PROPERTY_NUMBER( __name, __value ) \
- (NSNumber *)__name \
{ \
return (NSNumber *)[[self class] __name]; \
} \
+ (NSNumber *)__name \
{ \
return [NSNumber numberWithInt:__value]; \
}

#undef	AS_NUMBER
#define AS_NUMBER	AS_STATIC_PROPERTY_NUMBER

#undef	DEF_NUMBER
#define DEF_NUMBER	DEF_STATIC_PROPERTY_NUMBER

#pragma mark - NSString

#undef	AS_STATIC_PROPERTY_STRING
#define AS_STATIC_PROPERTY_STRING( __name ) \
- (NSString *)__name; \
+ (NSString *)__name;

#undef	DEF_STATIC_PROPERTY_STRING
#define DEF_STATIC_PROPERTY_STRING( __name, __value ) \
- (NSString *)__name \
{ \
return [[self class] __name]; \
} \
+ (NSString *)__name \
{ \
return __value; \
}

#undef	AS_STRING
#define AS_STRING	AS_STATIC_PROPERTY_STRING

#undef	DEF_STRING
#define DEF_STRING	DEF_STATIC_PROPERTY_STRING
