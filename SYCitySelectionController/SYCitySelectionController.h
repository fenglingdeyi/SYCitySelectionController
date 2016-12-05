//
//  SYCitySelectionController.h
//  SYCitySelectExample
//
//  Created by bcmac3 on 2016/11/22.
//  Copyright © 2016年 ShenYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYCitySelectionController : UIViewController

/// 选择城市后回调
@property (nonatomic, copy) void(^selectCity)(NSString *cityName);

/*
 * 是否开启定位,默认为NO，请自行定位传当前位置进来
 * 当前，也可开启,开启后 currentCityName 设置无效
 * 
 * 如需使用定位，请先在info.plist 配置 添加以下2个配置
 * NSLocationAlwaysUsageDescription
 * NSLocationWhenInUseUsageDescription
 */
@property (nonatomic, assign) BOOL openLocation;

/// 当前位置
@property (nonatomic, copy) NSString *currentCityName;

/// 返回按钮图片
@property (nonatomic, copy) NSString *backImageName;

/// 返回按钮
@property (nonatomic, strong) UIButton *backButton;

/// 热门城市
@property (nonatomic, copy) NSArray *hotCitys;

/// 所有城市, 使用自己的数据，不依赖于我的
@property (nonatomic, copy) NSArray *allCity;

/// 自己的城市Dict
@property (nonatomic, copy) NSDictionary *cityDict;






@end
