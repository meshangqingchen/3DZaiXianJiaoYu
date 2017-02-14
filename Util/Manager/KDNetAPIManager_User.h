//
//  KDNetAPIManager_User.h
//  无限教育
//
//  Created by 3D on 16/11/1.
//  Copyright © 2016年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDNetAPIManager_User : NSObject
SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(KDNetAPIManager_User)

///发短信验证码
-(NSURLSessionDataTask *)getPhoneCordeWith:(NSString *)phoneNum andOperation:(NSString *)operation completeHandle:(void(^)(id responseObj,NSError *error))complete;

-(NSURLSessionDataTask *)getPhoneCordeWithCompleteHandle:(void(^)(id responseObj,NSError *error))complete;


///注册
-(NSURLSessionDataTask *)registeredWith:(NSString *)phoneNum andPassword:(NSString *)password andRePassword:(NSString *)rePassword andNickname:(NSString *)nickname andVerification:(NSString *)code completeHandle:(void(^)(id responseObj,NSError *error))complete;

///登录
-(NSURLSessionDataTask *)loginWith:(NSString *)phoneNum andPassword:(NSString *)password completeHandle:(void(^)(id responseObj,NSError *error))complete;

///自动登录
-(NSURLSessionDataTask *)loginWithAuto:(NSString*)loginAuto completeHandle:(void (^)(id responseObj, NSError *error))complete;

///忘记密码设置新密码
-(NSURLSessionDataTask *)forgotPasswordSettingNewPasswordWithPhone:(NSString *)phoneNum andNewPassword:(NSString *)newPassword andRePassword:(NSString *)rePassword andCord:(NSString *)cord CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///老师列表
-(NSURLSessionDataTask *)teacherListWith:(NSUInteger)curpage completeHandle:(void(^)(id responseObj,NSError *error))complete;

///老师详情
-(NSURLSessionDataTask *)teacherDetailWith:(NSString *)teacherID completeHandle:(void(^)(id responseObj,NSError *error))complete;
/////首页广告位图片详情
//-(NSURLSessionDataTask *)adNewsDetailWithNewsID:(NSString *)adNewsID completeHandle:(void(^)(id responseObj,NSError *error))complete;


///根据课程分类的 typeID查找课程List
-(NSURLSessionDataTask *)courseListWithtypeId:(NSString *)typeId andCurpage:(NSUInteger)curpage  completeHandle:(void(^)(id responseObj,NSError *error))complete;
///更多推荐课程
-(NSURLSessionDataTask *)moreCourseListAndCurpage:(NSUInteger)curpage  completeHandle:(void(^)(id responseObj,NSError *error))complete;

///根据关键字找课程 list
-(NSURLSessionDataTask *)courseKeyWord:(NSString *)keyWord AndCurpage:(NSUInteger)curpage  completeHandle:(void(^)(id responseObj,NSError *error))complete;

///修改昵称
-(NSURLSessionDataTask *)changeNickName:(NSString *)nickName CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///修改简介
-(NSURLSessionDataTask *)changeJianJie:(NSString *)jianjie CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///串头像

///使用旧密码
-(NSURLSessionDataTask *)changePasswordWithOldPassword:(NSString *)oldPassword andNewsPassword:(NSString *)nnewPassword andAgainNewsPassword:(NSString *)againnewPassword CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///使用验证码
-(NSURLSessionDataTask *)changePasswordWithCode:(NSString *)code
 andNewsPassword:(NSString *)nnewPassword andAgainNewsPassword:(NSString *)againnewPassword CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///修改生日
-(NSURLSessionDataTask *)changeBirthday:(NSString *)birthday CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///性别 1 男 2女
-(NSURLSessionDataTask *)changeSex:(NSString *)sex CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

/////修改手机号
//+(NSURLSessionDataTask *)changePhoneNum:(NSString *)phoneNum andCode:(NSString *)code CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////意见反馈
-(NSURLSessionDataTask *)suggestionFeedbackMsg:(NSString *)msg amdContact:(NSString *)contact CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///报名
-(NSURLSessionDataTask *)baomingWithZhiYuan:(NSNumber *)zhiYuan
                                    andName:(NSString *)name
                                     andSex:(NSNumber *)sex
                                andBirthday:(NSString *)birthday
                            andBiYeYuanXiao:(NSString *)graduateSchool
                            andProfessional:(NSString *)professional
                                   andXueLi:(NSString *)xueLi
                                andPhoneNum:(NSString *)phoneNum
                                      andQQ:(NSString *)qq
                                  andBeiZhu:(NSString *)beiZhu
                             CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///上传头像
-(NSURLSessionDataTask *)uploadHeadImage:(UIImage *)image andName:(NSString *)name CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///收藏列表
-(NSURLSessionDataTask *)collectListWithType:(NSNumber *)collectType andCurpag:(NSUInteger )curpage CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///加入课程列表
-(NSURLSessionDataTask *)joinCourseListWithCurpag:(NSUInteger )curpage CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

/////推出接口
-(NSURLSessionDataTask *)logOutWithCompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////检查更新
//+(NSURLSessionDataTask *)checkUpdateWith:(NSString *)strUrl CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///home首页
-(NSURLSessionDataTask *)homeJsonCompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///课程详情
-(NSURLSessionDataTask *)courseDetailWithPlanld:(NSString *)planId CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///课程评价列表 assessListWithPlanld
-(NSURLSessionDataTask *)assessListWithPlanld:(NSString *)planId andCurpage:(NSInteger)curpage CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///收藏OBJ 
-(NSURLSessionDataTask *)addCollectWithOBJ:(NSString *)OBJID andType:(NSInteger)type CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///删除收藏
-(NSURLSessionDataTask *)removeCollectWithOBJ:(NSString *)OBJID andType:(NSInteger)type CompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///免费加入课程
-(NSURLSessionDataTask *)addFreeCourse:(NSString *)coursrID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///评价
-(NSURLSessionDataTask *)evaluateCourse:(NSString *)coursrID andGrade:(int)grade andDes:(NSString *)des CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///个人信息
-(NSURLSessionDataTask *)personalInformationCompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///参加收费课程 生成订单
-(NSURLSessionDataTask *)creatOrderWith:(NSString *)courseID andPrice:(NSString *)price completeHandle:(void(^)(id responseObj,NSError *error))complete;
-(NSURLSessionDataTask *)creatOrderWithZiXunTeacherID:(NSString *)teacherID andPrice:(NSString *)price completeHandle:(void(^)(id responseObj,NSError *error))complete;

///课程分类 planTypeList
-(NSURLSessionDataTask *)planTypeListCompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///第三部通知后台
-(NSURLSessionDataTask *)paySucceedWithCourseOrder_sn:(NSString*)order_sn completeHandle:(void(^)(id responseObj,NSError *error))complete;
///第三部 告诉后台老子支付好了 这个资讯
-(NSURLSessionDataTask *)paySucceedWithZiXunOrder_sn:(NSString*)order_sn completeHandle:(void(^)(id responseObj,NSError *error))complete;
///轮询接口
-(NSURLSessionDataTask *)pollingWithTeacherID:(NSString *)teacherID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///历史对话
-(NSURLSessionDataTask *)historyTalkWithTeacherID:(NSString *)teacherID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///发送消息
-(NSURLSessionDataTask *)sendMessageWithTeacherID:(NSString *)teacherID andMessage:(NSString*)message CompleteHandle:(void(^)(id responseObj,NSError *error))complete;


///启动界面 Api_getStartPage
-(NSURLSessionDataTask *)launchScreenImageCompleteHandle:(void(^)(id responseObj,NSError *error))complete;

@end
