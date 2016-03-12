//
//  KeyBoard.m
//  Dropper
//
//  Created by ZhongMeng on 16/3/11.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "KeyBoard.h"

#define KeyBoardToolBarHight 50







#pragma mark - KeyBoardToolBar 类
@interface KeyBoardToolBar ()


@property (nonatomic,strong) UIView *emojiView;
@property (nonatomic,strong) UIView *functionView;

/**
 
 */
@property (nonatomic,strong) UITextField *textField;

/**
 隐藏键盘的按钮
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

@end


@implementation KeyBoardToolBar



#pragma mark  LifeStyle Method
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.dismissButton];
        [self addSubview:self.textField];
        [self addSubview:self.recordButton];
        [self addSubview:self.recordTipButton];
        [self addSubview:self.emojiButton];
        [self addSubview:self.addButton];
        
        [self setBackgroundColor:RGB(244.0, 244.0, 246.0)];
        [self.layer setBorderWidth:0.3];
        [self.layer setBorderColor:[LineViewColor CGColor]];
    }
    return self;
}





#pragma mark  Getter/Setter Method
-(UIView *)emojiView
{
    if (_emojiView== nil)
    {
        _emojiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 220)];
        [_emojiView setBackgroundColor:[UIColor purpleColor]];
    }
    return _emojiView;
}

-(UIView*)functionView
{
    if (_functionView==nil)
    {
        _functionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 220)];
    }
    return _functionView;
}

-(DropperButton *)dismissButton
{
    if (_dismissButton == nil)
    {
        _dismissButton  = [[DropperButton alloc]initWithFrame:CGRectMake(0, -kScreen_Height, kScreen_Width, kScreen_Height)];
        [_dismissButton addTarget:self action:@selector(recordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissButton;
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





#pragma mark  Response Method
-(void)dismissButtonAction:(DropperButton*)sender
{
    [self.textField resignFirstResponder];
}


-(void)recordButtonAction:(DropperButton*)sender
{
    switch (sender.tag)
    {
        case 0:
        {
            [sender setTag:1];
            [sender setImage:[UIImage imageNamed:@"语音.png"] forState:UIControlStateNormal];
            [self.textField becomeFirstResponder];
        }
            break;
        case 1:
        {
            [sender setTag:0];
            [sender setImage:[UIImage imageNamed:@"键盘.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
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
            [self.textField resignFirstResponder];
            [self.textField setInputView:self.emojiView];
            [self.textField becomeFirstResponder];
            
        }
            break;
        case 1:
        {
            [sender setTag:0];
            [sender setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
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
            [sender setImage:[UIImage imageNamed:@"添加.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
            [self.textField setInputView:self.functionView];
            [self.textField becomeFirstResponder];
            
        }
            break;
        case 1:
        {
            [sender setTag:0];
            [sender setImage:[UIImage imageNamed:@"表情.png"] forState:UIControlStateNormal];
            [self.textField resignFirstResponder];
            [self.textField setInputView:nil];
            [self.textField becomeFirstResponder];
            [self.textField resignFirstResponder];
            
        }
            break;
    }
}








#pragma mark  Private Method

@end










#pragma mark - ********** ******** **********
#pragma mark   **********    分    **********
#pragma mark   **********    割    **********
#pragma mark   **********    线    **********
#pragma mark   ********** ******** **********


#pragma mark - KeyBoard 类
@implementation KeyBoard
@synthesize keyBoardToolBarView;


#pragma mark  LifeStyle Method
static KeyBoard *sharedObject = nil; //第一步：静态实例，并初始化。

+(KeyBoard*)sharedHelp
{
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
        
        sharedObject = [[self alloc]init];
        [sharedObject addObserverNotificationCenter];
        
    });
    return sharedObject;
}

-(void)addSuperView:(UIView*)superView;
{
    //键盘上显示的视图
    keyBoardToolBarView = [[KeyBoardToolBar alloc]initWithFrame:CGRectMake(0, kScreen_Height-KeyBoardToolBarHight, kScreen_Width, KeyBoardToolBarHight)];
    [superView addSubview:keyBoardToolBarView];
}



-(void)addObserverNotificationCenter
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeObserverNotificationCenter
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}






#pragma mark  Delegate Method
#pragma mark  Response Method
- (void)keyboardWillShow:(NSNotification *)notification
{
    float rects = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    NSLog(@"升起的时间%lf",rects);
    CGRect rect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y = rect.origin.y;
    
    [UIView animateWithDuration:rects animations:^{
        
        [keyBoardToolBarView setFrame:CGRectMake(0, y - KeyBoardToolBarHight, kScreen_Width, KeyBoardToolBarHight)];
        
    }];
    
}


- (void)keyboardWillHide:(NSNotification *)notification
{
    float rect = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    NSLog(@"收回的时间%lf",rect);
    
    [UIView animateWithDuration:rect animations:^{
        
        [keyBoardToolBarView setFrame:CGRectMake(0, kScreen_Height - KeyBoardToolBarHight, kScreen_Width, KeyBoardToolBarHight)];
        
    }];
    
    
}




#pragma mark  Private Method





@end


