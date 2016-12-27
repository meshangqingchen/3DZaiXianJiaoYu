//
//  LCCourseDownLoadCellViewModel.h
//  3D打印教育
//
//  Created by 3D on 16/12/26.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {

    DownloadStateNoCompleted = 0,
    DownloadStateCompleted

}DownloadState;

@interface LCCourseDownLoadCellViewModel : NSObject
@property(nonatomic,strong) NSString *title;
@property(nonatomic) DownloadState downLoadState;
-(instancetype)initWithModel:(id)viewModel;
@end
