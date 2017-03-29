//
//  KDNetAPIManager.m
//  无限教育
//
//  Created by 3D on 16/10/14.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "KDNetAPIManager.h"
#import "NSObject+Common.h"
#import "KDFileManager.h"

static NSTimeInterval kAppNetTimeoutInterval = 30;



@implementation KDNetAPIManager

static KDNetAPIManager *_sharedManager = nil;
static dispatch_once_t onceToken;

+(instancetype)sharedJsonClient{
    dispatch_once(&onceToken, ^{
        _sharedManager = [[KDNetAPIManager alloc]init];
    });
    return _sharedManager;
}

-(instancetype)init{
    if (self = [super init]) {
        self.requestSerializer.timeoutInterval = kAppNetTimeoutInterval;
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html",@"text/plain", nil];
    }
    return self;
}



-(NSURLSessionDataTask *)requestJsonDataWithPath:(NSString *)aPath encodeParams:(NSDictionary *)params withMethodType:(NetworkMethod)method andBaseApi:(NSString *)baseApi completeHandle:(void (^)(id, NSError *))complete{
    if (!aPath || aPath.length <= 0) return nil;
    
    
    NSMutableDictionary *mutableDic = @{}.mutableCopy;
    NSDate *date = [NSDate date];
    NSString *time = [NSString stringWithFormat:@"%ld-%ld-%ld %ld:%ld:%ld",date.year,date.month,date.day,date.hour,date.minute,date.second];
    [mutableDic addEntriesFromDictionary:params];
    [mutableDic setObject:time forKey:@"time"];
    
    MYLog(@"= = = = LCEncryptKey %@",LCENCRYPTKEY);//后台加密key
    MYLog(@"= = = = api %@",aPath);
    [mutableDic setObject:LCENCRYPTKEY ? LCENCRYPTKEY : @"YangtechApiKey_3feFE4" forKey:@"key"];
    [mutableDic setObject:[[NSString stringWithFormat:@"%@%@",time,LCENCRYPTKEY ? LCENCRYPTKEY : @"YangtechApiKey_3feFE4"] md5String] forKey:@"signature"];
//   MYLog(@"参数 = = = = =  = %@",mutableDic);
    switch (method) {
        case Get:
            return [self LC_GET:aPath parameters:mutableDic andBaseApi:baseApi completeHandle:complete];
            break;
        case Post:
            return [self LC_POST:aPath parameters:mutableDic andBaseApi:baseApi completeHandle:^(id responseObj, NSError *error) {
                complete(responseObj,error);
            }];
            break;
            
        default:
            break;
    }
    return nil;
}

-(NSURLSessionDataTask *)LC_GET:(NSString *)path parameters:(id)parameters andBaseApi:(NSString *)baseApi completeHandle:(void(^)(id , NSError *))complete{

    return [self requestPath:path parameters:parameters method:@"GET" andBaseApi:baseApi completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj ,error);
    }];
}

-(NSURLSessionDataTask *)LC_POST:(NSString *)path parameters:(id)parameters andBaseApi:(NSString *)baseApi completeHandle:(void(^)(id , NSError *))complete{
    
    return[self requestPath:path parameters:parameters method:@"POST" andBaseApi:baseApi completeHandle:^(id responseObj, NSError *error) {
        //这里可以对responseObj 做整体的处理 拿到处理好的 responseObj 向上回调
        NSDictionary *jsonDic = responseObj;
        NSNumber *status = jsonDic[@"status"];
        NSString *mas = jsonDic[@"msg"];
        //对错误统一的 提示
        if ([status isEqual: @0] & ![mas isEqualToString:@"自动登录失败"]) {
            [NSObject showWarning:jsonDic[@"msg"]];
        }
        if (error != nil) {
            [NSObject showWarning:@"网络情求错误"];
        }
        complete(responseObj ,error);
    }];
}

-(NSURLSessionDataTask*)requestPath:(NSString *)path parameters:(id)parameters method:(NSString *)method andBaseApi:(NSString *)baseApi completeHandle:(void(^)(id , NSError *))complete{
   //
    NSError *serializationError = nil;
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@",AppNetAPIBaseURLString,baseApi,path];
    MYLog(@"%@",urlStr);
    MYLog(@"%@",urlStr);
    MYLog(@"%@",urlStr);
    NSURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:urlStr parameters:parameters error:&serializationError];
//    MYLog(@"==============原始API = %@\n==============原始参数 = %@\n",path,parameters);
//    MYLog(@"==============拼接好的API = %@\n",[[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString]);
#ifdef DEBUG
    if (serializationError) {
        MYLog(@"======Request serializationError======\n%@\n",serializationError);
    }
#endif
    
    NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        
        //转换NSURLResponse成为HTTPResponse
        
        
        if ([NSJSONSerialization isValidJSONObject:(NSDictionary *)responseObject]) {
            NSError *error1;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:(NSDictionary *)responseObject options:NSJSONWritingPrettyPrinted error:&error1];
            
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            MYLog(@"%@",[KDFileManager getDocumentPath]);
            MYLog(@"参数 = = %@ = = %@ = = %@",path,parameters,json);
            
