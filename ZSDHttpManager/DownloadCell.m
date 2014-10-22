//
//  DownloadCell.m
//  ZSDDownloadManager
//
//  Created by 胡晓桥 on 14-10-17.
//  Copyright (c) 2014年 Qian100. All rights reserved.
//

#import "DownloadCell.h"

#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject]

#define resourcePath @"http://w.x.baidu.com/alading/anquan_soft_down_all/25677"

@implementation DownloadCell

- (void)awakeFromNib {
    if (self.progressView.progress!=0) {
        self.progressView.progress = 0;
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (IBAction)beginDownload:(id)sender {
    NSLog(@"%d",_isStartDownload);
    if (!_isStartDownload) {
        _isStartDownload = YES;
        [self downloadFromSever];
        [self.downloadBtn setTitle:@"暂停" forState:UIControlStateNormal];
    }
    
    if (!_isPause)
    {
        _isPause = !_isPause;
        [self.downloadBtn setTitle:@"继续" forState:UIControlStateNormal];
        [_downloadManager pause];
    }else
    {
        _isPause = !_isPause;
        [self.downloadBtn setTitle:@"暂停" forState:UIControlStateNormal];
        [_downloadManager resume];
    }
}

- (void)downloadFromSever
{
    _downloadManager = [ZSDDownloadManager sharedInstance];
    int i = arc4random() % 10;
    NSString *targetPath = [DocumentsDirectory stringByAppendingString:[NSString stringWithFormat:@"qq%d.dmg",i]];
    [_downloadManager downloadWithUrl:resourcePath targetPath:targetPath progressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        float percentDone = totalBytesRead / (float)totalBytesExpectedToRead;
        self.progressView.progress = percentDone;
        self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",percentDone*100];
        
        self.currentSizeLabel.text = [NSString stringWithFormat:@"CUR : %lli M",totalBytesRead/1024/1024];
        self.totalSizeLabel.text = [NSString stringWithFormat:@"TOTAL : %lli M",totalBytesExpectedToRead/1024/1024];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@ 下载成功！",targetPath);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error.description);
    }];
    
}


@end
