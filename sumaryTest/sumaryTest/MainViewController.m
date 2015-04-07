//
//  MainViewController.m
//  sumaryTest
//
//  Created by Tony on 15/1/29.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "MainViewController.h"
#import "drawView.h"
#import "MarkupParser.h"
#import "CTView.h"
#import <objc/runtime.h>
#import "downLoadTool.h"





@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
  //  [self createDrawView];
    
  //  [self coreTextBasisTest];
    
//    [self paragrapgTest];
    
   // [self rangeTest];
    
//    [self operationBlock_2];
//    
//    [self willChangeValueForKey:@"test"];
    
 //   [self testFrame];
    
    
  //  [self willEndStepOne:nil];
    
    
  //  [self testRetainCount];
    
    [self testClassExtension];

    
    /*Here is the  addLhttps://github.com/lijinggangg/summary*/

}

typedef testBlock   void(void*){};


- (void)useBlockToGetValue
{
    
    
    
    NSArray *array  = @[@1, @2, @3, @4];
    
    const BOOL anaValueIsXY = (^BOOL{
    
        for(NSNumber *num in array)
        {
            if( [num intValue] == 0)
                return YES;
        }
    
        return NO;
    }());
    

}

//+ (id) stringWithCString: (const char*)nullTerminatedCString
//                encoding: (NSStringEncoding)encoding
//{
//    NSString  *obj;
//    
//    obj = [self allocWithZone: NSDefaultMallocZone()];
//    obj = [obj initWithCString: nullTerminatedCString encoding:encoding];
//    return obj;
//}


#pragma mark --    TEST  retainCount

- (void)testClassExtension
{
    AppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    
    
    NSString *indeti = deleg.identifierString;
    
    NSLog(@"App Delegate string == %@", indeti);
    
    deleg.identifierString = @"world";
    
}

#pragma mark --- AlertController

- (void)showAlertController
{
    UIAlertController *alert = [[UIAlertController alloc] init];
}







- (void)willEndStepOne:(NSObject *)userInfo{
    [NSThread detachNewThreadSelector:@selector(doSomeThing:)
                             toTarget:self withObject:userInfo];
    
  //  [UIView transitionWithView:<#(UIView *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
    
  //  [self performSelector:@selector(testFrame) onThread:[NSThread mainThread] withObject:<#(id)#> waitUntilDone:<#(BOOL)#>]
    
    
}
#pragma mark --    TEST  retainCount
/*
- (void)testRetainCount
{
    NSString *str =[[NSString alloc] initWithString:@"strings"];
    
    NSLog(@"string count1 === %ld", [str retainCount]);
    
    
    NSString *str2 = str;
    
    NSLog(@"string count2 === %ld", [str retainCount]);

    
    UILabel *lab  = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    
    [self.view addSubview:lab];
    
    NSLog(@"lab count1 === %ld", [lab retainCount]);
    
    [self.view removeFromSuperview];

    NSLog(@"lab count2 === %ld", [lab retainCount]);

    
    
    NSArray *array  = [NSArray arrayWithObjects:@"first",@"second", @"third", nil];
    
    
    
    NSLog(@"rray count3 === %ld", [array retainCount]);

    
    
}

2015-02-28 12:02:08.642 sumaryTest[840:45208] string count1 === -1
2015-02-28 12:02:08.644 sumaryTest[840:45208] string count2 === -1
2015-02-28 12:02:08.645 sumaryTest[840:45208] lab count1 === 2
2015-02-28 12:02:08.645 sumaryTest[840:45208] lab count2 === 2
2015-02-28 12:02:08.645 sumaryTest[840:45208] rray count3 === 1
*/
/*
 - (void)appEnterBackground
 {
 
 backgroundTimerOverFlag = NO;
 self.backTask = [[UIApplication sharedApplication]
 beginBackgroundTaskWithExpirationHandler:^{
 NSLog(@"超时");
 backgroundTimerOverFlag = YES;
 }];
 
 
 self.counterTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:2 block:^{
 
 __weak AppDelegate *dele = [UIApplication sharedApplication].delegate;
 
 [dele backgroundTimerMethod];
 
 
 
 } repeats:YES];
 
 }
 
 - (void)backgroundTimerMethod
 {
 backGroundCounter++;
 NSLog(@"background timer  running");
 
 if(backGroundCounter == 50)
 {
 [self releaseCounterTimer];
 [[UIApplication sharedApplication] endBackgroundTask:self.backTask];
 backgroundTimerOverFlag = YES;
 [[SocketManager sharedInstance] stopPingTimer];
 
 }
 else
 {
 [[SocketManager sharedInstance] repeatSendInfo:nil];
 
 }
 }
 - (void)releaseCounterTimer
 {
 if (_counterTimer) {
 if([_counterTimer isValid])
 {
 [_counterTimer  invalidate];
 }
 _counterTimer = nil;
 }
 }
 
 */
