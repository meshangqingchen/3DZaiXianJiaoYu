//
//  KDNetAPIManager.h
//  无限教育
//
//  Created by 3D on 16/10/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger , NetworkMethod) {
    Get = 0,
    Post,
    
};
//cc/json/mobile_tel_segment.htm?



//192.168.1.113/3d/api.php/home/api/
//192.168.1.113/web/shop/index.php?
//wxswjy.com
//http://192.168.1.113/3d/api.php/home/api/login_in?user_name=lcc&password=123123

//测试接口  http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=218.4.255.255
//http://www.wxswjy.com/api.php/home/api/
//http://www.wxswjy.com/api2.php/home/ 服务器上的
//@"http://192.168.1.108/3d/api.php/home/" 测试
static NSString *const AppNetAPIBaseURLString = @"http://192.168.1.108/3d/api.php/home/";


@interface KDNetAPIManager : AFHTTPSessionManager

+ (instancetype)sharedJsonClient;

//andBaseApi:(NSString *)baseApi

-(NSURLSessionDataTask *)requestJsonDataWithPath:(NSString *)aPath encodeParams:(NSDictionary *)params withMethodType:(NetworkMethod)method andBaseApi:(NSString *)baseApi completeHandle:(void(^)(id responseObj,NSError *error))complete;
///检查更行
-(NSURLSessionDataTask *)checkAppUpdateWithPath:(NSString *)aPath  completeHandle:(void(^)(id responseObj,NSError *error))complete;

///图片上传
-(NSURLSessionDataTask *)uploadImageApi:(NSString *)aPath
                          withParams:(NSDictionary *)params
                            andImage:(UIImage *)image
                         andfilename:(NSString *)filename
                             andName:(NSString *)name
                       andMethodType:(NetworkMethod)method
                         andMimeType:(NSString *)mimeType
                      completeHandle:(void(^)(id responseObj,NSError *error))complete;


@end
