//
//  LumberjackTest.m
//  ZEKit
//
//  Created by zwein on 6/3/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "Kiwi.h"
//#import "Lumberjack.h"
#import "ZEPrecompile.h"

// Log levels: off, error, warn, info, verbose
//static const int ddLogLevel = LOG_LEVEL_VERBOSE;

SPEC_BEGIN(LumberjackSpec)

describe(@"Lumberjack's DDTTYLogger", ^{
    context(@"when using default color configuration", ^{
        it(@"should output specific text color for various log level", ^{
            
            [DDLog addLogger:[DDTTYLogger sharedInstance]];
            [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
            
            
            #if TARGET_OS_IPHONE
                UIColor *red = [UIColor colorWithRed:(205/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0]; //红色
                UIColor *magenta = [UIColor colorWithRed:(205/255.0) green:(0/255.0) blue:(205/255.0) alpha:1.0];   //洋红色
                UIColor *yellow = [UIColor colorWithRed:(205/255.0) green:(205/255.0) blue:(0/255.0) alpha:1.0];    //黄色
                UIColor *cyan = [UIColor colorWithRed:(0/255.0) green:(205/255.0) blue:(205/255.0) alpha:1.0];      //淡蓝色
                UIColor *green = [UIColor colorWithRed:(0/255.0) green:(205/255.0) blue:(0/255.0) alpha:1.0];       //绿色
                UIColor *pink = [UIColor colorWithRed:(255/255.0) green:(58/255.0) blue:(159/255.0) alpha:1.0];     //紫色
            #else
                NSColor *red = [NSColor colorWithCalibratedRed:(255/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0];
                NSColor *magenta = [NSColor colorWithCalibratedRed:(255/255.0) green:(0/255.0) blue:(205/255.0) alpha:1.0];
                NSColor *yellow = [NSColor colorWithCalibratedRed:(205/255.0) green:(205/255.0) blue:(0/255.0) alpha:1.0];
                NSColor *cyan = [NSColor colorWithCalibratedRed:(0/255.0) green:(0/255.0) blue:(238/255.0) alpha:1.0];
                NSColor *green = [NSColor colorWithCalibratedRed:(0/255.0) green:(205/255.0) blue:(0/255.0) alpha:1.0];
                NSColor *pink = [NSColor colorWithCalibratedRed:(255/255.0) green:(58/255.0) blue:(159/255.0) alpha:1.0];
            #endif
            
            [[DDTTYLogger sharedInstance] setForegroundColor:cyan backgroundColor:nil forFlag:LOG_FLAG_VERBOSE];
            [[DDTTYLogger sharedInstance] setForegroundColor:magenta backgroundColor:nil forFlag:LOG_FLAG_DEBUG];
            [[DDTTYLogger sharedInstance] setForegroundColor:green backgroundColor:nil forFlag:LOG_FLAG_INFO];
            [[DDTTYLogger sharedInstance] setForegroundColor:yellow backgroundColor:nil forFlag:LOG_FLAG_WARN];
            [[DDTTYLogger sharedInstance] setForegroundColor:red backgroundColor:nil forFlag:LOG_FLAG_ERROR];

//#define ZELogEmpty(frmt, ...)   ZEEmpty((@"empty" fmt), ##__VA_ARGS__);
//    
//#if defined (DEBUG) && (DEBUG == 1)
//     #define ZELogDebug DDLogDebug
//#else
//     #define ZELogDebug
//#endif  // #if defined (DEBUG) && (DEBUG == 1)
            
            DDLogVerbose(@"Verbose");
            DDLogDebug(@"Debug");
            DDLogInfo(@"Info");
            DDLogWarn(@"Warn");
            DDLogError(@"Error");

            
        });
    });
    
});

SPEC_END
