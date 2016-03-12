//
//  KeyBoardAccessoryView.m
//  Dropper
//
//  Created by ZhongMeng on 16/3/11.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "KeyBoardAccessoryView.h"
#import "KeyBoardHelper.h"


@interface KeyBoardAccessoryView () <UITextFieldDelegate>

@property (nonatomic,strong) KeyBoardHelper *keyBoardHelperView;
@property (nonatomic,strong) UIView *inputView;
@end


@implementation KeyBoardAccessoryView

#pragma mark  LifeStyle Method
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.textField];
        [self addSubview:self.recordButton];
        [self addSubview:self.emojiButton];
        [self addSubview:self.addButton];
        
        [self setBackgroundColor:RGB(244.0, 244.0, 246.0)];
        [self.layer setBorderWidth:0.3];
        [self.layer setBorderColor:[LineViewColor CGColor]];
    }
    return self;
}

-(void)setAccessoryView:(KeyBoardHelper*)accessoryView
{
    [self setKeyBoardHelperView:accessoryView];
}


#pragma mark  Getter/Setter Method
-(UIView *)inputView
{
    if (_inputView == nil)
    {
        _inputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 216)];
        [_inputView setBackgroundColor:[UIColor redColor]];
    }
    return _inputView;
}

-(DropperButton *)recordButton
{
    if (_recordButton == nil)
    {
        _recordButton  = [[DropperButton alloc]initWithFrame:CGRectMake(5, 10, 30.0, 30.0)];
        [_recordButton setImage:[UIImage imageNamed:@"语音.png"] forState:UIControlStateNormal];
        [_recordButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_recordButton setTag:0];
        [_recordButton.layer setBorderWidth:0.5];
        [_recordButton.layer setCornerRadius:30/2];
        [_recordButton.layer setBorderColor:[LineViewColor CGColor]];
        [_recordButton.layer setMasksToBounds:YES];
    }
    return _recordButton;
}



-(UITextField*)textField
{
    if (_textField == nil)
    {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(45, 7.5, kScreen_Width - 130, 35.0)];
        [_textField setDelegate:self];
        [_textField.layer setBorderWidth:0.3];
        [_textField.layer setCornerRadius:4.0];
        [_textField.layer setMasksToBounds:YES];
        [_textField.layer setBorderColor:[LineViewColor CGColor]];
        [_textField setTintColor:MainColor];
        [_textField setBackgroundColor:[UIColor whiteColor]];
    }
    return _textField;
}


-(DropperButton *)emojiButton
{
    if (_emojiButton == nil)
    {
        _emojiButton  = [[DropperButton alloc]initWithFrame:CGRectMake(kScreen_Width-75, 10, 30.0, 30.0)];
        [_emojiButton setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
        [_emojiButton addTarget:self action:@selector(emojiButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_emojiButton setTag:0];
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
        _addButton  = [[DropperButton alloc]initWithFrame:CGRectMake(kScreen_Width-35, 10, 30.0, 30.0)];
        [_addButton setImage:[UIImage imageNamed:@"添加.png"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_addButton.layer setBorderWidth:0.5];
        [_addButton.layer setCornerRadius:30/2];
        [_addButton.layer setBorderColor:[LineViewColor CGColor]];
        [_addButton.layer setMasksToBounds:YES];
        [_addButton setTag:0];
        [self addSubview:self.addButton];
    }
    return _addButton;
}


#pragma mark  Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    [self.keyBoardHelperView.textField resignFirstResponder];
    return YES;
}




#pragma mark  Response Method
-(void)recordButtonAction:(DropperButton*)sender
{
    switch (sender.tag)
    {
        case 0:
        {
            [sender setTag:1];
            [self.keyBoardHelperView.recordButton setTag:1];
            [sender setImage:[UIImage imageNamed:@"语音.png"] forState:UIControlStateNormal];
            [self.textField becomeFirstResponder];
            [self.keyBoardHelperView.textField becomeFirstResponder];
        }
            break;
        case 1:
        {
            [sender setTag:0];
            [sender setImage:[UIImage imageNamed:@"键盘.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
            [self.keyBoardHelperView.textField resignFirstResponder];
            
            
        }
            break;
    }
}

-(void)recordTipButtonAction:(DropperButton*)sender
{
    
}

-(void)emojiButtonAction:(DropperButton*)sender
{
    switch (sender.tag)
    {
        case 0:
        {
            [sender setTag:1];
            [sender setImage:[UIImage imageNamed:@"键盘.png"] forState:UIControlStateNormal];
            [self.textField becomeFirstResponder];
            [self.textField setInputView:self.inputView];
            [self.textField becomeFirstResponder];
            
        }
            break;
        case 1:
        {
            [sender setTag:0];
            [sender setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
            [self.textField setInputView:nil];
            [self.textField becomeFirstResponder];
            
        }
            break;
    }
}

-(void)addButtonAction:(DropperButton*)sender
{
    switch (sender.tag)
    {
        case 0:
        {
            [sender setTag:1];
            [self.keyBoardHelperView.addButton setTag:1];
            [sender setImage:[UIImage imageNamed:@"添加.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
            [self.textField setInputView:self.inputView];
            [self.textField becomeFirstResponder];
            
        }
            break;
        case 1:
        {
            [sender setTag:0];
            [self.keyBoardHelperView.addButton setTag:0];
            [sender setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
            [self.textField setInputView:nil];
            [self.textField becomeFirstResponder];
            
        }
            break;
    }
}



#pragma mark  Private Method


@end