- (void)syncWhenMutiThread
{
    NSConditionLock *lock = [[NSConditionLock alloc] initWithCondition:1];
    
    BOOL canLck = [lock tryLockWhenCondition:2];
    
    if(canLck)
    {
        [lock lockWhenCondition:2];
    }
    
    
    [lock unlockWithCondition:2];
    
}






- (void)doSomeThing:(NSObject *)userInfo
{
    int max_loop_times = 9999;
    
    for (int i=0; i<max_loop_times; i++)
    {
        int randNum = rand();
        NSString *tmpString = [NSString stringWithFormat:@"%d", randNum];
        NSLog (@"%@", tmpString);
    }
}


- (void)viewWillLayoutSubviews
{
    
}
- (void)viewDidLayoutSubviews
{
    
}
- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)testFrame
{
    
    CGRect fra1 = [[UIScreen mainScreen] bounds];
    
    CGRect fra2 = [[UIScreen mainScreen] applicationFrame];
    
    
    NSLog(@"%f---%f", CGRectGetHeight(fra1), CGRectGetHeight(fra2));
    
}
#pragma mark --    SubRange --range

- (void)rangeTest
{
    NSString *str = @"helloworld";
    
    NSString *subString = [str substringWithRange:NSMakeRange(4, str.length-4)];
    
    NSLog(@"subString === %@", subString);
    
}
//---------------------------------------------------------------------------------------------

#pragma mark --    NSOperation (tree)
- (NSOperation *)executeBlock:(void (^)(void))block
                      inQueue:(NSOperationQueue *)queue
                   completion:(void (^)(BOOL finished))completion
{
    NSOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:block];
    
    NSOperation *completionOperation = [NSBlockOperation blockOperationWithBlock:^{
        completion(blockOperation.isFinished);
    }];
    
    [completionOperation addDependency:blockOperation];
    
    [[NSOperationQueue currentQueue] addOperation:completionOperation];
    [queue addOperation:blockOperation];
    return blockOperation;
}
- (void)tryIt
{
    // Create and configure the queue to enqueue your operations
   NSOperationQueue * backgroundOperationQueue = [[NSOperationQueue alloc] init];
    
    // Prepare needed data to use in the operation
    NSMutableString *string = [NSMutableString stringWithString:@"tea"];
    NSString *otherString = @"for";
    
    // Create and enqueue an operation using the previous method
    NSOperation *operation = [self executeBlock:^{
        NSString *yetAnother = @"two";
        [string appendFormat:@" %@ %@", otherString, yetAnother];
    }
                                        inQueue:backgroundOperationQueue
                                     completion:^(BOOL finished)
    {
        // this logs "tea for two"
        NSLog(@"%@", string);
    }];
    
    // Keep the operation for later uses
    // Later uses include cancellation ...
    [operation cancel];
}



