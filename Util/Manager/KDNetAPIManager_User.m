//
//  KDNetAPIManager_User.m
//  无限教育
//
//  Created by 3D on 16/11/1.
//  Copyright © 2016年 3D. All rights reserved.
//

#import "KDNetAPIManager_User.h"
#import "KDNetAPIManager.h"
#import "KDFileManager.h"
@implementation KDNetAPIManager_User
SYNTHESIZE_SINGLETON_FOR_CLASS(KDNetAPIManager_User)

#pragma mark - Base api list
static NSString *const BaseApi_api = @"api/";
static NSString *const BaseApi_plan = @"plan/";
//static NSString *const
//static NSString *const
//static NSString *const
//static NSString *const
//static NSString *const
//static NSString *const
//static NSString *const

#pragma mark - api list
///首页
static NSString *const Api_homePage = @"homePage";
///课程详情
static NSString *const Api_planView = @"planView";
///评价列表
static NSString *const Api_assessList = @"assessList";
///自动登录
static NSString *const Api_login_in = @"login_in";
///注册
static NSString *const Api_register = @"register";
///发送短信
static NSString *const Api_phone = @"phone";
///个人信息
static NSString *const Api_own = @"own";
///收藏
static NSString *const Api_addFav = @"addFav";
///免费加入课程 addUserPlan
static NSString *const Api_addUserPlan = @"addUserPlan";
///评论 课程
static NSString *const Api_addAssess = @"addAssess";
///教师列表
static NSString *const Api_teacherList = @"teacherList";
///创建订单
static NSString *const Api_addOrder = @"addOrder";



/////首页
//static NSString *const Api_homePage = @"homePage";
/////主题图片列表
//static NSString *const Api_adBigImgList = @"adBigImgList";
/////教师详情
//static NSString *const Api_getDetailByTeacherId = @"getDetailByTeacherId";
/////视频接口
//static NSString *const Api_video = @"video";
/////更多好课
//static NSString *const Api_getVideos = @"getVideos";


/////编辑个人信息
//static NSString *const Api_editOwn = @"editOwn";

/////删除收藏
//static NSString *const Api_delFav = @"delFav";
/////收藏列表 根据typ不同 收藏的东西不同
//static NSString *const Api_favList = @"favList";
/////推出登录
//static NSString *const Api_login_out = @"login_out";
/////上传头像
//static NSString *const Api_upload = @"upload";
/////意见反馈
//static NSString *const Api_createFeedBack = @"createFeedBack";


///忘记密码修改密码
static NSString *const Api_forgetPassword = @"forgetPassword";
/////报名
//static NSString *const Api_enrol = @"enrol";


#pragma mark - api params key
static NSString *const PARAM_planId             = @"planId";
static NSString *const PARAM_page               = @"page";    //每页条数
static NSString *const PARAM_curpage            = @"curpage";  //第几页页数

static NSString *const PARAM_loginAuto          = @"loginAuto";
static NSString *const PARAM_userName           = @"userName";
static NSString *const PARAM_password           = @"password";

static NSString *const PARAM_rePassword       = @"rePassword";
static NSString *const PARAM_nickName         = @"nickName";
static NSString *const PARAM_code             = @"code";

//static NSString *const PARAM_oldPassword      = @"oldPassword";
//static NSString *const PARAM_loginAuto        = @"loginAuto";


static NSString *const PARAM_phone            = @"phone";
static NSString *const PARAM_operation        = @"operation";
static NSString *const PARAM_objId            = @"objId";
static NSString *const PARAM_type             = @"type";
static NSString *const PARAM_grade            = @"grade";
static NSString *const PARAM_description      = @"description";
static NSString *const PARAM_price            = @"price";

//static NSString *const PARAM_adNewsId         = @"adNewsId";
//static NSString *const PARAM_teacherId        = @"teacherId";
//static NSString *const PARAM_videoId          = @"videoId";
//static NSString *const PARAM_curpage          = @"curpage";
//static NSString *const PARAM_page             = @"page";


//static NSString *const PARAM_img              = @"img";
//static NSString *const PARAM_name             = @"name";
//static NSString *const PARAM_sex              = @"sex"; //?可能是int类型
//static NSString *const PARAM_birthday         = @"birthday";
//static NSString *const PARAM_school           = @"school";
//static NSString *const PARAM_major            = @"major";//专业
//static NSString *const PARAM_education        = @"education";//学历
//static NSString *const PARAM_msg              = @"msg";
//static NSString *const PARAM_contact          = @"contact";
//static NSString *const PARAM_qq               = @"qq";
//static NSString *const PARAM_discription      = @"discription";


