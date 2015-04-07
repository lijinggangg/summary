//
//  ViewController.m
//  Demo
//
//  Created by Tony on 14-10-11.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"
#import "VMSpeakerService.h"
#import "downLoadTool.h"
#import "AutoScrollLabel.h"
#import "configureCellHeightTableViewController.h"
#import "UIImageView+myImgView.h"
#import "NSTimer+ECOBlockSupport.h"
#import "AppDelegate.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>
#import "drawView.h"



@interface ViewController ()

@end

@implementation ViewController
{
    NSTimer    *_pullTimer;
    
}
//- (id)init
//{
//    self = [super init];
//    
//    
//    if(self)
//    {
//       
//    }
//    return self;
//}
- (void)awakeFromNib
{
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self detectNetworkStatus];

//    [self networkingTest];
    
    //[self getDataUsingDataTask];
    
//    [self getDataUsingDownLoadTask];
    
    
 //   [self initWebView];
    
    
  //  [self connectToHost:@"192.168.1.1" onPort:50001];
    
    
 //   [[VMSpeakerService service] startSearch];
    
    
 //   [self asyncDownLoadPic];
    
    
    
//    urlArray = [NSArray arrayWithObjects:@"http://cc.cocimg.com/cms/uploads/141023/4196-1410231QKLO.jpg",
//                @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T4362253-1.jpg",
//                @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T43625E-2.jpg",
//                @"http://cn.cocos2d-x.org/uploads/20141027/1414375938698264.jpg",nil];

    
   // [self downloadImageSeprateUsingdisGrounp];
    
 //   [self structureVisualEffectView];
   
//    [self getbitTest];
    
    
  //  [self filterLinkCheck];
    
//    [self createAutoLabel];
    
    
    
 //   methodSignatureForSelector
    
    //-------------------------------category-------------------------------------
//    UIImageView *imgV = [[UIImageView alloc] init];
//    imgV.title = @"hi";
//    
//    NSLog(@"title = %@", imgV.title);
    
    //-------------------------------timer retain count-------------------------------------

 //   [self callTimer];
    
   // [self beginBackgroundSessionToDownload];
    
    
  //  [self createDrawView];
    [self testFrame];
    
    
    
}
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

- (void)testFrame
{
    
    CGRect fra1 = [[UIScreen mainScreen] bounds];
    
    CGRect fra2 = [[UIScreen mainScreen] applicationFrame];
    
    
    NSLog(@"%f---%f", CGRectGetHeight(fra1), CGRectGetHeight(fra2));
    
}

#pragma mark --    CoreText
//---------------------------------------------------------------------------------------------
- (void)createDrawView
{
    drawView *dVw = [[drawView alloc] initWithFrame:CGRectMake(50, 100, 200, 100)];
    
    [dVw setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:dVw];
    
    [dVw setNeedsDisplay];
}




//---------------------------------------------------------------------------------------------
#pragma mark   -- auto release timer---------
- (void)callTimer
{
    __weak    ViewController  *vc = self;
    
    _pullTimer = [NSTimer eoc_scheduledTimerWithTimeInterval:2.0 block:^{
    
        ViewController *vc1 = vc;
        
        [vc1 timerMethod:nil];
    
    } repeats:YES];
}
- (void)timerMethod:(NSTimer *)timer
{
    NSLog(@"timer is runing");
    
}



#pragma mark   -- auto estimate cell height
- (IBAction)gotoConfigureCellViewController
{
    configureCellHeightTableViewController *configureController = [[configureCellHeightTableViewController alloc] init];
    
    [self.navigationController pushViewController:configureController animated:YES];
}


//---------------------------------------------------------------------------------------------

#pragma   -- mark  AutoScrolLabel

-(void)createAutoLabel
{
    AutoScrollLabel *autoLB = [[AutoScrollLabel alloc]initWithFrame:CGRectMake(20.0, 50.0, 100.0, 40.0)];
    autoLB.text = @"Hi Mom!  How are you?  I really ought to write more often.";
    autoLB.textColor = [UIColor yellowColor];
    [self.view addSubview:autoLB];
}



#pragma   -- mark  Throw exception

- (IBAction)throwAnException
{
    NSException *exception = [[NSException alloc] initWithName:@"FakeException" reason:@"App NG" userInfo:nil];
    
    [exception raise];
    
    
    NSSetUncaughtExceptionHandler(&exceptionHandler);
    
}

void exceptionHandler(NSException *excep)
{
    NSLog(@"exception name == %@", excep.name);
}

