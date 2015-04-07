//
//  downLoadTool.m
//  Demo
//
//  Created by Tony on 14/10/27.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import "downLoadTool.h"
#import <CommonCrypto/CommonDigest.h>


static NSOperationQueue* operateQueue;



@implementation downLoadTool

+ (NSString *)getCacheFile:(NSString *)file{
    return [NSString stringWithFormat:@"%@/Library/Caches/%@", NSHomeDirectory(),file];
}

//将字符串转成MD5
+ (NSString *)MD5Value:(NSString *)str{
    if (str==nil) {
        return nil;
    }
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}


//下载图片到UIImageView
+(void) addImageToLoad:(NSString*)url
             imageView:(UIImageView*)imageView
            needToSave:(BOOL)toSave
         imageFilePath:(NSString*)imageFilePath		 //本地图片路径
                   Tag:(NSInteger)tag
              delegate:(id<NSObject>)delegate
{
    
   NSString *imgPath = [self getCacheFile:[self MD5Value:url]];

    downLoadImageTool *op = [[downLoadImageTool alloc] initWithURL:url toSavePicture:toSave imageFilePath:imgPath Tag:tag delegate:delegate];
    
    [operateQueue addOperation:op];
    
    [op release];
    
}

//队列下载图片
+(void) addImageToLoad:(NSString*)url
            needToSave:(BOOL)toSave
         imageFilePath:(NSString*)imageFilePath		 //本地图片路径
                   Tag:(NSInteger)tag
              delegate:(id<NSObject>)delegate
{
    NSString *path = [self MD5Value:url];
    
    NSString *imgPath = [self getCacheFile:path];

    
    
    
    downLoadImageTool *op =[[downLoadImageTool alloc] initWithURL:url toSavePicture:toSave imageFilePath:imgPath Tag:tag delegate:delegate];
    
    [operateQueue addOperation:op];
    [op release];
}

//根据路径 读取本地缓存的图片
+(UIImage*) loadImageFromCacheWithFilePath:(NSString*)path
{
    return [[[UIImage alloc] initWithContentsOfFile:path] autorelease];
}

//根据图片url 读取本地缓存的图片
+(UIImage*) loadImageFromCacheWithUrl:(NSString*)url
{
    NSString* path = [self getCacheFile:[self MD5Value:url]];
    return [self loadImageFromCacheWithFilePath:path];
}

+(void)cancelQueueDownload
{
    if(operateQueue)
    {
        [operateQueue cancelAllOperations];
    }
}
//stop the opeartion in queue
+ (void)pauseDownloadWithUrl:(NSString *)url
{
    NSArray *opeartions = [operateQueue operations];
    
    for( NSObject *tool in opeartions)
    {
        downLoadImageTool *filetool = (downLoadImageTool *)tool;
        
        if([filetool.imageUrl isEqualToString:url])
        {
            filetool.finished = YES;
            [filetool cancel];
            
            break;
        }
    }
}



@end


@implementation downLoadImageTool

//普通下载
-(id) initWithURL:(NSString*)url
    toSavePicture:(BOOL)shouldSave
    imageFilePath:(NSString*)imageFilePath		 //本地图片路径
              Tag:(NSInteger)tag
         delegate:(id)delegate
{
    if(!(self = [super init]))
        return nil;
    
    
    if(url)
    {
        _strImageURL = [NSString stringWithString:url];
        
    }
    
    if(operateQueue == nil)
    {
        operateQueue = [[NSOperationQueue alloc] init];
        [operateQueue setMaxConcurrentOperationCount:2];
    }
    
    _needToSave = shouldSave;
    
    if(delegate)
    {
        _delegate = delegate;
    }
    
    _tag = tag;
    
    _clipSize = CGSizeZero;
    _scaleSize = CGSizeZero;
    
    _imgVToShow = nil;
    
    self.imageFilePath = [[NSString alloc] initWithString:imageFilePath];
    
    
    return self;
    
}

- (void)main
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    if(![self isCancelled])
    {
        if(_strImageURL && _strImageURL.length > 0)
        {
            NSString *strUrl = [NSString stringWithString:[_strImageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            finished = NO;
            
            NSURL *url = [NSURL URLWithString:strUrl];
            
            if(_con)
            {
                [_con cancel];
                _con = nil;
            }
            
            
            
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [url  release];
            
            _buf = [[NSMutableData alloc] init];
            
            _con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            
            
            [_con start];
            
            
            
            while (!finished) {
                
                  NSLog(@"internal  loop");

                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            [_con cancel];
            _con = nil;
            
        }
    }
    
    [pool release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_buf setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_buf appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    finished = YES;
    
    UIImage *image = [[UIImage alloc] initWithData:_buf];
    
    
  //  [self performSelectorOnMainThread:@selector(didGetImage:) withObject:image waitUntilDone:YES];
    
    //保存图片 保存的是修改后的图片
   
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(asycImageCallBack:Tag:)])
    {
        [_delegate asycImageCallBack:image Tag:_tag];
    }

    
    
    if (image && _imageFilePath && _needToSave)
    {
        [UIImagePNGRepresentation(image) writeToFile:_imageFilePath atomically:YES];
    }
    
    
    
    if(_buf)
    {
        [_buf release];
        _buf = nil;
    }
    
    [image release];
    
    
}
- (void)didGetImage:(UIImage *)image
//-(void)setImageView:(UIImage *)image
{
    //保存图片 保存的是修改后的图片
    if (image && _imageFilePath && _needToSave)
    {
        [UIImagePNGRepresentation(image) writeToFile:_imageFilePath atomically:YES];
    }
    
    //显示
    if(_imgVToShow)
    {
        _imgVToShow.image  = image;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(asycImageCallBack:Tag:)])
    {
        [_delegate asycImageCallBack:image Tag:_tag];
    }
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    finished = YES;
    
    if(_buf)
    {
        [_buf release];
        _buf = nil;
    }
}

- (void)dealloc {
    
    
    //DLog(@"DownLoadImageTool  dealloc");
    if(_con)
    {
        [_con cancel];
        [_con release];
        _con = nil;
    }
    
    if(_buf)
    {
        [_buf release];
        _buf = nil;
    }
    
//    if(_button)
//    {
//        [_button release];
//        _button = nil;
//    }
    
    if (_strImageURL)
    {
        [_strImageURL release];
        _strImageURL = nil;
    }
    
    if (_imageFilePath)
    {
        [_imageFilePath release];
        _imageFilePath = nil;
    }
    
    if (_imgVToShow)
    {
        [_imgVToShow release];
        _imgVToShow = nil;
    }
    
    
    _delegate = nil;
    
    [super dealloc];
}

@end



@implementation downLoadImageTool_1

-(id) initWithURL:(NSString*)url
    toSavePicture:(BOOL)shouldSave
    imageFilePath:(NSString*)imageFilePath		 //本地图片路径
              Tag:(NSInteger)tag
         delegate:(id)delegate;
{
    
    self = [super init];
    
    if(!self)
        return nil;
    
    
    
    if(operateQueue == nil)
    {
        operateQueue = [[NSOperationQueue alloc] init];
        [operateQueue setMaxConcurrentOperationCount:2];
    }
    
    urlString = url;
    
    _delegate = delegate;
    
    return self;
}

- (void)main
{
    
    NSString *str = [NSString stringWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:str];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    
    
    
    
    
    
    
}

@end

