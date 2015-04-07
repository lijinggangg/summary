//
//  CTView.h
//  sumaryTest
//
//  Created by Tony on 15/1/29.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
@class CTColumnView;





@interface CTView : UIScrollView<UIScrollViewDelegate>
{
    float frameXOffset;
    
    float frameYOffset;
    
    
}



@property (nonatomic, retain) NSAttributedString    *attrString;



@property (nonatomic, retain) NSMutableArray    *frames;

@property (retain, nonatomic) NSArray* images;

//CTView.h - add a method declaration
-(void)setAttString:(NSAttributedString *)attString withImages:(NSArray*)imgs;
-(void)attachImagesWithFrame:(CTFrameRef)f inColumnView:(CTColumnView*)col;



- (void)buildFrames;


@end
