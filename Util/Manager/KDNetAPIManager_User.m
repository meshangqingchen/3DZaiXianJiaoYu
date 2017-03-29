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
#import "NSObject+Common.h"
@implementation KDNetAPIManager_User
SYNTHESIZE_SINGLETON_FOR_CLASS(KDNetAPIManager_User)

#pragma mark - Base api list
static NSString *const BaseApi_api = @"api/";
static NSString *const BaseApi_plan = @"plan/";
static NSString *const BaseApi_message = @"message/";
static NSString *const BaseApi_problem = @"problem/";
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
/// loginPhone
static NSString *const Api_loginPhone = @"loginPhone";
///个人信息
static NSString *const Api_own = @"own";
///收藏
static NSString *const Api_addFav = @"addFav"; //delFav
///删除收藏
static NSString *const Api_delFav = @"delFav";
///免费加入课程 addUserPlan
static NSString *const Api_addUserPlan = @"addUserPlan";
///评论 课程
static NSString *const Api_addAssess = @"addAssess";
///教师列表
static NSString *const Api_teacherList = @"teacherList";//canQuestionTeacherList//teacherList
///教师列表
static NSString *const Api_canQuestionTeacherList = @"canQuestionTeacherList";//canQuestionTeacherList//teacherList/ 在线咨
///历史聊天problemTeacherList
static NSString *const Api_problemTeacherList = @"problemTeacherList";
///教师详情
static NSString *const Api_getDetailByTeacherId = @"getDetailByTeacherId";
///创建订单
static NSString *const Api_addOrder = @"addOrder";
///创建资讯订单
static NSString *const Api_createProblemOrder = @"createProblemOrder";
///通过分类找课程
static NSString *const Api_getPlanListByTypeId = @"getPlanListByTypeId";
///编辑个人信息
static NSString *const Api_editOwn = @"editOwn";
///通过验证码修改密码
static NSString *const Api_loginEdit = @"loginEdit";
///收藏的列表
static NSString *const Api_favList = @"favList";
///加入课程的列表
static NSString *const Api_userPlanList = @"userPlanList";
///根据关键字搜索
static NSString *const Api_search = @"search";

/////视频接口
//static NSString *const Api_video = @"video";
/////更多好课
//static NSString *const Api_getVideos = @"getVideos";





/////收藏列表 根据typ不同 收藏的东西不同
//static NSString *const Api_favList = @"favList";

///推出登录
static NSString *const Api_login_out = @"login_out";
///上传头像
static NSString *const Api_upload = @"upload";
///意见反馈
static NSString *const Api_createFeedBack = @"createFeedBack";


///忘记密码修改密码
static NSString *const Api_forgetPassword = @"forgetPassword";
///报名
static NSString *const Api_createEducationOrder = @"createEducationOrder";
///课程分类
static NSString *const Api_planTypeList = @"planTypeList";
///收费课程
static NSString *const Api_pay = @"pay";
///支付成功通知后台 资讯
static NSString *const Api_problemOrderPay = @"problemOrderPay";
//getMessage 轮询
static NSString *const Api_getMessage = @"getMessage";
//problemView 对话列表
static NSString *const Api_problemView = @"problemView";
///addProblem 发送消息
static NSString *const Api_addProblem = @"addProblem";
///启动界面
static NSString *const Api_getStartPage = @"getStartPage";
///我的券
static NSString *const Api_myCoupon = @"myCoupon";
///使用卡券
static NSString *const Api_useCoupon = @"useCoupon";
///我的优惠券.
static NSString *const Api_memberCard = @"memberCard";
///购买会员生成会员订单
static NSString *const Api_createMemberOrder = @"createMemberOrder";
///购买好会员告诉后台 paymentMemberOrder
static NSString *const Api_paymentMemberOrder = @"paymentMemberOrder";
/// 判断正在上线
static NSString *const Api_isOnline = @"isOnline";
///getEducationList
static NSString *const Api_getEducationList = @"getEducationList";

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
static NSString *const PARAM_oldPassword      = @"oldPassword";
static NSString *const PARAM_phone            = @"phone";
static NSString *const PARAM_operation        = @"operation";
static NSString *const PARAM_objId            = @"objId";
static NSString *const PARAM_type             = @"type";  //收藏课程 还是 收藏视频 还是收藏 新闻
static NSString *const PARAM_grade            = @"grade";
static NSString *const PARAM_description      = @"description";
static NSString *const PARAM_price            = @"price";
static NSString *const PARAM_typeId           = @"typeId"; //课程分类type
static NSString *const PARAM_search           = @"search"; //课程分类type

