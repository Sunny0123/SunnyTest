//
//  UIImageView+MyImageView.m
//  Autolayout
//
//  Created by Sunny Zhang on 16/9/29.
//  Copyright © 2016年 RainSets. All rights reserved.
//

#import "UIImageView+MyImageView.h"

@implementation UIImageView(MyImageView)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//在.m去实现此方法
- (void)loadIamgeWithURL:(NSString *)urlString
{
    
    //创建下载图片的url
    NSURL *url = [NSURL URLWithString:urlString];
    
    //创建网络请求配置类
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //创建网络会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:[NSOperationQueue new]];
    
    //创建请求并设置缓存策略以及超时时长
    NSURLRequest *imgRequest = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:30.f];
    //*也可通过configuration.requestCachePolicy 设置缓存策略
    
    //创建一个下载任务
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:imgRequest completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //下载完成后获取数据 此时已经自动缓存到本地，下次会直接从本地缓存获取，不再进行网络请求
        NSData * data = [NSData dataWithContentsOfURL:location];
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //设置图片
            self.image = [UIImage imageWithData:data];
        });
        
        
    }];
    
    
    //启动下载任务
    [task resume];
    
}

@end
