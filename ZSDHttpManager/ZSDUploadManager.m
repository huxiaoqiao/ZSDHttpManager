//
//  ZSDUploadManager.m
//  ZSDhttpManager
//
//  Created by 胡晓桥 on 14/10/20.
//  Copyright (c) 2014年 Qian100. All rights reserved.
//

#import "ZSDUploadManager.h"

@implementation ZSDUploadManager


- (void)uploadWithRequestUrl:(NSString *)requestUrl
                    fromFile:(NSString *)filePath
              progress:(NSProgress * __autoreleasing *)progress
     completionHandler:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filepath = [NSURL fileURLWithPath:filePath];
    _uploadTask = [manager uploadTaskWithRequest:request fromFile:filepath progress:progress completionHandler:completionHandler];
    [_uploadTask resume];
}


- (void)cancel
{
    [_uploadTask cancel];
}



//- (void)prepareCode1
//{
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
//    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"Success: %@ %@", response, responseObject);
//        }
//    }];
//    [uploadTask resume];
//}
//
//- (void)prepareCode2
//{
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
//    } error:nil];
//    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSProgress *progress = nil;
//    
//    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"%@ %@", response, responseObject);
//        }
//    }];
//    
//    [uploadTask resume];
//}

@end
