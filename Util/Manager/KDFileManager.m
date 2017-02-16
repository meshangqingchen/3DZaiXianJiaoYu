//
//  KDFileManager.m
//  KD_Tools
//
//  Created by BigData on 16/7/26.
//  Copyright © 2016年 kingdream. All rights reserved.
//

#import "KDFileManager.h"

@implementation KDFileManager

/// 把对象归档存到沙盒里
+ (void)saveObject:(id)object byFileName:(NSString *)fileName {
  NSString *path = [self appendFilePath:fileName];

  [NSKeyedArchiver archiveRootObject:object toFile:path];
}

/// 通过文件名从沙盒中找到归档的对象
+ (id)getObjectByFileName:(NSString *)fileName {

  NSString *path = [self appendFilePath:fileName];

  return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

// 根据文件名删除沙盒中的 plist 文件
+ (void)removeFileByFileName:(NSString *)fileName {
  NSString *path = [self appendFilePath:fileName];

  [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

/// 拼接文件路径
+ (NSString *)appendFilePath:(NSString *)fileName {

  NSString *documentsPath =
      [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];

  NSString *file =
      [NSString stringWithFormat:@"%@/%@.archiver", documentsPath, fileName];

  return file;
}

/// 存储用户偏好设置 到 NSUserDefults
+ (void)saveUserData:(id)data forKey:(NSString *)key {
  if (data) {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
  }
}

/// 读取用户偏好设置
+ (id)readUserDataForKey:(NSString *)key {
  return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/// 删除用户偏好设置
+ (void)removeUserDataForkey:(NSString *)key {
  [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

/// 获取应用程序路径
+ (NSString *)getApplicationPath {
    return NSHomeDirectory();
}

/// 提供获取document路径
+ (NSString *)getDocumentPath {
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return filePaths.firstObject;
}

/// 获取cache缓存路径
+ (NSString *)getCachePath {
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return filePaths.firstObject;
}

/// 获取temp路径
+ (NSString *)getTempPath {
    return NSTemporaryDirectory();
}

/// 判断文件是否存在
+ (BOOL)isExist:(NSString *)filePath {
    BOOL flag = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        flag = YES;
    }
    else
    {
        flag = NO;
    }
    return flag;
}

/// 判断文件是否存在并且数据完整
+ (BOOL)isFull:(NSString *)filePath fullSize:(long long)fullSize {
    BOOL flag = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        flag = YES;
        long long temp = [self getFileSize:filePath];
        if (temp != fullSize) {
            flag = NO;
        }
    }
    else
    {
        flag = NO;
    }
    return flag;
}


/// 删除文件
+ (BOOL)removeFile:(NSString *)filePath {
    BOOL flag = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        if (![fileManager removeItemAtPath:filePath error:nil]) {
            flag = NO;
        }
    }
    return flag;
}

+ (BOOL)removeFileURL:(NSURL *)fileURL {
    BOOL flag = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:fileURL.path]) {
        if (![fileManager removeItemAtURL:fileURL error:nil]) {
            flag = NO;
        }
    }
    return flag;
}
/// 删除文件夹里的所有数据
+ (void)clearFolderOfContent:(NSString *)folderPath CompleteHandle:(void (^)())complete{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        for (NSString *p in files) {
            NSError *error;
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            complete();
        });
    });
}

/// 创建目录
+ (BOOL)createAtDir:(NSString *)dirPath {
    BOOL ret = YES;
    BOOL isDirExist = [[NSFileManager defaultManager] fileExistsAtPath:dirPath];
    if (!isDirExist) {
        NSError *error;
        BOOL bCreateDir = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (!bCreateDir) {
            ret = NO;
            NSLog(@"createDir Failed. error = %@",error);
        }
    }
    return NO;
}

/// 创建文件夹 如果中间的文件夹没有生成  也可以默认生成
+ (BOOL)createDir:(NSString *)dirPath {
    BOOL ret = YES;
    NSString *header = [NSString stringWithString:dirPath];
    NSMutableArray *stack = [NSMutableArray arrayWithCapacity:5];
    if (![self isExist:dirPath]) {
        [stack addObject:[header lastPathComponent]];
        header = [header stringByDeletingLastPathComponent];
    }
    NSString *lastobj = nil;
    while ([stack count] > 0 && (lastobj = [stack lastObject])) {
        header = [header stringByAppendingPathComponent:lastobj];
        ret = [self createDir:header];
        if (!ret) {
            return ret;
        }
        if ([stack count] > 0) {
            [stack removeLastObject];
        }
    }
    return ret;
}

