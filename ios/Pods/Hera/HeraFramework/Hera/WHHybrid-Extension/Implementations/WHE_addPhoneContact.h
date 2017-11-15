//
//  WHE_addPhoneContact.h
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/22.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WHEBaseApi.h"

@interface WHE_addPhoneContact : WHEBaseApi

/// 头像本地文件路径
@property (nonatomic, copy) NSString *photoFilePath;

/// 昵称
@property (nonatomic, copy) NSString *nickName;

/// 姓氏
@property (nonatomic, copy) NSString *lastName;

/// 中间名
@property (nonatomic, copy) NSString *middleName;

/// 名字
@property (nonatomic, copy) NSString *firstName;

/// 备注
@property (nonatomic, copy) NSString *remark;

/// 手机号
@property (nonatomic, copy) NSString *mobilePhoneNumber;

/// 微信号
@property (nonatomic, copy) NSString *weChatNumber;

/// 联系地址国家
@property (nonatomic, copy) NSString *addressCountry;

/// 联系地址省份
@property (nonatomic, copy) NSString *addressState;

/// 联系地址城市
@property (nonatomic, copy) NSString *addressCity;

/// 联系地址街道
@property (nonatomic, copy) NSString *addressStreet;

/// 联系地址邮政编码
@property (nonatomic, copy) NSString *addressPostalCode;

/// 公司
@property (nonatomic, copy) NSString *organization;

/// 职位
@property (nonatomic, copy) NSString *title;

/// 工作传真
@property (nonatomic, copy) NSString *workFaxNumber;

/// 工作电话
@property (nonatomic, copy) NSString *workPhoneNumber;

/// 电子邮件
@property (nonatomic, copy) NSString *email;

/// 网站
@property (nonatomic, copy) NSString *url;

/// 工作地址国家
@property (nonatomic, copy) NSString *workAddressCountry;

/// 工作地址省份
@property (nonatomic, copy) NSString *workAddressState;

/// 工作地址城市
@property (nonatomic, copy) NSString *workAddressCity;

/// 工作地址街道
@property (nonatomic, copy) NSString *workAddressStreet;

/// 工作地址邮政编码
@property (nonatomic, copy) NSString *workAddressPostalCode;

/// 住宅传真
@property (nonatomic, copy) NSString *homeFaxNumber;

/// 住宅电话
@property (nonatomic, copy) NSString *homePhoneNumber;

/// 住宅地址国家
@property (nonatomic, copy) NSString *homeAddressCountry;

/// 住宅地址省份
@property (nonatomic, copy) NSString *homeAddressState;

/// 住宅地址城市
@property (nonatomic, copy) NSString *homeAddressCity;

/// 住宅地址街道
@property (nonatomic, copy) NSString *homeAddressStreet;

/// 住宅地址邮政编码
@property (nonatomic, copy) NSString *homeAddressPostalCode;

@end
