//
//  ZEReachability.h
//  ZEKit
//
//  Created by zwein on 6/5/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZEFoundation.h"


@interface ZEReachability : NSObject

AS_NOTIFICATION( WIFI_REACHABLE )
AS_NOTIFICATION( WLAN_REACHABLE )
AS_NOTIFICATION( UNREACHABLE )

AS_NOTIFICATION( CHANGED )

AS_SINGLETON( ZEReachability )

@property (nonatomic, readonly) BOOL		isReachable;
@property (nonatomic, readonly) BOOL		isReachableViaWIFI;
@property (nonatomic, readonly) BOOL		isReachableViaWLAN;

@property (nonatomic, readonly) NSString *	localIP;
@property (nonatomic, readonly) NSString *	publicIP;

+ (BOOL)isReachable;
+ (BOOL)isReachableViaWIFI;
+ (BOOL)isReachableViaWLAN;

+ (NSString *)localIP;
+ (NSString *)publicIP;

@end