///发送短信
-(NSURLSessionDataTask *)getPhoneCordeWith:(NSString *)phoneNum andOperation:(NSString *)operation completeHandle:(void (^)(id, NSError *))complete{

    NSDictionary *params = @{PARAM_phone:phoneNum,PARAM_operation:operation};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_phone encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        
        complete(responseObj,error);
    }];
}

///注册
-(NSURLSessionDataTask *)registeredWith:(NSString *)phoneNum andPassword:(NSString *)password andRePassword:(NSString *)rePassword andNickname:(NSString *)nickname andVerification:(NSString *)code completeHandle:(void (^)(id, NSError *))complete{

    NSDictionary *params = @{PARAM_userName:phoneNum,PARAM_password:password,PARAM_rePassword:rePassword,PARAM_nickName:nickname,PARAM_code:code};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_register encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        
        complete(responseObj,error);
    }];
};


///登录
-(NSURLSessionDataTask *)loginWith:(NSString *)phoneNum andPassword:(NSString *)password completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_userName:phoneNum,PARAM_password:password};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_login_in encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        
        complete(responseObj,error);
    }];
}

///自动登录
-(NSURLSessionDataTask *)loginWithAuto:(NSString *)loginAuto completeHandle:(void (^)(id, NSError *))complete{
    
    NSDictionary *params = @{PARAM_loginAuto: loginAuto};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_login_in encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        
        complete(responseObj,error);
    }];
}

//-(NSURLSessionDataTask *)loginWithAutoWithcompleteHandle:(void (^)(id, NSError *))complete{
//    //[KDFileManager readUserDataForKey:LCCLOIN_AUTO]
//    
//
//    NSDictionary *params = @{PARAM_loginAuto:[KDFileManager readUserDataForKey:LCCLOIN_AUTO] ? [KDFileManager readUserDataForKey:LCCLOIN_AUTO] : @"aaa"};
//    
//    // http://192.168.1.108/3d/api.php/home/api/login_in/loginAuto/5a63ecfa3738140dcfb1d2a5cb14ae3f
//   return  [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_login_in encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
//       
//        complete(responseObj,error);
//    }];
//}

///忘记密码设置新密码
-(NSURLSessionDataTask *)forgotPasswordSettingNewPasswordWithPhone:(NSString *)phoneNum andNewPassword:(NSString *)newPassword andRePassword:(NSString *)rePassword andCord:(NSString *)cord CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_userName:phoneNum,PARAM_password:newPassword,PARAM_rePassword:rePassword,PARAM_code:cord};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_forgetPassword encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        
        complete(responseObj,error);
    }];
}

///个人信息
-(NSURLSessionDataTask *)personalInformationCompleteHandle:(void (^)(id, NSError *))complete{
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_own encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
///生成订单
-(NSURLSessionDataTask *)creatOrderWith:(NSString *)courseID andPrice:(NSString *)price completeHandle:(void (^)(id, NSError *))complete{
    
    NSDictionary *params = @{PARAM_planId:courseID,PARAM_price:price};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addOrder encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}


//老师列表
-(NSURLSessionDataTask *)teacherListWith:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@9};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_teacherList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//
////老师详情
//-(NSURLSessionDataTask *)teacherDetailWith:(NSString *)teacherID completeHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_teacherId:teacherID};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getDetailByTeacherId encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}


////首页广告位详情
//-(NSURLSessionDataTask *)adNewsDetailWithNewsID:(NSString *)adNewsID completeHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_adNewsId:adNewsID};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_adBigImgList encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
//
////更多好课
//-(NSURLSessionDataTask *)courseListWithCurpage:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
//    
//    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@10};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getVideos encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//   }];
//}
//

