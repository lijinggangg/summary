//
//  NSTimer+ECOBlockSupport.h
//  Demo
//
//  Created by Tony on 15/1/28.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ECOBlockSupport)
+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     block:(void(^)())block
                                   repeats:(BOOL)repeats;
@end
