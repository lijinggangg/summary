
//
//  VMSpeakerService.m
//  ViewMedia
//
//  Created by lance on 14-3-7.
//  Copyright (c) 2014年 Hansong（Nanjing) Technology Co.Ltd. All rights reserved.
//

#import "VMSpeakerService.h"
#include <arpa/inet.h>


#define SERVICENAME @"http"
#define DOMAINNAME  @"local"


static VMSpeakerService *service_;

@interface VMSpeakerService () < NSNetServiceDelegate, NSNetServiceBrowserDelegate>
@property (nonatomic, strong) NSNetServiceBrowser *serviceBrowser;


- (void)startSearch;
@end

@implementation VMSpeakerService

+ (VMSpeakerService *)service
{
    if (service_ == nil) {
        service_ = [[VMSpeakerService alloc] init];
    }
    return service_;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.services = [NSMutableArray array];
        self.remoteControls = [NSMutableArray array];
        self.serviceOldNames = [NSMutableArray array];
        _pageArray = [NSMutableArray array];
    }
    return self;
}

- (void)subscribe:(id)subscriber {
    if(![_pageArray containsObject:subscriber]) {
        [_pageArray addObject:subscriber];
    }
}

- (void)unsubscribe:(id)subscriber {
    if([_pageArray containsObject:subscriber]) {
        [_pageArray removeObject:subscriber];
    }
}

- (void)unsubscribeAll {
    [_pageArray removeAllObjects];
}



+ (void)initialize
{
    service_ = nil;
}


+ (void)destroy
{
    if (service_ != nil) {
        service_ = nil;
    }
}

- (NSNetService *)objectInServicesAtIndex:(NSUInteger)index
{
    if (index >= [self.services count]) {
        return nil;
    }
    return [self.services objectAtIndex:index];
}

- (void)startSearch
{
    [self.serviceBrowser stop];
    for (NSInteger i = 0; i < [self.remoteControls count]; i ++) {
//        subscriberCommandProcessor *rc = self.remoteControls[i];
//        [rc disconnect];
//        [rc.service stop];
//        [rc.service stopMonitoring];
//        [rc.service removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//        rc.service = nil;
//        re = nil;
    }
   [self.services removeAllObjects];
//
    [self searchForServicesOfType:SERVICENAME inDomain:DOMAINNAME];
}


- (void)reStartSearch
{
    [self.serviceBrowser stop];
    for (NSInteger i = 0; i < [self.remoteControls count]; i ++) {
//        subscriberCommandProcessor *rc = self.remoteControls[i];
//        [rc disconnect];
//        [rc.service stop];
//        [rc.service stopMonitoring];
//        [rc.service removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//        rc.service = nil;
        //        re = nil;
        
    }
    
    if([self.remoteControls count] > 0)
    {
        [self.remoteControls removeAllObjects];
    }

    [self searchForServicesOfType:SERVICENAME inDomain:DOMAINNAME];

    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.services removeAllObjects];


    });
    //
//   [self.remoteControls removeAllObjects];
    
}

- (BOOL)searchForServicesOfType:(NSString *)type inDomain:(NSString *)domain {
    
    if (!self.serviceBrowser) {
       	NSNetServiceBrowser *aNetServiceBrowser = [[NSNetServiceBrowser alloc] init];
        aNetServiceBrowser.delegate = self;
        self.serviceBrowser =  aNetServiceBrowser;
    }
    
	[self.serviceBrowser searchForServicesOfType:[self bonjourTypeFromIdentifier:type] inDomain:domain];
    return YES;
}

- (NSString*) bonjourTypeFromIdentifier:(NSString*)identifier {
	if (![identifier length])
		return nil;
    //return [NSString stringWithFormat:@"_%@._tcp.", @"http"];
    return [NSString stringWithFormat:@"_%@._tcp.", identifier];
}


- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)service moreComing:(BOOL)moreComing {
    [self.services removeObject:service];
    for (NSInteger i = 0; i < [self.remoteControls count]; i ++) {
//        subscriberCommandProcessor *rc = self.remoteControls[i];
//        if ([rc.service.name isEqualToString:service.name]) {
//            [self.remoteControls removeObject:rc];
//            [rc disconnect];
//            [rc.service stop];
//            [rc.service stopMonitoring];
//            [rc.service removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
//            rc.service = nil;
//        }
    }

    if (!moreComing) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationSpekaerServiceRemoveFinshed object:self];
    }
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)service moreComing:(BOOL)moreComing {
	// If a service came online, add it to the list and update the table view if no more events are queued.
    NSLog(@"service: %@ %@",service,service.domain);
    if (![self.serviceOldNames containsObject:service.name]) {
        [service setDelegate:self];
        [service resolveWithTimeout:0.0];
        [self.services addObject:service];
    }
    if (!moreComing) {
    }
    
}



- (void)netServiceWillResolve:(NSNetService *)sender
{
    
}

/* Sent to the NSNetService instance's delegate when an error in resolving the instance occurs. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants).
 */
- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict
{
    
}


- (void)netServiceDidResolveAddress:(NSNetService *)service {
    NSData *address = nil;
	struct sockaddr_in *socketAddress = nil;
	NSString *ipAddress = nil;
    if ([[service addresses] count] > 0) {
        address = [[service addresses] objectAtIndex: 0];
        socketAddress = (struct sockaddr_in *) [address bytes];
        ipAddress = [NSString stringWithFormat: @"%s",inet_ntoa(socketAddress->sin_addr)];
        
        
        NSLog(@"resolve addr === %@", ipAddress);
        
       /// [self connectToHost:ipAddress service:service];
        
    }
    else {
        [service stop];
        [service removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        service = nil;
    }
}

- (void)connectToHost:(NSString *)ipAddress  service:(NSNetService *)service{
    
    
    
//    subscriberCommandProcessor *remoteControl = [[subscriberCommandProcessor alloc] init];
//    remoteControl.devName = service.name;
//    remoteControl.isSelect = NO;
//     remoteControl.ipAddress = ipAddress;
//    
//    double delayInSeconds = 1.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [remoteControl connectToHost:ipAddress onPort:NS2SETUPPORT];
//
//    });
//    
//    
//    [self.remoteControls addObject:remoteControl];
//
//    CLog(@"remote controls == %@", self.remoteControls);
}


@end