#pragma   -- mark     get Bit
- (void)getbitTest
{
    char num = 13;
    
    uint val = 0x0c & num;
    
    
    NSLog(@"val == %d", val);
  
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{}

#pragma   mark    -----  DAta Detector
//--------------------------------------------------------------------
- (void)filterLinkCheck
{
    NSString *str = @"helloworld http://blog.csdn.net/kmyhy/article/details/6524893 feewwe12344";
    
    NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSError *error = nil;
    
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber error:&error];
    
    NSArray *matchs = [detector matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    
    for (NSTextCheckingResult *match in matchs)
    {
        if([match resultType] == NSTextCheckingTypeLink)
        {
            NSURL *url = [match URL];
            
            [mutableStr addAttribute:NSLinkAttributeName value:url range:match.range];
            
            NSLog(@"url string == %@", url);
        }
    }
    
    
    UITextView *txtVuew = [[UITextView alloc] initWithFrame:CGRectMake(80, 100, 200, 200) textContainer:nil];
    
    [txtVuew setAttributedText:mutableStr];
    [txtVuew setEditable:NO];
    
    [self.view addSubview:txtVuew];
    
    
}




#pragma   mark    -----  visual Effect VW  ios8.0
//------------------------------------------------------visual Effect view------------
- (void)structureVisualEffectView
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *visualVw = [[UIVisualEffectView alloc] initWithEffect:effect];
    
    [visualVw.contentView setBackgroundColor:[UIColor darkGrayColor]];
    
    [visualVw setFrame:CGRectMake(80, 100, 200, 200)];
    
    [self.view addSubview:visualVw];
}


#pragma mark ----download pic using GCD   group
//----------------------------------download pic using GCD   group-----------AFNetWorking-----------
- (void)downloadImageSeprateUsingdisGrounp
{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
    
        [self networkingTest:0];
        
    });
    dispatch_group_async(group, queue, ^{
    
        [self networkingTest:1];
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    
    
    dispatch_group_async(group, queue, ^{
        
        [self networkingTest:3];
        
    });
    dispatch_group_async(group, queue, ^{
        
        [self networkingTest:2];
    });
  
}

- (void)networkingTest:(int)serialNum
{
    
    NSArray *imgVArray = [NSArray arrayWithObjects: _imgView1, _imgView2, _imgView3, _imgView4, nil];
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    // [manager setResponseSerializer:[AFXMLParserResponseSerializer serializer]];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"image/jpeg"];
    
    
    NSString *str = [urlArray objectAtIndex:serialNum];
    
    NSLog(@"string url === %@", str);
    
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
      //  NSLog(@"operation data == %@", operation.responseData);
        
        NSData *dat  =  operation.responseData;
        
        UIImage *img = [UIImage imageWithData:dat];
        
        
        UIImageView *imgV = [imgVArray objectAtIndex:serialNum];
        
        [imgV setImage:img];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}






#pragma mark ----downUse operation Queue
//-------------------------------downUse operation Queue------------------------------------------
- (void)asyncDownLoadPic
{
//    urlArray = [NSArray arrayWithObjects:@"http://cc.cocimg.com/cms/uploads/141023/4196-1410231QKLO.jpg",
//                         @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T4362253-1.jpg",
//                         @"http://cc.cocimg.com/cms/uploads/allimg/141017/0T43625E-2.jpg",
//                         @"http://cn.cocos2d-x.org/uploads/20141027/1414375938698264.jpg",nil];
    
    
    
    
    int num = (int)urlArray.count;
    
    for(int i = 0; i < num; i++)
    {
        NSString *path = [downLoadTool getCacheFile:[NSString stringWithFormat:@"%d.jpg", i]];
        
        [downLoadTool addImageToLoad:[urlArray objectAtIndex:i] needToSave:YES imageFilePath:path Tag:i delegate:self];

    }
    
    
//    NSString *path = [downLoadTool getCacheFile:@"11"];
//    
//    [downLoadTool addImageToLoad:[urlArray objectAtIndex:0] needToSave:YES imageFilePath:path Tag:0 delegate:self];
    
    
    
    
    
}
-(void)asycImageCallBack:(UIImage *)image Tag:(NSInteger)tag;
{
    
    NSLog(@" tag numbe r== %d", tag);
   // NSString *path = [downLoadTool getCacheFile:@"11"];

 //   UIImage *img = [downLoadTool loadImageFromCacheWithFilePath:path];
    
    switch (tag) {
        case 0:
              [_imgView1 setImage:image];
            break;
        case 1:
            [_imgView2 setImage:image];
            break;

        case 2:
            [_imgView3 setImage:image];
            break;

        case 3:
            [_imgView4 setImage:image];
            break;

            
        default:
            break;
    }
    
}
#pragma mark ---GCDSocket
////---------------------------------------------------GCDSocket---------------------------------

- (BOOL)connectToHost:(NSString *)host onPort:(uint16_t)port {
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *err = nil;
    if([self.socket connectToHost:@"192.168.0.102" onPort:50001 withTimeout:2 error:&err]) {
        NSLog(@"connection  YES");
        
        return YES;
    } else {
        NSLog(@"connection  failed");

        return NO;
        
    }
}

- (void)disconnect {
    [self.socket disconnect];
}

- (BOOL)isConnected {
    if (self.socket) {
        return self.socket.isConnected;
    }
    return NO;
}


- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"%s", __func__);
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    
    NSLog(@"%s", __func__);

}

