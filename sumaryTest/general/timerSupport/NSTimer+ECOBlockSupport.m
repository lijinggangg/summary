//
//  NSTimer+ECOBlockSupport.m
//  Demo
//
//  Created by Tony on 15/1/28.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "NSTimer+ECOBlockSupport.h"

@implementation NSTimer (ECOBlockSupport)


+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     block:(void(^)())block repeats:(BOOL)repeats;
{
  return  [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(eoc_blockInvoke:) userInfo:[block copy]repeats:repeats];

}
+ (void)eoc_blockInvoke:(NSTimer *)timer
{
    void (^block)() = timer.userInfo;
    
    if(block)
    {
        block();
    }
}


@end
