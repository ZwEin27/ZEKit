//
//  ZEPrecompile.h
//  ZEKit
//
//  Created by zwein on 6/3/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#ifndef ZEKit_ZEPrecompile_h
#define ZEKit_ZEPrecompile_h

// ----------------------------------
// Global include headers
// ----------------------------------

#import <stdio.h>
#import <stdlib.h>
#import <stdint.h>
#import <string.h>
#import <assert.h>
#import <errno.h>

#import <sys/errno.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <sys/types.h>
#import <sys/socket.h>

#import <math.h>
#import <unistd.h>
#import <limits.h>
#import <execinfo.h>

#import <netdb.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <ifaddrs.h>

#import <mach/mach.h>
#import <malloc/malloc.h>
//#import <libxml/tree.h>

#ifdef __OBJC__

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import <TargetConditionals.h>

#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreImage/CoreImage.h>
#import <CoreLocation/CoreLocation.h>

#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>
#import <WebKit/WebKit.h>

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <objc/runtime.h>
#import <objc/message.h>
#import <CommonCrypto/CommonDigest.h>

#endif	// #ifdef __OBJC__


// ----------------------------------
// Option Values
// ----------------------------------

#pragma mark - Option Values

#undef	__ON__
#define __ON__		(1)

#undef	__OFF__
#define __OFF__		(0)

#undef	__AUTO__

#if defined (DEBUG) && (DEBUG == 1)
#define __AUTO__	(1)
#else
#define __AUTO__	(0)
#endif  // #if defined(_DEBUG) || defined(DEBUG)

// ----------------------------------
// Global Compile Option
// ----------------------------------

#pragma mark - Global Compile Option

#define __ZEKIT_DEVELOPMENT__				(__AUTO__)      //not use
#define __ZEKIT_LOG__						(__AUTO__)




//
//#if defined(__ZEKIT_LOG__) && __ZEKIT_LOG__
//#undef	NSLog
//#define	NSLog	ZELog
//#endif	// #if (__ON__ == __ZEKIT_LOG__)


#endif // ZEKit_ZEPrecompile_h

// ----------------------------------
// Preload headers
// ----------------------------------

#import "ZEVendor.h"

