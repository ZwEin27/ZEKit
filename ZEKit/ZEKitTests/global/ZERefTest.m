//
//  ZERefTest.m
//  ZEKit
//
//  Created by zwein on 6/4/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "Kiwi.h"
#import "ZEKit.h"

SPEC_BEGIN(ZEKitRefSpec)

describe(@"Using ZELog in project", ^{
    context(@"when load log profile", ^{
        LOAD_ZEKit_CONFIG
        it(@"should print function name, line number and custom message", ^{
            DDLogVerbose(@"Verbose");
            DDLogDebug(@"Debug");
            DDLogInfo(@"Info");
            DDLogWarn(@"Warn");
            DDLogError(@"Error");
        });
    });
});

SPEC_END