//            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
//            NSDictionary *fields = HTTPResponse.allHeaderFields;
//            NSLog(@"fields = %@",fields);
//            NSLog(@"fields = %@",[fields description]);
//            NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:[NSURL URLWithString:urlStr]];
//            NSLog(@"cookiess = %@",cookies);
//            
//            for (NSHTTPCookie *cookie in cookies) {
//                MYLog(@"========");
//                NSLog(@"++++++cookie,name:= %@,valuie = %@",cookie.name,cookie.value);
//            }
//            
//            
//            NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//            for (NSHTTPCookie *cookie in [cookieJar cookies]) {
//                NSLog(@"cookie == == = %@", cookie);
//            }
            

        }
        MYLog(@"错误信息 ============= %@",error);
        MYLog(@"====++++++%@",[NSThread currentThread]);
        complete(responseObject , error);
    }];
    [task resume]; //开始请求
    return task;
}

-(NSURLSessionDataTask *)checkAppUpdateWithPath:(NSString *)aPath completeHandle:(void (^)(id, NSError *))complete{
    
    NSError *serializationError = nil;
    NSURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:aPath relativeToURL:nil] absoluteString] parameters:nil error:&serializationError];
#ifdef DEBUG
    if (serializationError) {
        MYLog(@"======Request serializationError======\n%@\n",serializationError);
    }
#endif
    
    NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
//        if ([NSJSONSerialization isValidJSONObject:(NSDictionary *)responseObject]) {
//            NSError *error1;
//            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:(NSDictionary *)responseObject options:NSJSONWritingPrettyPrinted error:&error1];
//            
//            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//            MYLog(@"原始数据 ============= %@",json);
//        }
//        MYLog(@"错误信息 ============= %@",error);
//        MYLog(@"====++++++%@",[NSThread currentThread]);
        complete(responseObject , error);
    }];
    [task resume]; //开始请求
    return task;
}

///图片上传
-(NSURLSessionDataTask *)uploadImageApi:(NSString *)aPath
                          withParams:(NSDictionary *)params
                            andImage:(UIImage *)image
                         andfilename:(NSString *)filename
                             andName:(NSString *)name
                       andMethodType:(NetworkMethod)method
                         andMimeType:(NSString *)mimeType
                      completeHandle:(void (^)(id, NSError *))complete{
    if (!aPath || aPath.length == 0) {
        return nil;
    }
    
    NSMutableDictionary *mutableDic = @{}.mutableCopy;
//    NSDate *date = [NSDate date];
//    NSString *time = [NSString stringWithFormat:@"%ld-%ld-%ld %ld:%ld:%ld",date.year,date.month,date.day,date.hour,date.minute,date.second];
//    [mutableDic addEntriesFromDictionary:params];
//    [mutableDic setObject:time forKey:@"time"];
//    [mutableDic setObject:[KDFileManager readUserDataForKey:LCCKYE] ? [KDFileManager readUserDataForKey:LCCKYE] : @"YangtechApiKey_3feFE4" forKey:@"key"];
//    [mutableDic setObject:[[NSString stringWithFormat:@"%@%@",time,[KDFileManager readUserDataForKey:LCCKYE] ? [KDFileManager readUserDataForKey:LCCKYE] : @"YangtechApiKey_3feFE4"] md5String] forKey:@"signature"];
//
//    MYLog(@"mutableDic===== ====== = %@",mutableDic);
    
    NSDate *date = [NSDate date];
    NSString *time = [NSString stringWithFormat:@"%ld-%ld-%ld %ld:%ld:%ld",date.year,date.month,date.day,date.hour,date.minute,date.second];
    [mutableDic addEntriesFromDictionary:params];
    [mutableDic setObject:time forKey:@"time"];
    [mutableDic setObject:LCENCRYPTKEY ? LCENCRYPTKEY : @"YangtechApiKey_3feFE4" forKey:@"key"];
    [mutableDic setObject:[[NSString stringWithFormat:@"%@%@",time,LCENCRYPTKEY ? LCENCRYPTKEY : @"YangtechApiKey_3feFE4"] md5String] forKey:@"signature"];
    if (mimeType == nil || ![mimeType isKindOfClass:[NSString class]] || mimeType.length == 0) {
        mimeType = @"image/jpeg";
    }
    
    void (^constructingBodyBlock)(id <AFMultipartFormData> formData) = ^(id <AFMultipartFormData> formData) {
        NSData *imageData = nil;
        NSString *imageFileName = nil;
        imageData = [self imageData:image];
        imageFileName = filename;
        
        if (imageFileName == nil || ![imageFileName isKindOfClass:[NSString class]] || imageFileName.length == 0) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            imageFileName = [NSString stringWithFormat:@"%@.jpg", str];
        }
        [formData appendPartWithFileData:imageData name:name fileName:imageFileName mimeType:@"image/jpeg"];
    };
    
    NSError *serializationError = nil;
    NSString *string = [NSString stringWithFormat:@"%@%@%@",AppNetAPIBaseURLString,@"api/",aPath];
    NSMutableURLRequest *request = [self.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:string parameters:mutableDic constructingBodyWithBlock:constructingBodyBlock error:&serializationError];
#ifdef DEBUG
    if (serializationError) {
        MYLog(@"======Request serializationError======\n%@\n",serializationError);
    }
#endif
    NSURLSessionDataTask *task = [self uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            MYLog(@"\n======uploadImage responseObject========\njson:%@", [(NSDictionary *)responseObject jsonPrettyStringEncoded]);// 打印格式化后的JSON
        }else{
            MYLog(@"error========%@",error);
        }
        complete(responseObject,error);
    }];
    [task resume];
    return task;
}

- (NSData *)imageData:(UIImage *)myimage
{
    NSData *data=UIImageJPEGRepresentation(myimage, 1.0);
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(myimage, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(myimage, 0.5);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(myimage, 0.9);
        }
    }
    return data;
}
@end
