//
//  DropperKeyBoardView.h
//  Dropper
//
//  Created by ZhongMeng on 16/3/10.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropperTextField.h"
#import "DropperButton.h"
#import "KeyBoardHelper.h"

@interface DropperKeyBoardView : UIView


@property (nonatomic,strong) UIView *selfObject;

@property (nonatomic,assign) KeyBoardHelper *selfButtonObject;

@property (nonatomic,strong) UITextField *textFild;



/**
 语音按钮
 */
@property (nonatomic,strong) DropperButton *dismissButton;
/**
语音按钮
 */
@property (nonatomic,strong) DropperButton *recordButton;


/**
 按住说话按钮
 */
@property (nonatomic,strong) DropperButton *recordTipButton;



/**
 表情按钮
 */
@property (nonatomic,strong) DropperButton *emojiButton;




/**
 更多功能按钮
 */
@property (nonatomic,strong) DropperButton *addButton;




-(instancetype)initWithFrame:(CGRect)frame withinputView:(UIView*)inputView withinputAccessoryView:(KeyBoardHelper*)inputAccessoryView;




@end
