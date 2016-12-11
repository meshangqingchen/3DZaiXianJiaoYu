//
//  KDFileManager.h
//  KD_Tools
//
//  Created by BigData on 16/7/26.
//  Copyright © 2016年 kingdream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDFileManager : NSObject

/// 把对象归档存到沙盒里
+ (void)saveObject:(id)object byFileName:(NSString *)fileName;

/// 通过文件名从沙盒中找到归档的对象
+ (id)getObjectByFileName:(NSString *)fileName;

/// 根据文件名删除沙盒中的 plist 文件
+ (void)removeFileByFileName:(NSString *)fileName;

/// 存储用户偏好设置 到 NSUserDefults
+ (void)saveUserData:(id)data forKey:(NSString *)key;

/// 读取用户偏好设置
+ (id)readUserDataForKey:(NSString *)key;

/// 删除用户偏好设置
+ (void)removeUserDataForkey:(NSString *)key;

/// 获取应用程序路径
+ (NSString *)getApplicationPath;

/// 提供获取document路径
+ (NSString *)getDocumentPath;

/// 获取cache缓存路径
+ (NSString *)getCachePath;

/// 获取temp路径
+ (NSString *)getTempPath;

/// 判断文件是否存在
+ (BOOL)isExist:(NSString *)filePath;

/// 判断文件是否存在并且数据完整
+ (BOOL)isFull:(NSString *)filePath fullSize:(long long)fullSize;

/// 删除文件
+ (BOOL)removeFile:(NSString *)filePath;
+ (BOOL)removeFileURL:(NSURL *)fileURL;

///删除文件夹里的所有内容
+ (void)clearFolderOfContent:(NSString *)folderPath CompleteHandle:(void (^)())complete;

/// 创建目录
+ (BOOL)createAtDir:(NSString *)dirPath;
/// 创建文件夹 如果中间的文件夹没有生成  也可以默认生成
+ (BOOL)createDir:(NSString *)dirPath;

/// 创建文件  如果中间的文件夹没有生成  也可以默认生成
+ (BOOL)createFile:(NSString *)filePath;

/// 保存文件
+ (BOOL)saveFile:(NSString *)filePath andData:(NSData *)data;

/// 追加写文件
+ (void)saveFileWithAppendData:(NSData *)data withPath:(NSString *)path;

/// 读取文件
+ (NSData *)getFileData:(NSString *)path;

+ (NSData *)getFileData:(NSString *)path
             startIndex:(long long)startIndex
                 length:(long long)length;

/// 移动文件
+ (BOOL)moveFileFromPath:(NSString *)from toPath:(NSString *)to;

/// 拷贝文件
+ (BOOL)copyFIleFromPath:(NSString *)from toPath:(NSString *)to;

/// 获取文件夹下文件列表
+ (NSArray *)getFileListInDirPath:(NSString *)dirPath;

#pragma mark - 获取文件属性
/// 获取文件大小
//+ (unsigned long long)getFileSize:(NSString *)filePath;
+ (unsigned long long)fileSizeAtPath:(NSString*)filePath;
/// 获取文件夹大小
+ (float ) folderSizeAtPath:(NSString*) folderPath;
/// 获取文件创建日期
+ (NSDate *)getFileCreateDate:(NSString *)filePath;
/// 获取文件所有者
+ (NSString *)getFileOwner:(NSString *)filePath;
/// 获取文件更改日期
+ (NSDate *)getFileChangeDate:(NSString *)filePath;

@end
