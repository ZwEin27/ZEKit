//
//  ZEReachability.m
//  ZEKit
//
//  Created by zwein on 6/5/14.
//  Copyright (c) 2014 lzhteng. All rights reserved.
//

#import "ZEReachability.h"
#import "Reachability.h"

@interface ZEReachability()
{
	Reachability *	_reach;
}

- (BOOL)isReachable;
- (BOOL)isReachableViaWIFI;
- (BOOL)isReachableViaWLAN;

-(void)areachabilityChanged:(NSNotification*)note;

@end

@implementation ZEReachability

DEF_SINGLETON( ZEReachability )

DEF_NOTIFICATION( WIFI_REACHABLE )
DEF_NOTIFICATION( WLAN_REACHABLE )
DEF_NOTIFICATION( UNREACHABLE )

DEF_NOTIFICATION( CHANGED )


@dynamic isReachable;
@dynamic isReachableViaWIFI;
@dynamic isReachableViaWLAN;

@dynamic localIP;
@dynamic publicIP;

- (id)init
{
	self = [super init];
	if ( self )
	{
        DDLogVerbose(@"ZEReachability Init");
		//[self observeNotification:kReachabilityChangedNotification];
		
        
		_reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(areachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        
		[_reach startNotifier];
	}
	return self;
}

+ (BOOL)isReachable
{
	return [[ZEReachability sharedInstance] isReachable];
}

- (BOOL)isReachable
{
    
    
	return [_reach isReachable];
}

+ (BOOL)isReachableViaWIFI
{
	return [[ZEReachability sharedInstance] isReachableViaWIFI];
}

- (BOOL)isReachableViaWIFI
{
    if ( NO == [_reach isReachable] )
    {
		return NO;
    }
    
	return [_reach isReachableViaWiFi];
}

+ (BOOL)isReachableViaWLAN
{
	return [[ZEReachability sharedInstance] isReachableViaWLAN];
}

- (BOOL)isReachableViaWLAN
{
    if ( NO == [_reach isReachable] )
    {
		return NO;
    }
	
	return [_reach isReachableViaWWAN];
}

+ (NSString *)localIP
{
	return [[ZEReachability sharedInstance] localIP];
}

- (NSString *)localIP
{
    NSString *			ipAddr = nil;
    struct ifaddrs *	addrs = NULL;
    
	int ret = getifaddrs( &addrs );
    if ( 0 == ret )
	{
        const struct ifaddrs * cursor = addrs;
        
        while ( cursor )
		{
            if ( AF_INET == cursor->ifa_addr->sa_family && 0 == (cursor->ifa_flags & IFF_LOOPBACK) )
            {
				ipAddr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
				break;
            }
			
            cursor = cursor->ifa_next;
        }
        
        freeifaddrs( addrs );
    }
	
    return ipAddr;
}

+ (NSString *)publicIP
{
	return [[ZEReachability sharedInstance] publicIP];
}

- (NSString *)publicIP
{
	return nil;
}

-(void)areachabilityChanged:(NSNotification*)note
{
    DDLogVerbose(@"Reachability Changed");
    
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        NSLog(@"AAAAA Reachable");
    }
    else
    {
        NSLog(@"AAAAA Not Reachable");
    }
}



@end
