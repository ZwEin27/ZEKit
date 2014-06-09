//
//  ZEMacroTest.m
//  ZEKit
//
//  Created by zwein on 6/3/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "Kiwi.h"
#import "ZEMacro.h"



SPEC_BEGIN(ZEMacroSpec)

describe(@"Print Log in DEBUG mode", ^{
    context(@"when using ZELog instead of NSLog", ^{
        it(@"should print function name, line number and custom message", ^{
            ZLog(@"Test ZELog with avg: %@",@"hello zelog");
        });
    });
    
    context(@"when instead of NSLog implementation", ^{
        it(@"should ", ^{
            NSLog(@"Test NSLog with avg: %@",@"hello nslog");
        });
    });
    
    context(@"when using UILog", ^{
        it(@"should ", ^{
            UILog(@"Test UILog with avg: %@",@"hello uilog");
        });
    });
});

SPEC_END
