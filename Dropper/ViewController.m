//
//  ViewController.m
//  Dropper
//
//  Created by ZhongMeng on 16/2/24.
//  Copyright © 2016年 yaolizhi. All rights reserved.
//

#import "ViewController.h"
#import "DropperEaseEmojiViewController.h"
#import "DropperAVFoundationViewController.h"
#import "DropperDateComponentsViewController.h"
#import "DropperEmojiKeyBoradViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

/**
 主表格视图
 */
@property (nonatomic,strong) UITableView *mainTableView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

#pragma mark - DataRequest Method



#pragma mark - LifeStyle Method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"主视图"];
    [self.view addSubview:self.mainTableView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Getter/Setter Method
-(UITableView*)mainTableView
{
    if (_mainTableView == nil)
    {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreen_Width,kScreen_Height) style:UITableViewStylePlain];
        [_mainTableView setDelegate:self];
        [_mainTableView setDataSource:self];
    }
    return _mainTableView;
}


-(NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        _dataArray = [[NSMutableArray alloc]initWithObjects:@"表情处理",@"音频播放",@"日期组件",@"表情特殊键盘",nil];
    }
    return _dataArray;
}

#pragma mark - Delegate Method
#pragma mark  UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            [self.navigationController pushViewController:[[DropperEaseEmojiViewController alloc] init] animated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:[[DropperAVFoundationViewController alloc] init] animated:YES];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[[DropperDateComponentsViewController alloc] init] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[[DropperEmojiKeyBoradViewController alloc] init] animated:YES];
        }
            break;
    }
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count] > 0 ? [self.dataArray count] : 0;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    [cell.textLabel setText:(NSString*)self.dataArray[indexPath.row]];
    return cell;
}


#pragma mark - Response Method


#pragma mark - PrivateMethod
@end
