//
//  UIFont+AirExtension.h
//  Boodex
//
//  Created by zwein on 5/26/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "ZEPrecompile.h"
#import "ZEFoundation.h"

#pragma mark -

@interface UIFont(Theme)

+ (void)setFontName:(NSString *)name;
+ (void)setBoldFontName:(NSString *)name;
+ (void)setItalicFontName:(NSString *)name;

+ (UIFont *)fontFromString:(NSString *)text;

@end

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)