- (void)operationBlock_2
{
    NSArray *urlArray = [NSArray arrayWithObjects:@"http://cc.cocimg.com/cms/uploads/141023/4196-1410231QKLO.jpg",
                         @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T4362253-1.jpg",
                         @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T43625E-2.jpg",
                         @"http://cn.cocos2d-x.org/uploads/20141027/1414375938698264.jpg",nil];
    
    
    
    NSBlockOperation *blockOperaion = [NSBlockOperation blockOperationWithBlock:^{
    
        
        for(int i = 0 ;i < 10; i++)
        {
            sleep(1);
        }
        

        NSLog(@"current thread ==== %@", [NSThread currentThread]);
        NSLog(@"Main    thread ==== %@", [NSThread mainThread]);

    
    }];
    
    NSLog(@"hello world1111");

    [blockOperaion start];

    NSLog(@"hello world2222");

}


- (void)operationBlock_1
{
    NSArray *urlArray = [NSArray arrayWithObjects:@"http://cc.cocimg.com/cms/uploads/141023/4196-1410231QKLO.jpg",
                @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T4362253-1.jpg",
                @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T43625E-2.jpg",
                @"http://cn.cocos2d-x.org/uploads/20141027/1414375938698264.jpg",nil];
//
//    NSBlockOperation *blockOperaion = [NSBlockOperation blockOperationWithBlock:^{
    
        for(int i = 0; i < 2; i++)
        {
            NSString *urlStr = [urlArray objectAtIndex:i];
            NSLog(@"urlString === %@", urlStr);
            
            
            UIImage *img = [downLoadTool loadImageFromCacheWithUrl:urlStr];
            
            if(img == nil)
            {
                [downLoadTool addImageToLoad:urlStr needToSave:YES imageFilePath:nil Tag:i delegate:self];
            }
            else
            {
                NSLog(@"image binary data == %@", img);
            }
        }
        
//    }];
//    
//    [blockOperaion start];
    

}
/*download    delegate
 */
-(void)asycImageCallBack:(UIImage *)image Tag:(NSInteger)tag;
{
    
      dispatch_async(dispatch_get_main_queue(), ^{
    
    
        if(tag == 0)
        {
            [_imgsView1 setImage:image];
            

        }
        else if(tag == 1)
        {
            [_imgsView2 setImage:image];
        }
   
    
    });
    
 }
//---------------------------------------------------------------------------------------------

#pragma mark --    Exchange  Method
//Method change
- (void)changeMethod
{
    Method oldMethod = class_getInstanceMethod([drawView class], @selector(setParagraphStyle));
    Method newMethod = class_getInstanceMethod([CTView class], @selector(buildFrames));
    
    method_setImplementation(oldMethod, method_getImplementation(newMethod));
    
}

//---------------------------------------------------------------------------------------------


#pragma mark --    CoreText


- (void)paragrapgTest
{
    drawView *dVw = [[drawView alloc] initWithFrame:CGRectMake(30, 40, 600, 900)];
    
    [dVw setNeedsDisplay];
    
    [self.view addSubview:dVw];
}


- (void)coreTextBasisTest
{
    UITextView *txtView = [[UITextView alloc] initWithFrame:CGRectMake(30, 40, 600, 900)];
 //   [txtView setBackgroundColor:[UIColor lightGrayColor]];
    
    [self.view addSubview:txtView];
    
    NSMutableAttributedString *mabString = [[NSMutableAttributedString alloc] initWithString:@"This is attribute string test.你好"];
    
    [mabString beginEditing];
    
    
    //斜体
    CTFontRef font = CTFontCreateWithName((CFStringRef)[UIFont italicSystemFontOfSize:24].fontName, 23,  NULL);
    
    
    
    
//    CTFontRef font = CTFontCreateWithName(CFSTR("Georgia"), 20, NULL);
//    
    [mabString addAttribute:(id)kCTFontAttributeName value:(__bridge id)font range:NSMakeRange(0, 4)];
    //下划线
    [mabString addAttribute:(id)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleThick] range:NSMakeRange(0, 4)];
    
    [mabString addAttribute:(id)kCTUnderlineColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, 4)];
    
    
