//
//  ZSDDownloadManager.m
//  AFResumingDownload
//
//  Created by 胡晓桥 on 14-10-16.
//  Copyright (c) 2014年 Netspectrum Inc. All rights reserved.
//

#import "ZSDDownloadManager.h"

@implementation ZSDDownloadManager

+ (ZSDDownloadManager *)sharedInstance
{
    static ZSDDownloadManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)downloadWithUrl:(NSString *)urlStr
             targetPath:(NSString *)targetPath
          progressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))progress
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    _urlStr = urlStr;
    _targetpath = targetPath;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:3600];
    
    _operation = [[AFDownloadRequestOperation alloc] initWithRequest:request targetPath:targetPath shouldResume:YES];
    [_operation setDownloadProgressBlock:progress];
    [_operation setCompletionBlockWithSuccess:success failure:failure];
    [_operation start];
}

- (void)pause
{
    [_operation pause];
}
- (void)resume
{
    [_operation resume];
}
- (void)cancel
{
    [_operation cancel];
}

@end
