//
//  ZELog.h
//  ZEKit
//
//  Created by zwein on 6/3/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//
#import "Lumberjack.h"
#import "ZEPrecompile.h"
#import "UIColor+iOS7Colors.h"
//#import "EDColor.h"


#pragma mark - Lumberjack Configuration



/**
 *  ZEKit_LOG_LEVEL is value for ddLogLevel
 *  Config ddLogLevel
 *  You can choose various log levels, such as verbose, debug, info, warn or error
 *  Depend on the ddLogLevel value assigned, log output can be diffirent.
 */
#undef ZEKit_LOG_LEVEL
#if ( __ON__ == __ZEKIT_LOG__ )
#define ZEKit_LOG_LEVEL LOG_LEVEL_VERBOSE
#else
#define ZEKit_LOG_LEVEL LOG_LEVEL_WARN
#endif
static const int ddLogLevel = ZEKit_LOG_LEVEL;


#undef LOAD_LOG_CONFIG
#define LOAD_LOG_CONFIG    \
    [DDLog addLogger:[DDTTYLogger sharedInstance]];     \
    ZELogFormatter *formatter = [[ZELogFormatter alloc] init];     \
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];     \
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];     \
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor iOS7greenColor] backgroundColor:nil forFlag:LOG_FLAG_VERBOSE];     \
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor iOS7pinkColor] backgroundColor:nil forFlag:LOG_FLAG_DEBUG];     \
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor iOS7lightBlueColor] backgroundColor:nil forFlag:LOG_FLAG_INFO];     \
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor iOS7orangeColor] backgroundColor:nil forFlag:LOG_FLAG_WARN];     \
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor iOS7redColor] backgroundColor:nil forFlag:LOG_FLAG_ERROR];




@interface ZELog : NSObject


@end


/**
 *  Custom log formatter for using Lumberjack
 */
@interface ZELogFormatter : NSObject <DDLogFormatter>

@end