static NSString *const PARAM_birthday         = @"birthday";
static NSString *const PARAM_sex              = @"sex";
static NSString *const PARAM_des              = @"des";    //修改简介
static NSString *const PARAM_msg              = @"msg";
static NSString *const PARAM_teacherId        = @"teacherId";
static NSString *const PARAM_toId             = @"toId";

//static NSString *const PARAM_adNewsId         = @"adNewsId";
//static NSString *const PARAM_videoId          = @"videoId";
//static NSString *const PARAM_curpage          = @"curpage";
//static NSString *const PARAM_page             = @"page";


//static NSString *const PARAM_img              = @"img";
static NSString *const PARAM_name             = @"name";

//static NSString *const PARAM_school           = @"school";
static NSString *const PARAM_major            = @"major";//专业
static NSString *const PARAM_education        = @"education";//学历

static NSString *const PARAM_contact          = @"contact";
static NSString *const PARAM_email            = @"email";
static NSString *const PARAM_discription      = @"discription";
static NSString *const PARAM_orderSn          = @"orderSn";
static NSString *const PARAM_couponId         = @"couponId"; //使用优惠券
static NSString *const PARAM_memberCardId     = @"memberCardId";//会员卡ID
static NSString *const PARAM_educationId      = @"educationId";//报名的ID

///发送短信获得验证码
-(NSURLSessionDataTask *)getPhoneCordeWith:(NSString *)phoneNum andOperation:(NSString *)operation completeHandle:(void (^)(id, NSError *))complete{

    NSDictionary *params = @{PARAM_phone:phoneNum,PARAM_operation:operation};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_phone encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        
        complete(responseObj,error);
    }];
}
//不用电话号码发送 验证码 loginPhone
-(NSURLSessionDataTask *)getPhoneCordeWithCompleteHandle:(void (^)(id, NSError *))complete{
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_loginPhone encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
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
///生成课程订单
-(NSURLSessionDataTask *)creatOrderWith:(NSString *)courseID andPrice:(NSString *)price completeHandle:(void (^)(id, NSError *))complete{
    
    NSDictionary *params = @{PARAM_planId:courseID,PARAM_price:price};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addOrder encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
///生成资讯订单
-(NSURLSessionDataTask *)creatOrderWithZiXunTeacherID:(NSString *)teacherID andPrice:(NSString *)price completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_teacherId:teacherID,PARAM_price:price};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_createProblemOrder encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//老师列表
-(NSURLSessionDataTask *)teacherListWith:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
    [self showProgress];
    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@14};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_canQuestionTeacherList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}

//Api_problemTeacherList历史记录
-(NSURLSessionDataTask *)historyTalkListWith:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@14};
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_problemTeacherList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}

//
//老师详情
-(NSURLSessionDataTask *)teacherDetailWith:(NSString *)teacherID completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_teacherId:teacherID};
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getDetailByTeacherId encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}


////首页广告位详情
//-(NSURLSessionDataTask *)adNewsDetailWithNewsID:(NSString *)adNewsID completeHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_adNewsId:adNewsID};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_adBigImgList encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}
//


////根据课程的分类找课程的list
-(NSURLSessionDataTask *)courseListWithtypeId:(NSString *)typeId andCurpage:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_typeId:typeId,PARAM_curpage:@(curpage),PARAM_page:@14};
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getPlanListByTypeId encodeParams:params withMethodType:Post andBaseApi:BaseApi_plan completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}

///更多推荐课程
-(NSURLSessionDataTask *)moreCourseListAndCurpage:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@14};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getPlanListByTypeId encodeParams:params withMethodType:Post andBaseApi:BaseApi_plan completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//根据关键字搜索
-(NSURLSessionDataTask *)courseKeyWord:(NSString *)keyWord AndCurpage:(NSUInteger)curpage completeHandle:(void (^)(id, NSError *))complete{
    
    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@14,PARAM_search:keyWord};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_search encodeParams:params withMethodType:Post andBaseApi:BaseApi_plan completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];

}

///修改昵称
-(NSURLSessionDataTask *)changeNickName:(NSString *)nickName CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_nickName:nickName};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

