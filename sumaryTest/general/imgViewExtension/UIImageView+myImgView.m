//
//  UIImageView+myImgView.m
//  Demo
//
//  Created by Tony on 15/1/26.
//  Copyright (c) 2015年 Tony. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIImageView+myImgView.h"
#import <objc/runtime.h>

static void *key = (void *)@"mykey";



//@interface UIImageView (myImgView)
//
//
//@property (nonatomic, retain) NSString *subTit;
//
//
//@end


@implementation UIImageView (myImgView)



- (NSString *)title
{
    return self.title;
    //return objc_getAssociatedObject(self, key);
}
- (void)setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, key, title, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
