//
//  NSData+ZEExtension.h
//  ZEKit
//
//  Created by zwein on 6/9/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//


#import "ZEPrecompile.h"

#pragma mark -

@interface NSData(ZEExtension)

@property (nonatomic, readonly) NSData *	MD5;
@property (nonatomic, readonly) NSString *	MD5String;

+ (NSString *)fromResource:(NSString *)resName;

@end