//    //间隔
//    long number = 10;
//    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
//    [mabString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(3, 4)];
    
    
    //连字
    long number1 = 1;
    CFNumberRef num1 = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number1);
    [mabString addAttribute:(id)kCTLigatureAttributeName value:(__bridge id)num1 range:NSMakeRange(4, 8)];
    
    
    [mabString addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 9)];
    
    
    
    //设置字体颜色为前影色
    CFBooleanRef flag = kCFBooleanTrue;
    [mabString addAttribute:(id)kCTForegroundColorFromContextAttributeName value:(__bridge id)flag range:NSMakeRange(5, 10)];
    
    //空心字
    long number2 = 2;
    CFNumberRef num2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number2);
    [mabString addAttribute:(id)kCTStrokeWidthAttributeName value:(__bridge id)num2 range:NSMakeRange(0, 16)];
    
    [mabString addAttribute:(id)kCTStrokeColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 16)];
    
    [mabString endEditing];
    
    
    
    [txtView setAttributedText:mabString];

}


//---------------------------------------------------------------------------------------------
- (void)createDrawView
{
    
    MarkupParser* p = [[MarkupParser alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zombies" ofType:@"txt"];

    ///NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"txt"];
    NSString* text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSAttributedString* attrString1 = [p attrStringFromMarkup: text];
    
    NSLog(@"change string == %@", attrString1);
    
    
//    NSAttributedString* attrString = [p attrStringFromMarkup: @"Hello <font color=\"red\">core text <font color=\"blue\">world!"];
//
//    drawView *dVw = [[drawView alloc] initWithFrame:CGRectMake(10, 20, 700, 900)];
//    
//    [dVw setBackgroundColor:[UIColor lightGrayColor]];
//    [dVw setAttrString:attrString1];
//    [self.view addSubview:dVw];
//    
//  
//    [dVw setNeedsDisplay];
    
    
    CTView *ctView = [[CTView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
 //   ctView.attrString = attrString1;
    
    [ctView setAttString:attrString1 withImages: p.images];

    
    [self.view addSubview:ctView];
    [ctView buildFrames];


    
}
/*
//---------------------------------------------------------------------------------------------
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //js是否注入成功
    if (![[webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"typeof window.%@ == 'object'", kBridgeName]] isEqualToString:@"true"]) {
        NSBundle *bundle = _resourceBundle ? _resourceBundle : [NSBundle mainBundle];
        NSString *filePath = [bundle pathForResource:@"WebViewJsBridge" ofType:@"js"];
        NSString *js = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        [webView stringByEvaluatingJavaScriptFromString:js];
    }
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSURL *url = [request URL];
    
    NSString *requestString = [[request URL] absoluteString];
    if ([requestString hasPrefix:kCustomProtocolScheme]) {
        NSArray *components = [[url absoluteString] componentsSeparatedByString:@":"];
        
        NSString *function = (NSString*)[components objectAtIndex:1];
        NSString *argsAsString = [(NSString*)[components objectAtIndex:2]
                                  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSData *argsData = [argsAsString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *argsDic = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:argsData options:kNilOptions error:NULL];
        //将js的数组转换成objc的数组
        NSMutableArray *args = [NSMutableArray array];
        for (int i=0; i<[argsDic count]; i++) {
            [args addObject:[argsDic objectForKey:[NSString stringWithFormat:@"%d", i]]];
        }
        //调用oc方法，忽略警告
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        SEL selector = NSSelectorFromString([function stringByAppendingString:@":"]);

        if ([self respondsToSelector:selector]) {
            [self performSelector:selector withObject:args];
        }
        return NO;
    } else {
        return YES;
    }
}

*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
