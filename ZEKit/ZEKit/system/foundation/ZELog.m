//
//  ZELog.m
//  ZEKit
//
//  Created by zwein on 6/3/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZELog.h"

@implementation ZELog

@end


/**
 * For more information about creating custom formatters, see the wiki article:
 * https://github.com/CocoaLumberjack/CocoaLumberjack/wiki/CustomFormatters
 **/
@implementation ZELogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    switch (logMessage->logFlag)
    {
        case LOG_FLAG_ERROR : logLevel = @"ERROR"; break;
        case LOG_FLAG_WARN  : logLevel = @"WARN"; break;
        case LOG_FLAG_INFO  : logLevel = @"INFO"; break;
        case LOG_FLAG_DEBUG : logLevel = @"DEBUG"; break;
        default             : logLevel = @"VERBOSE"; break;
    }
    return [NSString stringWithFormat:@"%@: %@ -> %s @ %i | %@",
            logLevel, [logMessage fileName], logMessage->function, logMessage->lineNumber, logMessage->logMsg];
}

@end