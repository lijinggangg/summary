//
//  CTColumnView.m
//  sumaryTest
//
//  Created by Tony on 15/1/29.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "CTColumnView.h"
#import <CoreText/CoreText.h>


@implementation CTColumnView
@synthesize images;



-(void)setCTFrame: (id) f
{
    ctFrame = f;
}

-(id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]!=nil) {
        self.images = [NSMutableArray array];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFrameDraw((CTFrameRef)ctFrame, context);
    
    for (NSArray* imageData in self.images)
    {
        UIImage* img = [imageData objectAtIndex:0];
        CGRect imgBounds = CGRectFromString([imageData objectAtIndex:1]);
        CGContextDrawImage(context, imgBounds, img.CGImage);
    }

}


@end
