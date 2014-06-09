//
//  ZEReachabilityTest.m
//  ZEKit
//
//  Created by zwein on 6/5/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//
#import "Kiwi.h"

SPEC_BEGIN(ZEReachabilitySpec)

describe(@"ZEReachability Test", ^{
    context(@"when test isReachable", ^{
        it(@"should return true", ^{
            [[theValue([ZEReachability isReachable]) should] beYes];
        });
    });
    
//    context(@"when test isReachableViaWIFI", ^{
//        it(@"should return true", ^{
//            [[theValue([ZEReachability isReachableViaWIFI]) should] beTrue];
//        });
//    });
//    
//    context(@"when test isReachableViaWLAN", ^{
//        it(@"should return true", ^{
//            [[theValue([ZEReachability isReachableViaWLAN]) should] beFalse];
//        });
//    });
//    
//    context(@"when test localIP", ^{
//        it(@"should return true", ^{
//            DDLogVerbose(@"%@", [ZEReachability localIP]);
//        });
//    });
//    
//    context(@"when test publicIP", ^{
//        it(@"should return true", ^{
//            DDLogVerbose(@"%@", [ZEReachability publicIP]);
//        });
//    });
    
});

SPEC_END