- (void)writeData:(NSData *)data {
    [self.socket writeData:data withTimeout:0 tag:0];
}

- (IBAction)sendDataTohost:(id)sender
{
    
    if([self isConnected])
    {
        NSLog(@"send string success");
    }
    else
    {
        NSLog(@"send string failed");
    }
    
    
    [self sendURCDefaultCommand:0x101 withData:nil];
    
    
    [self.socket readDataWithTimeout:4 tag:0];
}
- (void)sendURCDefaultCommand:(long)commandCode withData:(NSData *)commandData {
    
    
    Byte arr[2];
    arr[0] = commandCode >> 8;
    arr[1] = commandCode & 0x00FF;
    NSMutableData *packetContent = [NSMutableData dataWithBytes:arr length:2];
    if (commandData) {
        [packetContent appendData:commandData];
    }
    
    NSLog(@"send data === %@", [self packCommandContent:packetContent]);
    
    [self writeData:[self packCommandContent:packetContent] ];
}


- (NSData *)packCommandContent:(NSData *)packetContent {
    Byte packetHead[3];
    NSInteger length = [packetContent length] + 2;
    
    packetHead[0] = 0xff;
    packetHead[1] = 0x3a;
    packetHead[2] = length & 0xff;
    
    
    
    const Byte *dataBytes = [packetContent bytes];
    
    Byte commandName[2];
    commandName[0] = dataBytes[0];
    commandName[1] = dataBytes[1];
    
    //UInt16 nameVal = (dataBytes[0] << 8) + dataBytes[1];
    
    
    NSUInteger len = [packetContent length];
    UInt8 val = 0;
    
    for(int i = 0; i < len; i++)
    {
        
        val += dataBytes[i];
    }
    
    UInt8 sum = length + val ;
    UInt8 Asum = 0x100 - sum ;
    
    NSData *CRCData = [NSData dataWithBytes:&Asum length:1];
    
    NSMutableData *finalData = [NSMutableData dataWithData:[NSData dataWithBytes:packetHead length:3]];
    [finalData appendData:packetContent];
    [finalData appendData:CRCData];
    
    
    return finalData;
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {

    NSLog(@"read data ==== %@", data);

}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag;
{
    NSLog(@"%s", __func__);

}

//---------------------------------------------------GCDSocket---------------------------------end

- (void)initWebView
{
    
//    NSString *resPath = [[NSBundle mainBundle] resourcePath];
//    NSString *filePaht = [resPath stringByAppendingFormat:@"%@",folderFile];

    
    
    NSString *resPath = [[NSBundle mainBundle] resourcePath];

    
   // NSString *html1 = [[NSBundle mainBundle] pathForResource:@"v_html" ofType:@"txt"];
 //   NSString *html111 = [resPath stringByAppendingFormat:@"%@",@"/v_html.txt"];
    NSString *html1 = [resPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",@"/v_html.txt" ]];

    NSString *html11 = [NSString stringWithContentsOfFile:html1 encoding:NSUTF8StringEncoding error:nil];
    
    NSString *htm = [NSString stringWithFormat:html11, @"1", @"\"author\":\"扬子晚报\",\"hit\":\"10\""];
    
    
    //NSString* docroot =[FileTool GetResourcesFolderFile:@"/html/index.html"];
    
    NSString *html2 = [resPath stringByAppendingString:@"/index.html"];
    
      NSURL* url = [NSURL fileURLWithPath:html2];
    
    
//    NSString *str12 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    

   // NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
  //  [self.webView loadRequest: request];
  //  [self.webView loadHTMLString:@"html" baseURL:url];

//    NSString *HTMLData = @"<img src=\"zoom.png\" />";
    [self.webView loadHTMLString:htm baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle]  bundlePath]]];
    
    
  //  [self.webView loadHTMLString:HTMLData baseURL:nil];

}
#pragma mark ---AFNetWorking
//---------------------------------------------------AFNetWorking---------------------------------

