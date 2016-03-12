//
//  DropperDateComponentsViewController.m
//  Dropper
//
//  Created by ZhongMeng on 16/3/4.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperDateComponentsViewController.h"

@interface DropperDateComponentsViewController ()

@end

@implementation DropperDateComponentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getWeekday];
    [self inis];
    
    
    [self ssssss];
    
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *fromdate = [format dateFromString:@"2016-03-04 12:16"];
    
    

    
    
    [self nextMonthDate:fromdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark 获取某天是星期几
-(void)getWeekday
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps setDay:4];
    
    [comps setMonth:3];
    
    [comps setYear:2016];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *date = [gregorian dateFromComponents:comps];
    
    
    NSDateComponents *weekdayComponents =
    
    [gregorian components:NSCalendarUnitWeekday fromDate:date];
    
    NSInteger weekday = [weekdayComponents weekday];
    
    NSLog(@"%d",(int)weekday);
}



-(void)inis
{
    //一段例子：计算距离某一天还有多少时间
    
    NSDate* toDate   = [[Help sharedHelp] fromTimeString:@"2012-9-29 00:00"];
    
    NSDate*  startDate  = [ [ NSDate alloc] init ];
    
    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierGregorian ];
    
    NSUInteger unitFlags =
    
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:startDate  toDate:toDate  options:0];
    
    NSInteger diffHour = [cps hour];
    NSInteger diffMin    = [cps minute];
    NSInteger diffSec   = [cps second];
    NSInteger diffDay   = [cps day];
    NSInteger diffMon  = [cps month];
    NSInteger diffYear = [cps year];
    
    NSLog(  @" From Now to %@, diff: Years: %d  Months: %d, Days; %d, Hours: %d, Mins:%d, sec:%d",
          
          [toDate description], diffYear, diffMon, diffDay, diffHour, diffMin,diffSec );
}




//下一个月的日期
- (NSDate *)nextMonthDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday |NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
    if ([components month] == 12)
    {
        [components setMonth:1];
        [components setYear:[components year] + 1];
    }
    else
    {
//        [components setMonth:[components month] + 1];
        
    }
    [components setDay:[components day] + 10];
    
    NSLog(@"%d",(int)[components weekday]);
    
    [components weekday];
    NSDate *lastMonth = [calendar dateFromComponents:components];
    
    
    NSDateComponents *weekdayComponents =
    
    [calendar components:NSCalendarUnitWeekday fromDate:lastMonth];
    
    NSInteger weekday = [weekdayComponents weekday];
    
    NSLog(@"%d",(int)weekday);
    
    
    
    return lastMonth;
}


-(void)ssssss
{
    //  先定义一个遵循某个历法的日历对象
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //  通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUnit等）
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:[NSDate date]];
    
    
    
    
    NSLog(@"year(年份): %d", (int)dateComponents.year);
    NSLog(@"quarter(季度):%d", (int)dateComponents.quarter);
    NSLog(@"month(月份):%d", (int)dateComponents.month);
    NSLog(@"day(日期):%d", (int)dateComponents.day);
    NSLog(@"hour(小时):%d", (int)dateComponents.hour);
    NSLog(@"minute(分钟):%d", (int)dateComponents.minute);
    NSLog(@"second(秒):%d", (int)dateComponents.second);
    
    
    
    
}

@end
