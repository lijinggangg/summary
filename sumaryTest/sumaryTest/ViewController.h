//
//  ViewController.h
//  Demo
//
//  Created by Tony on 14-10-11.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "GCDAsyncSocket.h"
#import "downLoadTool.h"



@class  GCDAsyncSocket;


typedef void (^handle)();


@interface ViewController : UIViewController<GCDAsyncSocketDelegate, DownLoadOperationDelegate, UITableViewDataSource, NSURLSessionDownloadDelegate, NSURLSessionDelegate>
{
    NSArray *urlArray;
}


@property (nonatomic, retain) IBOutlet UIImageView    *imgView1,  *imgView2,  *imgView3,  *imgView4;

@property (nonatomic, retain) IBOutlet UIWebView      *webView;


@property (nonatomic, retain)  NSURLSessionDownloadTask    *backgrounTask;

@property (nonatomic, retain) NSURLSession                 *backGroundSession;

@property (nonatomic, copy)  handle   block;


@property (nonatomic, retain) GCDAsyncSocket          *socket;

@end

