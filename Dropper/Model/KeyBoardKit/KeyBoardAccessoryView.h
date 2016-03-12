//
//  KeyBoardAccessoryView.h
//  Dropper
//
//  Created by ZhongMeng on 16/3/11.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoardAccessoryView : UIView

@property (nonatomic,strong) UITextField *textField;


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



/**
 该视图的高度是固定的值
 */
-(instancetype)initWithFrame:(CGRect)frame;

-(void)setAccessoryView:(UIView*)accessoryView;
@end
