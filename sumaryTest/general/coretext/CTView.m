//
//  CTView.m
//  sumaryTest
//
//  Created by Tony on 15/1/29.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "CTView.h"
#import <CoreText/CoreText.h>
#import "CTColumnView.h"



@implementation CTView
@synthesize frames;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        
    }
    return self;
}
-(void)setAttString:(NSAttributedString *)string withImages:(NSArray*)imgs
{
    self.attrString = string;
    self.images = imgs;
    
    
//    CTTextAlignment alignment = kCTJustifiedTextAlignment;
//    
//    CTParagraphStyleSetting settings[] = {
//        {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
//    };
//    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings, sizeof(settings) / sizeof(settings[0]));
//    NSDictionary *attrDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    (__bridge id)paragraphStyle, (NSString*)kCTParagraphStyleAttributeName,
//                                    nil];
//    
//    NSMutableAttributedString* stringCopy = [[NSMutableAttributedString alloc] initWithAttributedString:self.attrString];
//    [stringCopy addAttributes:attrDictionary range:NSMakeRange(0, [_attrString length])];
//    self.attrString = (NSAttributedString*)stringCopy;
}
/*
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, self.bounds);
    
    
    // NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"Hello Core Text World"];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self.attrString);
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [self.attrString length]), path, nil);
    
    CTFrameDraw(frame, context);
    
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
    
}*/

- (void) buildFrames
{
    frameXOffset = 20;
    frameYOffset = 20;
    
    self.pagingEnabled = YES;
    self.delegate = self;
    self.frames = [NSMutableArray array];
    
    
    CGMutablePathRef path = CGPathCreateMutable();//2
    
    CGRect textFrame = CGRectInset(self.bounds, frameXOffset, frameYOffset);
    
    CGPathAddRect(path, NULL, textFrame);
    
    
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)_attrString);
    
    
    int textPos = 0;
    int columnIndex = 0;
    
    while (textPos < [_attrString length]) {//4
        
        CGPoint colOffset = CGPointMake((columnIndex+1)*frameXOffset + columnIndex*(textFrame.size.width/2), 20);
        
        CGRect colRect = CGRectMake(0, 0, textFrame.size.width/2-10, textFrame.size.height-40);
        
        
        CGMutablePathRef path = CGPathCreateMutable();
        
        CGPathAddRect(path, NULL, colRect);
        
        
        CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(textPos, 0), path, NULL);
        
        CFRange frameRange = CTFrameGetVisibleStringRange(frame);//5
        
        CTColumnView* content = [[CTColumnView alloc] initWithFrame: CGRectMake(0, 0, self.contentSize.width, self.contentSize.height)];
        
        content.backgroundColor = [UIColor clearColor];
        
        content.frame = CGRectMake(colOffset.x, colOffset.y, colRect.size.width, colRect.size.height) ;
        
        [content setCTFrame:(__bridge id)frame];//6
        
        [self attachImagesWithFrame:frame inColumnView: content];

        
        [self.frames addObject:(__bridge id)frame];
       
        [self addSubview:content];
        
        textPos += frameRange.length;
        
        
        CFRelease(path);
        columnIndex++;
    }
    
    int totalPage = (columnIndex +1)/2;//7
    
    self.contentSize = CGSizeMake(totalPage*self.bounds.size.width, textFrame.size.height);
}
//inside CTView.m
-(void)attachImagesWithFrame:(CTFrameRef)f inColumnView:(CTColumnView*)col
{
    //drawing images
    NSArray *lines = (NSArray *)CTFrameGetLines(f); //1
    
    CGPoint origins[[lines count]];
    CTFrameGetLineOrigins(f, CFRangeMake(0, 0), origins); //2
    
    int imgIndex = 0; //3
    NSDictionary* nextImage = [self.images objectAtIndex:imgIndex];
    int imgLocation = [[nextImage objectForKey:@"location"] intValue];
    
    //find images for the current column
    CFRange frameRange = CTFrameGetVisibleStringRange(f); //4
    while ( imgLocation < frameRange.location ) {
        imgIndex++;
        if (imgIndex>=[self.images count]) return; //quit if no images for this column
        nextImage = [self.images objectAtIndex:imgIndex];
        imgLocation = [[nextImage objectForKey:@"location"] intValue];
    }
    
    NSUInteger lineIndex = 0;
    for (id lineObj in lines) { //5
        CTLineRef line = (__bridge CTLineRef)lineObj;
        
        for (id runObj in (NSArray *)CTLineGetGlyphRuns(line)) { //6
            
            CTRunRef run = (__bridge CTRunRef)runObj;
            CFRange runRange = CTRunGetStringRange(run);
            
            if ( runRange.location <= imgLocation && runRange.location+runRange.length > imgLocation ) { //7
               
                CGRect runBounds;
                
                CGFloat ascent;//height above the baseline
                CGFloat descent;//height below the baseline
                
                runBounds.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL); //8
                runBounds.size.height = ascent + descent;
                
                
                CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL); //9
                
                runBounds.origin.x = origins[lineIndex].x + self.frame.origin.x + xOffset + frameXOffset;
                runBounds.origin.y = origins[lineIndex].y + self.frame.origin.y + frameYOffset;
                runBounds.origin.y -= descent;
                
                UIImage *img = [UIImage imageNamed: [nextImage objectForKey:@"fileName"]];
                CGPathRef pathRef = CTFrameGetPath(f); //10
                
                CGRect colRect = CGPathGetBoundingBox(pathRef);
                
                CGRect imgBounds = CGRectOffset(runBounds, colRect.origin.x - frameXOffset - self.contentOffset.x, colRect.origin.y - frameYOffset - self.frame.origin.y);
               
                [col.images addObject: //11
                 [NSArray arrayWithObjects:img, NSStringFromCGRect(imgBounds) , nil]
                 ];
                //load the next image //12
                imgIndex++;
                if (imgIndex < [self.images count]) {
                    nextImage = [self.images objectAtIndex: imgIndex];
                    imgLocation = [[nextImage objectForKey: @"location"] intValue];
                }
             
            }
        }
        lineIndex++;
    }
}


@end