/// 创建文件  如果中间的文件夹没有生成  也可以默认生成
+ (BOOL)createFile:(NSString *)filePath {
    
    BOOL result=YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL temp= [fileManager fileExistsAtPath:filePath];
    if(temp){
        return YES;
    }
    NSError *error=nil;
    
    NSString *dirPath=[filePath stringByDeletingLastPathComponent];
    result = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if(error){
        NSLog(@"create file error :%@",error);
    }
    if(!result){
        return result;
    }
    
    result= [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    return result;
}

/// 保存文件
+ (BOOL)saveFile:(NSString *)filePath andData:(NSData *)data {

    BOOL ret = YES;
    ret = [self createFile:filePath];
    if (ret) {
        ret = [data writeToFile:filePath atomically:YES];
        if (!ret) {
            NSLog(@"saveFile:(NSString *)filePath andData:(NSData *)dat failed");
        }
    }else{
        NSLog(@"+(BOOL)saveFile:(NSString *)filePath andData:(NSData *)data createFile failed");
    }
    return ret;
}

/// 追加写文件
+ (void)saveFileWithAppendData:(NSData *)data withPath:(NSString *)path {
    BOOL result=[self createFile:path];
    //TODO:这里频繁开关通道和写入 有优化的空间 ，拿着开好的handle 分批写入 并且在完成或失败后 关闭文件通道
    if(result){
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
        [handle seekToEndOfFile];
        [handle writeData:data];
        [handle synchronizeFile];
        [handle closeFile];
    }else{
        NSLog(@"saveFileWithAppendData createFile failed");
    }
}

/// 读取文件
+ (NSData *)getFileData:(NSString *)path {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData *data = [handle readDataToEndOfFile];
    [handle closeFile];
    return data;
}

+ (NSData *)getFileData:(NSString *)path startIndex:(long long)startIndex length:(long long)length {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    [handle seekToFileOffset:startIndex];
    NSData *data = [handle readDataOfLength:(NSUInteger)length];
    [handle closeFile];
    return data;
}

/// 移动文件
+ (BOOL)moveFileFromPath:(NSString *)from toPath:(NSString *)to {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:from])
        return NO;
    
    if ([fileManager fileExistsAtPath:to])
        [self removeFile:to];
    
    NSString *headerComponent = [to stringByDeletingLastPathComponent];
    if ([self createAtDir:headerComponent])
        return [fileManager moveItemAtPath:from toPath:to error:nil];
    else
        return NO;
}

/// 拷贝文件
+ (BOOL)copyFIleFromPath:(NSString *)from toPath:(NSString *)to {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:from])
        return NO;
    
    if ([fileManager fileExistsAtPath:to])
        [self removeFile:to];
    
    NSString *headerComponent = [to stringByDeletingLastPathComponent];
    if ([self createAtDir:headerComponent])
        return [fileManager copyItemAtPath:from toPath:to error:nil];
    else
        return NO;
}

/// 获取文件夹下文件列表
+ (NSArray *)getFileListInDirPath:(NSString *)dirPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    //fileList便是包含有该文件夹下所有文件的文件名及文件夹名的数组
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:dirPath error:&error];
    if (error) {
        NSLog(@"getFileListInDirPath error = %@",error);
    }
    return fileList;
}

#pragma mark - 获取文件属性
/// 获取文件大小
+ (unsigned long long)getFileSize:(NSString *)filePath {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    NSLog(@"====%@",filePath);
    unsigned long long i= [handle seekToEndOfFile];
    NSLog(@"=======%llu",i);
    [handle closeFile];
    
    return i;
}

+ (unsigned long long)fileSizeAtPath:(NSString*)filePath{
    NSFileManager* manager =[NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil]fileSize];
    }
    return 0;
}

+(float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}



/// 获取文件创建日期
+ (NSDate *)getFileCreateDate:(NSString *)filePath {
    NSDate *fileCreateDate = nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
    fileCreateDate = [fileAttributes objectForKey:NSFileCreationDate];
    
    return fileCreateDate;
}
/// 获取文件所有者
+ (NSString *)getFileOwner:(NSString *)filePath {
    NSString *fileOwner = nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
    fileOwner = [fileAttributes objectForKey:NSFileOwnerAccountName];
    
    return fileOwner;
}
/// 获取文件更改日期
+ (NSDate *)getFileChangeDate:(NSString *)filePath {
    NSDate *date = nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:nil];
    date = [fileAttributes objectForKey:NSFileModificationDate];
    
    return date;
}

@end