//
////修改昵称
//-(NSURLSessionDataTask *)changeNickName:(NSString *)nickName CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_nickName:nickName};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
//
////修改密码
//-(NSURLSessionDataTask *)changePasswordWithOldPassword:(NSString *)oldPassword andNewsPassword:(NSString *)nnewPassword CompleteHandle:(void(^)(id ,NSError *))complete;
//{
//    NSDictionary *params = @{PARAM_oldPassword:oldPassword,PARAM_password:nnewPassword};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//
//}
////改变电话号码
//+(NSURLSessionDataTask *)changePhoneNum:(NSString *)phoneNum andCode:(NSString *)code CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_userName : phoneNum,PARAM_code:code};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
//
////意见反馈
//-(NSURLSessionDataTask *)suggestionFeedbackMsg:(NSString *)msg amdContact:(NSString *)contact CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_msg:msg,PARAM_contact:contact};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_createFeedBack encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}

////视频详情
//-(NSURLSessionDataTask *)videoDetailVideoID:(NSString *)videoID CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_videoId:videoID};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_video encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
////报名
//-(NSURLSessionDataTask *)baomingWithZhiYuan:(NSNumber *)zhiYuan
//                                    andName:(NSString *)name
//                                     andSex:(NSNumber *)sex
//                                andBirthday:(NSString *)birthday
//                            andBiYeYuanXiao:(NSString *)graduateSchool
//                            andProfessional:(NSString *)professional
//                                   andXueLi:(NSString *)xueLi
//                                andPhoneNum:(NSString *)phoneNum
//                                      andQQ:(NSString *)qq
//                                  andBeiZhu:(NSString *)beiZhu
//                             CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_type:zhiYuan,
//                             PARAM_name:name,
//                             PARAM_sex:sex,
//                             PARAM_birthday:birthday,
//                             PARAM_school:graduateSchool,
//                             PARAM_major:professional,
//                             PARAM_education:xueLi,
//                             PARAM_phone:phoneNum,
//                             PARAM_qq:qq,
//                             PARAM_discription:beiZhu};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_enrol encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
////上穿头像
//-(NSURLSessionDataTask *)uploadHeadImage:(UIImage *)image andName:(NSString *)name CompleteHandle:(void (^)(id, NSError *))complete{
//    return [[KDNetAPIManager sharedJsonClient] uploadImageApi:Api_upload withParams:nil andImage:image andfilename:nil andName:name andMethodType:Post andMimeType:nil completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
////收藏列表
//-(NSURLSessionDataTask *)collectListWithType:(NSNumber *)collectType andCurpag:(NSUInteger)curpage CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_type:collectType,PARAM_curpage:@(curpage),PARAM_page:@10};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_favList encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}


////删除收藏
//-(NSURLSessionDataTask *)removeCollectWithVideoID:(NSString *)videoID CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_type:@4,PARAM_objId:videoID};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_delFav encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
////退出接口
//-(NSURLSessionDataTask *)logOutWithCompleteHandle:(void (^)(id, NSError *))complete{
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_login_out encodeParams:nil withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
////检查更新
//+(NSURLSessionDataTask *)checkUpdateWith:(NSString *)strUrl CompleteHandle:(void (^)(id, NSError *))complete{
//    return [[KDNetAPIManager sharedJsonClient] checkAppUpdateWithPath:strUrl completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}

//首页
-(NSURLSessionDataTask *)homeJsonCompleteHandle:(void (^)(id, NSError *))complete{
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_homePage encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//课程详情 里面有课程视频列表
-(NSURLSessionDataTask *)courseDetailWithPlanld:(NSString *)planId CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_planId:planId};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_planView encodeParams:params withMethodType:Post andBaseApi:BaseApi_plan completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//课程评价列表
-(NSURLSessionDataTask *)assessListWithPlanld:(NSString *)planId andCurpage:(NSInteger)curpage CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_planId:planId,PARAM_page:@(1),PARAM_curpage:@(curpage)};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_assessList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//收藏视频
-(NSURLSessionDataTask *)addCollectWithOBJ:(NSString *)OBJID andType:(NSInteger)type CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_type:@(type),PARAM_objId:OBJID};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addFav encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//免费加入课程
-(NSURLSessionDataTask *)addFreeCourse:(NSString *)coursrID CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_planId:coursrID};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addUserPlan encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

-(NSURLSessionDataTask *)evaluateCourse:(NSString *)coursrID andGrade:(int)grade andDes:(NSString *)des CompleteHandle:(void (^)(id, NSError *))complete{
    
    NSDictionary *params = @{PARAM_planId:coursrID,PARAM_grade:@(grade),PARAM_description:des};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addAssess encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
@end
