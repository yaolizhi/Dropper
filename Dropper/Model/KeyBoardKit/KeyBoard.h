//
//  KeyBoard.h
//  Dropper
//
//  Created by ZhongMeng on 16/3/11.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>




@interface KeyBoardToolBar : UIView



@end






#pragma mark - KeyBoard 类
@interface KeyBoard : NSObject




@property (nonatomic,strong) KeyBoardToolBar *keyBoardToolBarView;




+(KeyBoard*)sharedHelp;


/**
 添加通知
 */
-(void)addObserverNotificationCenter;


/**
 移除通知
 */
- (void)removeObserverNotificationCenter;


-(void)addSuperView:(UIView*)superView;


@end