- (void)networkingTest
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
   // [manager setResponseSerializer:[AFXMLParserResponseSerializer serializer]];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    
    [manager GET:@"http://www.so-shi.com/global_api_getareacode" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
//    UISplitViewController
    
}
- (void)detectNetworkStatus
{
    NSURL *baseURL = [NSURL URLWithString:@"http://baidu.com/"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
}
//---------------------------------------------------AFNetWorking---------------------------------
//http://devcon.cocos.org/images/modianwang.jpg?12

#pragma mark ---NSURLSession-
//---------------------------------------------------NSURLSession---------------------------------
- (void)getDataUsingDataTask
{
    NSURL *url = [NSURL URLWithString:@"http://devcon.cocos.org/images/modianwang.jpg?12"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [configuration setTimeoutIntervalForRequest:5.0];
  //  NSURLSession *session = [NSURLSession sharedSession];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"data == %@  response == %@ error == %@", data, response, error);
        
        UIImage *img = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 100)];
            [imgV setImage:img];
            [self.view addSubview:imgV];
       //     [self.imgView1 setImage:img];
        });
        
    }];
    
    [task resume];
}
- (void)getDataUsingDownLoadTask
{
    NSURL *url = [NSURL URLWithString:@"http://devcon.cocos.org/images/modianwang.jpg?12"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        
        NSLog(@"response == %@ location ===%@ ", response, location);

        
        NSString *path = [self pathss];
        
        NSURL *documentsDirectoryURL = [NSURL fileURLWithPath:path];
        
        NSURL *newFileUrl = [documentsDirectoryURL URLByAppendingPathComponent:[[response URL] lastPathComponent]];
        
        [[NSFileManager defaultManager] copyItemAtPath:[location path] toPath:[newFileUrl path] error:nil];
        
        
        
        UIImage *img = [UIImage imageWithContentsOfFile:[newFileUrl path]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 100)];
            [imgV setImage:img];
            [self.view addSubview:imgV];

            [self.imgView1 setImage:img];
        });

    }];
    
    [task resume];
    
  /*
    __block NSData *data = nil;
    
    if(task)// 取消下载 保存数据
    {
        [task cancelByProducingResumeData:^(NSData *resumeData){
            data =  [NSData dataWithData:resumeData];
   task = nil;
        }];
    }
    
    ///接着下载
    if(data)
    {
        task = [session downloadTaskWithResumeData:data];
        data = nil;//but why

    }
    else
    {
        task = [session downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@""]]];
    }
    
    [task resume];
    
    */
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: NO];
    
//    [self beginBackgroundSessionToDownload];
}
- (NSString *)pathss
{
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    return str;
}

//background session

- (void)beginBackgroundSessionToDownload
{
    NSURL *url = [NSURL URLWithString:@"http://devcon.cocos.org/images/modianwang.jpg?12"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    self.backgrounTask = [[self backgroundSession] downloadTaskWithRequest:request];
    
    [self.backgrounTask resume];
}

//background session
- (NSURLSession *)backgroundSession
{
    static NSURLSession *backgroundSession = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        
        NSURLSessionConfiguration *config2 = [NSURLSessionConfiguration backgroundSessionConfiguration:@"com.hansong.softt"];

//        NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.hansong.software"];
//        
//        NSURLSessionConfiguration *config1 = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.hansong.soft"];
        
        
        backgroundSession = [NSURLSession sessionWithConfiguration:config2 delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        
    });
    
    return backgroundSession;

}
/*
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    if(session == [self backgroundSession])
    {
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        
        if(delegate.backgroundURLSessionCompletionHandler)
        {
            void (^hanle)() = delegate.backgroundURLSessionCompletionHandler;
            delegate.backgroundURLSessionCompletionHandler = nil;
            NSLog(@"handle = == %@", hanle);
            hanle();
        }
    }
}



- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session NS_AVAILABLE_IOS(7_0);
{
    if(session == [self backgroundSession])
    {
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        
        if(delegate.backgroundURLSessionCompletionHandler)
        {
          //  void (^handle)() = delegate.backgroundURLSessionCompletionHandler;
            self.block = delegate.backgroundURLSessionCompletionHandler;
            delegate.backgroundURLSessionCompletionHandler = nil;
            [self dealBlcok:self.block];
        }
    }
    
}
- (void)dealBlcok:(void (^)()) block
{
    NSLog(@"hello world");
}

 */
#pragma mark ---Message forwarding
//-------------------------message forwarding-----
void autoDictionarySetter(id self, SEL _cmd)
{
    
}
void autoDictionaryGetter(id self, SEL _cmd)
{
    
}


+ (BOOL)resolveInstanceMethod:(SEL)selector {
    NSString *selectorString = NSStringFromSelector(selector);
    //if ( /* selector is from a @dynamic property */ ) {
        if ([selectorString hasPrefix:@"set"]) {
            class_addMethod(self,
                            selector,
                            (IMP)autoDictionarySetter,
                            "v@:@");
        } else {
            class_addMethod(self,
                            selector,
                            (IMP)autoDictionaryGetter,
                            "@@:");
        }
        return YES;
    //}
    return [super resolveInstanceMethod:selector];
}

- (id)forwardingTargetForSelector:(SEL)selector
{
    return self;
}

//---------------------------------------------------NSURLSession---------------------------------


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
