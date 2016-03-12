//
//  DropperEaseEmojiViewController.m
//  Dropper
//
//  Created by ZhongMeng on 16/3/3.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "DropperEaseEmojiViewController.h"

@interface DropperEaseEmojiViewController ()


@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) NSMutableArray *emojiArray;

@end

@implementation DropperEaseEmojiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.titleLabel setText:self.emojiArray[0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100,200, 30)];
        [_titleLabel setText:@"sss"];
        [_titleLabel setBackgroundColor:[UIColor redColor]];
    }
    return _titleLabel;
}





//将数字转为
#define EMOJI_CODE_TO_SYMBOL(x) ((((0x808080F0 | (x & 0x3F000) >> 4) | (x & 0xFC0) << 10) | (x & 0x1C0000) << 18) | (x & 0x3F) << 24);
//定义的宏将转成UTF8，取出对应的表情符号：

//获取默认表情数组

- (NSMutableArray *)emojiArray
{
    if (_emojiArray == nil)
    {
        _emojiArray = [NSMutableArray array];
        for (int i=0x1F600; i<=0x1F64F; i++)
        {
            
            if (i < 0x1F641 || i > 0x1F644)
            {
                
                int sym = EMOJI_CODE_TO_SYMBOL(i);
                
                NSString *emoT = [[NSString alloc] initWithBytes:&sym length:sizeof(sym) encoding:NSUTF8StringEncoding];
                
                NSLog(@"%@",emoT);
                
                [_emojiArray addObject:emoT];
                
            }
        }
    }
  
    
    return _emojiArray;
    
}



@end
