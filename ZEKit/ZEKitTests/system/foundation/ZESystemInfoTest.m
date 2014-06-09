//
//  ZESystemInfoTest.m
//  ZEKit
//
//  Created by zwein on 6/5/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "Kiwi.h"
#import "ZEKit.h"



SPEC_BEGIN(ZESystemInfoSpec)

describe(@"ZESystemInfo Test", ^{
    context(@"when judge system version in using simulator ios7", ^{
        it(@"should return true", ^{
            [[theValue(IOS8_OR_LATER) should] beZero];
            [[theValue(IOS7_OR_LATER) should] beTrue];
            [[theValue(IOS6_OR_LATER) should] beTrue];
        });
    });
    
    context(@"when judge screen inch in using 3.5inch simulator", ^{
        it(@"should return true", ^{
            [[theValue(IS_SCREEN_35_INCH) should] beTrue];
        });
        it(@"should return false", ^{
            [[theValue(IS_SCREEN_4_INCH) should] beZero];
        });
    });
    
    context(@"when get system info", ^{
        it(@"should return result", ^{
            DDLogVerbose(@"OSVersion: %@", [ZESystemInfo OSVersion]);
            DDLogVerbose(@"appVersion: %@", [ZESystemInfo appVersion]);
            DDLogVerbose(@"appIdentifier: %@", [ZESystemInfo appIdentifier]);
            DDLogVerbose(@"appSchema: %@", [ZESystemInfo appSchema]);
            DDLogVerbose(@"deviceModel: %@", [ZESystemInfo deviceModel]);
        });
    });
    
});

SPEC_END