///修改简介
-(NSURLSessionDataTask *)changeJianJie:(NSString *)jianjie CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_des:jianjie};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

///使用旧密码
-(NSURLSessionDataTask *)changePasswordWithOldPassword:(NSString *)oldPassword andNewsPassword:(NSString *)nnewPassword andAgainNewsPassword:(NSString *)againnewPassword CompleteHandle:(void(^)(id ,NSError *))complete{
    NSDictionary *params = @{PARAM_oldPassword:oldPassword,PARAM_password:nnewPassword,PARAM_rePassword:againnewPassword};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
///使用验证码
-(NSURLSessionDataTask *)changePasswordWithCode:(NSString *)code andNewsPassword:(NSString *)nnewPassword andAgainNewsPassword:(NSString *)againnewPassword CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_code:code,PARAM_password:nnewPassword,PARAM_rePassword:againnewPassword};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_loginEdit encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];

}

///修改生日
-(NSURLSessionDataTask *)changeBirthday:(NSString *)birthday CompleteHandle:(void (^)(id, NSError *))complete{
    
    NSDictionary *params = @{PARAM_birthday:birthday};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];

}
//修改性别
-(NSURLSessionDataTask *)changeSex:(NSString *)sex CompleteHandle:(void (^)(id, NSError *))complete{
   
    NSDictionary *params = @{PARAM_sex:sex};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];

}

////改变电话号码
//+(NSURLSessionDataTask *)changePhoneNum:(NSString *)phoneNum andCode:(NSString *)code CompleteHandle:(void (^)(id, NSError *))complete{
//    NSDictionary *params = @{PARAM_userName : phoneNum,PARAM_code:code};
//    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_editOwn encodeParams:params withMethodType:Post completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}



///意见反馈
-(NSURLSessionDataTask *)suggestionFeedbackMsg:(NSString *)msg amdContact:(NSString *)contact CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_msg:msg,PARAM_contact:contact};
   return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_createFeedBack encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
   }];
}
///报名
-(NSURLSessionDataTask *)baomingWithName:(NSString *)name
                                  andSex:(NSNumber *)sex
                             andBirthday:(NSString *)birthday
                         andProfessional:(NSString *)professional
                                andXueLi:(NSString *)xueLi
                             andPhoneNum:(NSString *)phoneNum
                                andEmail:(NSString *)email
                                ndBeiZhu:(NSString *)beiZhu
                                   andID:(NSString *)ID
                          CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{
                             PARAM_name:name,
                             PARAM_sex:sex,
                             PARAM_birthday:birthday,
                             PARAM_major:professional,
                             PARAM_education:xueLi,
                             PARAM_phone:phoneNum,
                             PARAM_email:email,
                             PARAM_discription:beiZhu,
                             PARAM_educationId:ID};
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_createEducationOrder encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];

}

///上穿头像
-(NSURLSessionDataTask *)uploadHeadImage:(UIImage *)image andName:(NSString *)name CompleteHandle:(void (^)(id, NSError *))complete{
    return [[KDNetAPIManager sharedJsonClient] uploadImageApi:Api_upload withParams:nil andImage:image andfilename:nil andName:name andMethodType:Post andMimeType:nil completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//收藏课程列表
-(NSURLSessionDataTask *)collectListWithType:(NSNumber *)collectType andCurpag:(NSUInteger)curpage CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_type:@(1),PARAM_curpage:@(curpage),PARAM_page:@14};
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_favList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}

//参加课程列表
-(NSURLSessionDataTask *)joinCourseListWithCurpag:(NSUInteger)curpage CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_curpage:@(curpage),PARAM_page:@14};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_userPlanList encodeParams:params withMethodType:Post andBaseApi:BaseApi_plan completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}


