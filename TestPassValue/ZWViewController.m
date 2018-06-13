//
//  ZWViewController.m
//  TestPassValue
//
//  Created by Alonso Zhang on 12/9/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import "ZWViewController.h"

@interface ZWViewController ()

@end

@implementation ZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //2.Notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeNameNotification:) name:@"ChangeNameNotification" object:nil];//2.2注册通知
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSecondView:(UIButton *)sender
{
    self.second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    //1.Delegate
    self.second.delegate = self;//1.3设置Delegate指向
    
    //8.KVO
    [self.second addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew context:nil];//8.2注册KVO观察者对象
    
    //3.Block
    __block ZWViewController *blockSelf = self;//避免retain cycle,创建本地变量指向self
    self.second.block = ^(NSString *str)
    {
        blockSelf.nameLabel.text = str;
    };//3.3block回调
    
    [self presentViewController:self.second animated:YES completion:nil];
}

//1.Delegate
-(void)showName:(NSString *)nameString
{
    self.nameLabel.text = nameString;
}//1.6实现传值协议方法

//2.Notification
-(void)ChangeNameNotification:(NSNotification*)notification
{
    self.nameLabel.text = [[notification userInfo] objectForKey:@"name"];
}//2.3调用,显示

//2.Notification
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}//2.4移除通知

//8.KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"userName"])
    {
        self.nameLabel.text = self.second.userName;//8.5设置监听key对应值变化
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //4.NSUserDefault
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"myNameText"] length] != 0)
    {
        self.nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"myNameText"];//4.2取出对应key值保存的数据
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"myNameText"];//4.3清空对应key值保存的数据
        [[NSUserDefaults standardUserDefaults] synchronize];//4.4保存更新
    }//
    
    //7.ShareApplication
    ZWAppDelegate *app = [[UIApplication sharedApplication]delegate];
    if ([app.apptext length] != 0)
    {
        self.nameLabel.text = app.apptext;//7.5进行传值
        app.apptext = @"";
    }//
    
    //5.Singleton
    Singleton *singletondate = [Singleton shareData];
    if ([singletondate.value length] != 0)
    {
        self.nameLabel.text = singletondate.value;//5.5进行传值
        singletondate.value = @"";
    }//
    
    //8.KVO
    [self.second removeObserver:self forKeyPath:@"userName"];//8.6清理观察
    
    //9.Class
    if ([[ClassMethod getValue] length] != 0)
    {
        self.nameLabel.text = [ClassMethod getValue];//9.4通过getValue方法从ClassMethod读取值
        [ClassMethod passValue: @""];
    }
}

@end