//
//  Help.h
//  Dropper
//
//  Created by ZhongMeng on 16/2/24.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Help : NSObject


+(Help*)sharedHelp;



#pragma mark - 时间字符串转换成NSDate
-(NSDate*)fromTimeString:(NSString*)time;

#pragma mark - 获取 Bundle Indentifier
-(NSString*)bundleIdentifier;


@end
