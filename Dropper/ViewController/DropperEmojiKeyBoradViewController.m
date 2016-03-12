//
//  DropperEmojiKeyBoradViewController.m
//  Dropper
//
//  Created by ZhongMeng on 16/3/10.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperEmojiKeyBoradViewController.h"
#import "DropperKeyBoardView.h"
#import "KeyBoard.h"

@interface DropperEmojiKeyBoradViewController ()
@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UIButton *keyBoard;
@property (nonatomic,strong) DropperButton *buttonA;
@property (nonatomic,strong) DropperButton *buttonB;
@property (nonatomic,strong) DropperButton *buttonC;

@property (nonatomic,strong) KeyBoardHelper *bottomkeyBoardView;
@property (nonatomic,strong) DropperKeyBoardView *keyBoardView;


@property (nonatomic,strong) UIButton *textFieldView;

@end

@implementation DropperEmojiKeyBoradViewController
@synthesize buttonA;
@synthesize buttonB;
@synthesize keyBoardView;
@synthesize bottomkeyBoardView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
    
    
    
    [[KeyBoard sharedHelp] addSuperView:self.view];
    
    
    
    
    
//    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, kScreen_Height-30, kScreen_Width, 30)];
//    [self.textField setBackgroundColor:[UIColor purpleColor]];
//    [self.view addSubview:self.textField];
    
//    DropperButton *bu = [[DropperButton alloc]initWithFrame:CGRectMake(0, -(kScreen_Height), kScreen_Width, kScreen_Height)];
//    [bu setBackgroundColor:[UIColor redColor]];
//    
//    UIView *a = [[UIView alloc]initWithFrame:CGRectMake(0, kScreen_Height-50, kScreen_Width, 50)];
//    [a setBackgroundColor:[UIColor greenColor]];
//    [self.view addSubview:a];
//    [a addSubview:bu];
    
    

    
    
    
    
    
    
//    bottomkeyBoardView = [[KeyBoardHelper alloc]initWithFrame:CGRectMake(0, kScreen_Height-50, kScreen_Width, 50.0)];
//    [self.view addSubview:bottomkeyBoardView];
//    
//    keyBoardView = [[DropperKeyBoardView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) withinputView:self.textFieldView withinputAccessoryView:bottomkeyBoardView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
