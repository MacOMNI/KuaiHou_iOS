//
//  ClassConfig.h
//  KuaiHou_iOS
//
//  Created by user on 2019/3/14.
//  Copyright © 2019 郭子豪. All rights reserved.
//

#ifndef ClassConfig_h
#define ClassConfig_h

#define kScreenSizeHeight                    [[UIScreen mainScreen] bounds].size.height
#define kScreenSizeWidth                     [[UIScreen mainScreen] bounds].size.width

// 是否是iPhoneX系列
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

/**
 *导航栏高度
 */
#define SafeAreaTopHeight (IPHONE_X ? 88 : 64)

/**
 *tabbar高度
 */
#define SafeAreaBottomHeight (IPHONE_X ? (49 + 34) : 49)

#define SafeAreaTopStatue (IPHONE_X ? 44 : 20)
/**
 *电池栏的高度
 */
#define SafeAreaTopStatueMin (IPHONE_X ? 20 : 0)
/**
 *下方多出来的部分安全区域
 */
#define SafeAreaBottom (IPHONE_X ? 34 : 0)

// 将self弱引用
#define kWEAKSELF typeof(self) __weak weakSelf = self;

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

// 普通字体
#define kFont(size) [UIFont systemFontOfSize:size]

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)


/**
*  the saving objects      存储对象
*
*  @param __VALUE__ V
*  @param __KEY__   K
*
*  @return
*/
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
 *  存储Integer
 */
#define UserDefaultSetIntegerForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setInteger:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
 *  get the saved objects       获得存储的对象
 */
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]
/**
 *  获得Integer
 */
#define UserDefaultIntegerForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] integerForKey:__KEY__]

/**
 *  delete objects      删除对象
 */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}
/**
 *  delete objects      删除Integer
 */
#define UserDefaultRemoveIntergerForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeIntegerForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}


#pragma mark - # 循环引用消除
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object)     autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object)     autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object)     try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object)     try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object)   autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object)   autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object)   try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object)   try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif
#define     TLWeakSelf(type)            __weak typeof(type) weak##type = type;
#define     TLStrongSelf(type)          __strong typeof(type) strong##type = type;


#endif /* ClassConfig_h */
