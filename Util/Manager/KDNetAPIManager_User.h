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

///发短信
-(NSURLSessionDataTask *)getPhoneCordeWith:(NSString *)phoneNum andOperation:(NSString *)operation completeHandle:(void(^)(id responseObj,NSError *error))complete;

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



/////老师详情
//-(NSURLSessionDataTask *)teacherDetailWith:(NSString *)teacherID completeHandle:(void(^)(id responseObj,NSError *error))complete;
/////首页广告位图片详情
//-(NSURLSessionDataTask *)adNewsDetailWithNewsID:(NSString *)adNewsID completeHandle:(void(^)(id responseObj,NSError *error))complete;

///根据课程分类的 typeID查找课程List
-(NSURLSessionDataTask *)courseListWithtypeId:(NSString *)typeId andCurpage:(NSUInteger)curpage  completeHandle:(void(^)(id responseObj,NSError *error))complete;
///更多推荐课程
-(NSURLSessionDataTask *)moreCourseListAndCurpage:(NSUInteger)curpage  completeHandle:(void(^)(id responseObj,NSError *error))complete;


/////修改昵称
//-(NSURLSessionDataTask *)changeNickName:(NSString *)nickName CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////串头像
/////修改密码
//-(NSURLSessionDataTask *)changePasswordWithOldPassword:(NSString *)oldPassword andNewsPassword:(NSString *)nnewPassword CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
//;
/////修改手机号
//+(NSURLSessionDataTask *)changePhoneNum:(NSString *)phoneNum andCode:(NSString *)code CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////意见反馈
//-(NSURLSessionDataTask *)suggestionFeedbackMsg:(NSString *)msg amdContact:(NSString *)contact CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////视频详情
//-(NSURLSessionDataTask *)videoDetailVideoID:(NSString *)videoID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////报名
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
//                             CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////上传头像
//-(NSURLSessionDataTask *)uploadHeadImage:(UIImage *)image andName:(NSString *)name CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////收藏列表
//-(NSURLSessionDataTask *)collectListWithType:(NSNumber *)collectType andCurpag:(NSUInteger )curpage CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////收藏视频
//-(NSURLSessionDataTask *)addCollectWithVideoID:(NSString *)videoID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////删除收藏
//-(NSURLSessionDataTask *)removeCollectWithVideoID:(NSString *)videoID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
/////推出接口
//-(NSURLSessionDataTask *)logOutWithCompleteHandle:(void(^)(id responseObj,NSError *error))complete;
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
///免费加入课程
-(NSURLSessionDataTask *)addFreeCourse:(NSString *)coursrID CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///评价
-(NSURLSessionDataTask *)evaluateCourse:(NSString *)coursrID andGrade:(int)grade andDes:(NSString *)des CompleteHandle:(void(^)(id responseObj,NSError *error))complete;
///个人信息
-(NSURLSessionDataTask *)personalInformationCompleteHandle:(void(^)(id responseObj,NSError *error))complete;

///参加收费课程 生成订单
-(NSURLSessionDataTask *)creatOrderWith:(NSString *)courseID andPrice:(NSString *)price completeHandle:(void(^)(id responseObj,NSError *error))complete;

@end
