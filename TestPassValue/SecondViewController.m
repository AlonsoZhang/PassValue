//
//  SecondViewController.m
//  TestPassValue
//
//  Created by Alonso Zhang on 12/10/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameTextField.text = @"";
}

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)notEmpty
{
    if ([self.nameTextField.text length] == 0)
    {
        return NO;
    }
    return YES;
}

-(void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please input message!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![self.nameTextField isExclusiveTouch])
    {
        [self.nameTextField resignFirstResponder];
    }
}//收键盘

//1.Delegate
- (IBAction)delegateMethod:(id)sender
{
    if ([self notEmpty])
    {
        [self.delegate showName:self.nameTextField.text];//1.4通过委托变量调用委托方法
        [self dismissViewControllerAnimated:YES completion:nil];//页面跳转
    }
    else
    {
        [self showAlert];
    }
}//

//2.Notification
- (IBAction)notificationMethod:(id)sender
{
    if ([self notEmpty])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeNameNotification" object:self userInfo:@{@"name":self.nameTextField.text}];//2.1发送通知
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlert];
    }
}//

//3.Block
- (IBAction)blockMethod:(id)sender
{
    if ([self notEmpty])
    {
        if (self.block)//检查block是否存在
        {
            self.block(self.nameTextField.text);//3.2block赋值
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    else
    {
        [self showAlert];
    }
}//

//4.NSUserDefault
- (IBAction)userDefaultMethod:(id)sender
{
    if ([self notEmpty])
    {
        [[NSUserDefaults standardUserDefaults] setObject:self.nameTextField.text forKey:@"myNameText"];//4.1保存一个value值到到一个key值中
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlert];
    }
}

//5.Singleton
- (IBAction)singletonMethod:(id)sender
{
    if ([self notEmpty])
    {
        Singleton *singletondate = [Singleton shareData];//5.3获取唯一实例
        singletondate.value = self.nameTextField.text;//5.4属性传值
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlert];
    }
}//

//6.Attribute
- (IBAction)attributeMethod:(id)sender
{
    if ([self notEmpty])
    {
        UITextField *AttributeString = self.nameTextField;//
        ThirdViewController *AttributeViewController = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
        AttributeViewController.naviTitle = AttributeString.text;//6.3用下一个视图的属性接受想要传过去的值,属性传值直接属性赋值
        [self presentViewController:AttributeViewController animated:YES completion:^{ }];
    }
    else
    {
        [self showAlert];
    }
}//

//7.ShareApplication
- (IBAction)shareapplicationMethod:(id)sender
{
    if ([self notEmpty])
    {
        ZWAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];//7.3取得appDelegate
        appDelegate.apptext = self.nameTextField.text;//7.4给其apptext变量赋值
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlert];
    }
}//

//8.KVO
- (IBAction)KVOMethod:(id)sender
{
    if ([self notEmpty])
    {
        self.userName = self.nameTextField.text;//8.4传值给成员变量
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlert];
    }
}//

//9.Class
- (IBAction)classMethod:(id)sender
{
    if ([self notEmpty])
    {
        [ClassMethod passValue:self.nameTextField.text];//9.3通过passValue方法赋值给ClassMethod
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlert];
    }
}//

@end
