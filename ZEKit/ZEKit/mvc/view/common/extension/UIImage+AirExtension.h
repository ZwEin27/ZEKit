//
//  UIImage+AirExtension.h
//  Boodex
//
//  Created by zwein on 5/26/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//


#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "ZEPrecompile.h"
#import "ZEFoundation.h"

#pragma mark -

#undef	__IMAGE
#define __IMAGE( __name )	[UIImage imageNamed:__name]

#pragma mark -

@interface UIImage(Theme)

- (UIImage *)transprent;

- (UIImage *)rounded;
- (UIImage *)rounded:(CGRect)rect;

- (UIImage *)stretched;
- (UIImage *)stretched:(UIEdgeInsets)capInsets;

- (UIImage *)rotate:(CGFloat)angle;
- (UIImage *)rotateCW90;
- (UIImage *)rotateCW180;
- (UIImage *)rotateCW270;

- (UIImage *)grayscale;

- (UIColor *)patternColor;

- (UIImage *)crop:(CGRect)rect;
- (UIImage *)imageInRect:(CGRect)rect;

+ (UIImage *)imageFromString:(NSString *)name;
+ (UIImage *)imageFromString:(NSString *)name atPath:(NSString *)path;
+ (UIImage *)imageFromString:(NSString *)name stretched:(UIEdgeInsets)capInsets;
+ (UIImage *)imageFromVideo:(NSURL *)videoURL atTime:(CMTime)time scale:(CGFloat)scale;

+ (UIImage *)merge:(NSArray *)images;
- (UIImage *)merge:(UIImage *)image;
- (UIImage *)resize:(CGSize)newSize;

- (NSData *)dataWithExt:(NSString *)ext;

- (UIImage *)fixOrientation;

@end

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)