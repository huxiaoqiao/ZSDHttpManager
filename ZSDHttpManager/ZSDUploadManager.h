//
//  ZSDUploadManager.h
//  ZSDhttpManager
//
//  Created by 胡晓桥 on 14/10/20.
//  Copyright (c) 2014年 Qian100. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLSessionManager.h"

#define kRequestUrl @""

@interface ZSDUploadManager : NSObject

@property (nonatomic) NSURLSessionUploadTask *uploadTask;

/**
 *  上传文件到服务器
 *
 *  @param requestUrl        服务器地址
 *  @param filePath          上传的文件路径
 *  @param progress          上传进度
 *  @param completionHandler 上传成功后的回调
 */
- (void)uploadWithRequestUrl:(NSString *)requestUrl
                    fromFile:(NSString *)filePath
                    progress:(NSProgress * __autoreleasing *)progress
           completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

/**
 *  取消上传
 */
- (void)cancel;

@end
