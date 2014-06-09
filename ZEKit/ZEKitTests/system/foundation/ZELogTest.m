//
//  ZELogTest.m
//  ZEKit
//
//  Created by zwein on 6/3/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "Kiwi.h"
#import "ZELog.h"



SPEC_BEGIN(ZELogSpec)

describe(@"ZELog Test", ^{
    
    context(@"when initial ZELog configuaration", ^{
        it(@"should print function name, line number and custom message", ^{
            
            LOAD_LOG_CONFIG
            
            DDLogVerbose(@"Verbose");
            DDLogDebug(@"Debug");
            DDLogInfo(@"Info");
            DDLogWarn(@"Warn");
            DDLogError(@"Error");
            
        });
    });
    
});

SPEC_END