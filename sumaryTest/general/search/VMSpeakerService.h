//
//  VMSpeakerService.h
//  ViewMedia
//
//  Created by lance on 14-3-7.
//  Copyright (c) 2014年 Hansong（Nanjing) Technology Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VMSpeakerService : NSObject
@property (nonatomic, strong) NSMutableArray   *services;
@property (atomic, strong) NSMutableArray    *remoteControls;
@property (nonatomic, strong) NSMutableArray    *serviceOldNames;


@property (nonatomic, retain, readonly) NSMutableArray    *pageArray;
//background 
@property (nonatomic, strong) NSString   *currentSpeakerIpAddress;
//@property (nonatomic, strong) subscriberCommandProcessor   *currentSpeaker;
+ (VMSpeakerService *)service;

- (NSNetService *)objectInServicesAtIndex:(NSUInteger)index;

- (void)startSearch;
- (void)reStartSearch;


//   rem   page  subcriber
- (void)subscribe:(id)subscriber;
- (void)unsubscribe:(id)subscriber;
- (void)unsubscribeAll;


@end
