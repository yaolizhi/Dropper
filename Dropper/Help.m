//
//  Help.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/24.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "Help.h"

@implementation Help

static Help *sharedObject = nil; //第一步：静态实例，并初始化。

+(Help*)sharedHelp
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedObject = [[self alloc]init];
    });
    return sharedObject;
}



#pragma mark - 时间字符串转换成NSDate
-(NSDate*)fromTimeString:(NSString*)time
{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate *fromdate = [format dateFromString:time]; //@"2016-02-24 16:22"
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate:fromdate];
    NSDate *fromDate = [fromdate dateByAddingTimeInterval:frominterval];
    return fromDate;
}

-(NSString *)localdDate
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter setDateFormat:@"yyyy-mm-dd HH:mm:ss"];
    // 获取当前日期
    NSDate *localeDate = [NSDate date];

    NSString *localString = [formatter stringFromDate:localeDate];
    
    NSLog(@"%@", localString);
    
    
    
    //或者这样写
//    NSDate *date = [NSDate date];
//    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//    
//    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
//    
//    localString = [formatter stringFromDate:localeDate];
    return localString;
}



//将本地日期字符串转为UTC日期字符串
//本地日期格式:2013-08-03 12:53:51
//可自行指定输入输出格式
-(NSString *)getUTCFormateLocalDate:(NSString *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}

//将UTC日期字符串转为本地时间字符串
//输入的UTC日期格式2013-08-03T04:53:51+0000
-(NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:utcDate];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}


- (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}


#pragma mark - 获取 Bundle Indentifier
-(NSString*)bundleIdentifier
{
    
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    return bundleIdentifier;
}


#pragma mark - 打印搜索框中的子视图
-(void)searchBarSubView
{
//     NSLog(@"%@", [self.searchBar performSelector:@selector(recursiveDescription)]);
}



@end
