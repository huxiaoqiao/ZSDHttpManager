//
//  DownloadCell.h
//  ZSDDownloadManager
//
//  Created by 胡晓桥 on 14-10-17.
//  Copyright (c) 2014年 Qian100. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZSDDownloadManager.h"

@interface DownloadCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *currentSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic) BOOL isStartDownload;
@property (nonatomic) BOOL isPause;
@property (nonatomic,strong) ZSDDownloadManager *downloadManager;
@end
