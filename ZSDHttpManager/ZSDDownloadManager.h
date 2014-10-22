//
//  ZSDDownloadManager.h
//  AFResumingDownload
//
//  Created by 胡晓桥 on 14-10-16.
//  Copyright (c) 2014年 Netspectrum Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFDownloadRequestOperation.h"

@interface ZSDDownloadManager : AFDownloadRequestOperation
@property (nonatomic, strong) AFDownloadRequestOperation *operation;
@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, copy) NSString *targetpath;

/**
 *  singleton
 *
 *  @return ZSDDownloadManager singleton
 */
+ (ZSDDownloadManager *)sharedInstance;

/**
 *  从网络下载资源
 *  @param urlStr 资源url
 *  @param targetPath  存放下载资源的目标路径
 *  @param progress 下载进度回调block
 *  @param success success callback
 *  @param failure failure callback
 */
- (void)downloadWithUrl:(NSString *)urlStr
             targetPath:(NSString *)targetPath
          progressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))progress
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
/*
 *暂停下载
 */
- (void)pause;

/*
 *继续下载
 */
- (void)resume;

/**
 *  取消下载
 */
- (void)cancel;


@end