//退出接口
-(NSURLSessionDataTask *)logOutWithCompleteHandle:(void (^)(id, NSError *))complete{
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_login_out  encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
////检查更新
//+(NSURLSessionDataTask *)checkUpdateWith:(NSString *)strUrl CompleteHandle:(void (^)(id, NSError *))complete{
//    return [[KDNetAPIManager sharedJsonClient] checkAppUpdateWithPath:strUrl completeHandle:^(id responseObj, NSError *error) {
//        complete(responseObj,error);
//    }];
//}

//首页
-(NSURLSessionDataTask *)homeJsonCompleteHandle:(void (^)(id, NSError *))complete{
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_homePage encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
        [self hideProgress];
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
    NSDictionary *params = @{PARAM_planId:planId,PARAM_page:@(14),PARAM_curpage:@(curpage)};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_assessList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//收藏课程
-(NSURLSessionDataTask *)addCollectWithOBJ:(NSString *)OBJID andType:(NSInteger)type CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_type:@(type),PARAM_objId:OBJID};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addFav encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//删除收藏
-(NSURLSessionDataTask *)removeCollectWithOBJ:(NSString *)OBJID andType:(NSInteger)type CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_type:@(type),PARAM_objId:OBJID};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_delFav encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
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
///评价
-(NSURLSessionDataTask *)evaluateCourse:(NSString *)coursrID andGrade:(int)grade andDes:(NSString *)des CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_planId:coursrID,PARAM_grade:@(grade),PARAM_description:des};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addAssess encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//课程分类
-(NSURLSessionDataTask *)planTypeListCompleteHandle:(void (^)(id, NSError *))complete{
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_planTypeList encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
        [self hideProgress];
    }];
}

//第三部订单确认给后台 课程
-(NSURLSessionDataTask *)paySucceedWithCourseOrder_sn:(NSString *)order_sn completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_orderSn:order_sn};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_pay encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//第三部订单确认 资讯
-(NSURLSessionDataTask *)paySucceedWithZiXunOrder_sn:(NSString *)order_sn completeHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_orderSn:order_sn};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_problemOrderPay encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}

//轮询接口
-(NSURLSessionDataTask *)pollingWithTeacherID:(NSString *)teacherID CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_toId:teacherID};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getMessage encodeParams:params withMethodType:Post andBaseApi:BaseApi_message completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//历史对话
-(NSURLSessionDataTask *)historyTalkWithTeacherID:(NSString *)teacherID CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_teacherId:teacherID};
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_problemView encodeParams:params withMethodType:Post andBaseApi:BaseApi_problem completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}
//发送消息
-(NSURLSessionDataTask *)sendMessageWithTeacherID:(NSString *)teacherID andMessage:(NSString*)message CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_toId:teacherID,PARAM_description:message};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_addProblem encodeParams:params withMethodType:Post andBaseApi:BaseApi_problem completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//启动图
-(NSURLSessionDataTask *)launchScreenImageCompleteHandle:(void (^)(id, NSError *))complete{
    
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getStartPage encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
        
    }];
}
//我的优惠券列表
-(NSURLSessionDataTask *)myCouponCompleteHandle:(void (^)(id, NSError *))complete{
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_myCoupon encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}
//使用优惠券
-(NSURLSessionDataTask *)useCouponWithID:(NSString *)couponID andorderSn:(NSString *)orderSn CompleteHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_couponId:couponID,PARAM_orderSn:orderSn};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_useCoupon encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
        
    }];
}
//会员价格表
-(NSURLSessionDataTask *)memberCardCompleteHandle:(void (^)(id, NSError *))complete{
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_memberCard encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}

//购买会员 生成订单
-(NSURLSessionDataTask *)buyMemberWithMemberCarID:(NSString *)memberID CompleteHandle:(void (^)(id, NSError *))complete{
    [self showProgress];
    NSDictionary *params = @{PARAM_memberCardId:memberID};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_createMemberOrder encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];
}
//高所后台 会员买好了
-(NSURLSessionDataTask *)paySucceedWithMemberOrder_sn:(NSString *)order_sn completeHandle:(void (^)(id, NSError *))complete{

    NSDictionary *params = @{PARAM_orderSn:order_sn};
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_paymentMemberOrder encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//控制在线
-(NSURLSessionDataTask *)isOnlineCardCompleteHandle:(void (^)(id, NSError *))complete{
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_isOnline encodeParams:nil withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        complete(responseObj,error);
    }];
}
//报名课程的list
-(NSURLSessionDataTask *)getBaoMingClassList:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{PARAM_type:@(1)};
    [self showProgress];
    return [[KDNetAPIManager sharedJsonClient] requestJsonDataWithPath:Api_getEducationList encodeParams:params withMethodType:Post andBaseApi:BaseApi_api completeHandle:^(id responseObj, NSError *error) {
        [self hideProgress];
        complete(responseObj,error);
    }];

}
@end
