//
//  downLoadTool.h
//  Demo
//
//  Created by Tony on 14/10/27.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@protocol DownLoadOperationDelegate<NSObject>
@required
@optional

//图片下载回调
//image：图片 imgPath:图片保存路径
-(void)asycImageCallBack:(UIImage *)image Tag:(NSInteger)tag;
-(void)asycFilePathCallBack:(NSString *)filePath;

-(void)DownloadClientCallBack;
-(void)DownloadClientCallBack:(id)value;
-(void)DownloadClientState:(double)size fullSize:(double)fsize;
-(void)DownloadClientError:(NSError *)error;
@end


@interface downLoadTool : NSObject<DownLoadOperationDelegate>



+(void) addImageToLoad:(NSString*)url
            needToSave:(BOOL)toSave
         imageFilePath:(NSString*)imageFilePath		 //本地图片路径
                   Tag:(NSInteger)tag
              delegate:(id<NSObject>)delegate;


//根据路径 读取本地缓存的图片
+(UIImage*) loadImageFromCacheWithFilePath:(NSString*)path;
//根据图片url 读取本地缓存的图片
+(UIImage*) loadImageFromCacheWithUrl:(NSString*)url;


+(void)cancelQueueDownload;
+ (void)pauseDownloadWithUrl:(NSString *)url;
+ (NSString *)getCacheFile:(NSString *)file;




@end


@interface downLoadImageTool : NSOperation
{
    NSString    *_strImageURL;
    
    
    UIImageView *_imgVToShow;
    
    
    id<DownLoadOperationDelegate> _delegate;

    
    
    UIControlState    _state;
    
    
    NSURLConnection   *_con;
    
    NSMutableData     *_buf;
    
    
    BOOL              finished;
    
    
    

}
//裁剪大小
@property(nonatomic,assign) CGSize clipSize;
//缩放大小
@property(nonatomic,assign) CGSize scaleSize;
//是否保存图片
@property(nonatomic,assign) BOOL needToSave;
//标签值
@property(nonatomic,assign) NSInteger tag;
//是否自动设置UIImageView或者UIButton
//@property(nonatomic,assign) BOOL shouldAutoSet;
@property(nonatomic,assign) BOOL isAnimating;
@property(nonatomic,assign) BOOL finished;
@property(nonatomic,readonly) NSString *imageUrl;

@property (nonatomic, retain)     NSString    *imageFilePath;



-(id) initWithURL:(NSString*)url
    toSavePicture:(BOOL)shouldSave
    imageFilePath:(NSString*)imageFilePath		 //本地图片路径
              Tag:(NSInteger)tag
         delegate:(id)delegate;
@end








@interface downLoadImageTool_1 : NSOperation
{
    BOOL              finished;

     id<DownLoadOperationDelegate> _delegate;
    
    NSString    *urlString;
    
}

-(id) initWithURL:(NSString*)url
    toSavePicture:(BOOL)shouldSave
    imageFilePath:(NSString*)imageFilePath		 //本地图片路径
              Tag:(NSInteger)tag
         delegate:(id)delegate;








@end










