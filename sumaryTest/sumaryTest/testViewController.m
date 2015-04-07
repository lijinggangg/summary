//
//  testViewController.m
//  sumaryTest
//
//  Created by Tony on 15/4/2.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "testViewController.h"
#import <objc/runtime.h> 



@implementation testViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getAClassPrivateAPIs];
    
}


#pragma mark --- private  API

- (void)getAClassPrivateAPIs
{
    NSString *className = NSStringFromClass([UIView class]);
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    
    unsigned int outCount = 0;
    
    Method *m = class_copyMethodList(theClass, &outCount);
    
    NSLog(@"out count == %d", outCount);
    
    for(int i = 0; i < outCount; i++)
    {
        SEL a  = method_getName(*(m+i));
    
        
        NSString *sn = NSStringFromSelector(a);
        
        NSLog(@"selecto string ==%@", sn);
    }
    
    
}




#pragma mark --- AlertController

- (IBAction)testAlertControllerButtonClicked:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are You Sure?" message:@"Sure to delete the reference" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:^{}];
}

@end
