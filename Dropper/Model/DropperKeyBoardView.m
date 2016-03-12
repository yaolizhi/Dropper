//
//  DropperKeyBoardView.m
//  Dropper
//
//  Created by ZhongMeng on 16/3/10.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperKeyBoardView.h"

@interface DropperKeyBoardView () <UITextFieldDelegate>

@property (nonatomic,strong) DropperKeyBoardView *keyborde;

@end


@implementation DropperKeyBoardView




-(instancetype)initWithFrame:(CGRect)frame withinputView:(UIView*)inputView withinputAccessoryView:(KeyBoardHelper*)inputAccessoryView
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.dismissButton];
        [self setSelfObject:inputView];
        [self setSelfButtonObject:inputAccessoryView];
        [inputAccessoryView.textField setInputAccessoryView:self];
        [self addSubview:self.textFild];
        [self addSubview:self.recordButton];
        [self addSubview:self.emojiButton];
        [self addSubview:self.addButton];
        
        [self setBackgroundColor:RGB(244.0, 244.0, 246.0)];
        [self.layer setBorderWidth:0.3];
        [self.layer setBorderColor:[LineViewColor CGColor]];
    }
    return self;
}


#pragma mark  Getter/Setter Method
-(DropperButton *)recordButton
{
    if (_recordButton == nil)
    {
        _recordButton  = [[DropperButton alloc]initWithFrame:CGRectMake(5, kScreen_Height-40, 30.0, 30.0)];
        [_recordButton setImage:[UIImage imageNamed:@"语音.png"] forState:UIControlStateNormal];
        [_recordButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_recordButton setTag:0];
        [_recordButton.layer setBorderWidth:0.5];
        [_recordButton.layer setCornerRadius:30/2];
        [_recordButton.layer setBorderColor:[LineViewColor CGColor]];
        [_recordButton.layer setMasksToBounds:YES];
    }
    return _recordButton;
}


-(DropperButton *)recordTipButton
{
    if (_recordTipButton == nil)
    {
        _recordTipButton  = [[DropperButton alloc]initWithFrame:CGRectMake(45, kScreen_Height-42.5, kScreen_Width - 130, 35.0)];
        [_recordTipButton setTitle:@"按住 说话" forState:UIControlStateNormal];
        [_recordTipButton setTitleColor:LineViewColor forState:UIControlStateNormal];
        [_recordTipButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_recordTipButton setTag:0];
        [_recordTipButton.layer setBorderWidth:0.3];
        [_recordTipButton.layer setCornerRadius:4.0];
        [_recordTipButton.layer setMasksToBounds:YES];
        [_recordTipButton.layer setBorderColor:[LineViewColor CGColor]];
        [_recordTipButton setBackgroundColor:[UIColor whiteColor]];
    }
    return _recordTipButton;
}


-(UITextField*)textFild
{
    if (_textFild == nil)
    {
        _textFild = [[UITextField alloc]initWithFrame:CGRectMake(45, kScreen_Height-42.5, kScreen_Width - 130, 35.0)];
        [_textFild setDelegate:self];
        [_textFild.layer setBorderWidth:0.3];
        [_textFild.layer setCornerRadius:4.0];
        [_textFild.layer setMasksToBounds:YES];
        [_textFild.layer setBorderColor:[LineViewColor CGColor]];
        [_textFild setTintColor:MainColor];
        [_textFild setBackgroundColor:[UIColor whiteColor]];
    }
    return _textFild;
}


-(DropperButton *)emojiButton
{
    if (_emojiButton == nil)
    {
        _emojiButton  = [[DropperButton alloc]initWithFrame:CGRectMake(kScreen_Width-75, kScreen_Height-40, 30.0, 30.0)];
//        [_emojiButton setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
        [_emojiButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_emojiButton setTag:2];
        [_emojiButton.layer setBorderWidth:0.5];
        [_emojiButton.layer setCornerRadius:30/2];
        [_emojiButton.layer setBorderColor:[LineViewColor CGColor]];
        [_emojiButton.layer setMasksToBounds:YES];
    }
    return _emojiButton;
}



-(DropperButton *)addButton
{
    if (_addButton == nil)
    {
        _addButton  = [[DropperButton alloc]initWithFrame:CGRectMake(kScreen_Width-35, kScreen_Height-40, 30.0, 30.0)];
        [_addButton setImage:[UIImage imageNamed:@"添加.png"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [_addButton.layer setBorderWidth:0.5];
        [_addButton.layer setCornerRadius:30/2];
        [_addButton.layer setBorderColor:[LineViewColor CGColor]];
        [_addButton.layer setMasksToBounds:YES];
        [_addButton setTag:7];
        [self addSubview:self.addButton];
    }
    return _addButton;
}



-(DropperButton *)dismissButton
{
    if (_dismissButton == nil)
    {
        _dismissButton  = [[DropperButton alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        [_dismissButton addTarget:self action:@selector(dismissAction:) forControlEvents:UIControlEventTouchUpInside];
        [_dismissButton setBackgroundColor:[UIColor purpleColor]];
    }
    return _dismissButton;
}










#pragma mark - 添加方法
-(void)action:(DropperButton*)sender
{
    switch (sender.tag)
    {
        case 0:
        {
            [sender setTag:1];
             [self.recordButton setImage:[UIImage imageNamed:@"键盘.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
        {
            [sender setTag:0];
             [self.recordButton setImage:[UIImage imageNamed:@"语音.png"] forState:UIControlStateNormal];
        }
            break;
        case 2:
        {
            [sender setTag:3];
            [self.textFild resignFirstResponder];
            [self.textFild setInputView:self.selfObject];
            [self.textFild becomeFirstResponder];
            [self.emojiButton setImage:[UIImage imageNamed:@"键盘.png"] forState:UIControlStateNormal];
            
        }
            break;
        case 3:
        {
            [self.emojiButton setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
            [sender setTag:2];
            [self.textFild resignFirstResponder];
            [self.textFild setInputView:nil];
            [self.textFild becomeFirstResponder];
            
        }
            break;
        case 7:
        {
            [sender setTag:8];
            [self.textFild resignFirstResponder];
            [self.textFild setInputView:self.selfObject];
            [self.textFild becomeFirstResponder];
        }
            break;
        case 8:
        {
            [sender setTag:7];
            [self.textFild resignFirstResponder];
            [self.textFild setInputView:nil];
            [self.textFild becomeFirstResponder];
        }
            break;
    }
}


-(void)dismissAction:(DropperButton*)sender
{
    NSLog(@"消失");
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textFild resignFirstResponder];
    [self.selfButtonObject.textField resignFirstResponder];
    NSLog(@"%@",self.textFild.text);
    [textField setText:nil];
    return YES;
}

@end

