//
//  SecondViewController.h
//  TestPassValue
//
//  Created by Alonso Zhang on 12/10/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

//5.Singleton
#import "Singleton.h"//5.2引用头文件

//6.Attribute
#import "ThirdViewController.h"//6.2引用头文件

//7.ShareApplication
#import "ZWAppDelegate.h"//7.2引用头文件

//9.Class
#import "ClassMethod.h"//9.2引用头文件

//1.Delegate
@protocol secondViewDelegate
-(void)showName:(NSString *)nameString;
@end//1.1定义协议与方法

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)Cancel:(id)sender;

//1.Delegate
@property (nonatomic, weak)id<secondViewDelegate> delegate;//1.2设置代理属性
@property (weak, nonatomic) IBOutlet UIButton *delegateMethod;
- (IBAction)delegateMethod:(id)sender;//

//2.Notification
@property (weak, nonatomic) IBOutlet UIButton *notificationMethod;
- (IBAction)notificationMethod:(id)sender;//

//3.Block
typedef void (^ablock)(NSString *str);
@property (nonatomic, copy) ablock block;//3.1定义一个block，参数为字符串
@property (weak, nonatomic) IBOutlet UIButton *blockMethod;
- (IBAction)blockMethod:(id)sender;//

//4.UserDefault
@property (weak, nonatomic) IBOutlet UIButton *userDefaultMethod;
- (IBAction)userDefaultMethod:(id)sender;//

//5.Singleton
@property (weak, nonatomic) IBOutlet UIButton *singletonMethod;
- (IBAction)singletonMethod:(id)sender;//

//6.Attribute
@property (weak, nonatomic) IBOutlet UIButton *attributeMethod;
- (IBAction)attributeMethod:(id)sender;//

//7.ShareApplication
@property (weak, nonatomic) IBOutlet UIButton *shareapplicationMethod;
- (IBAction)shareapplicationMethod:(id)sender;//

//8.KVO
@property (weak, nonatomic) IBOutlet UIButton *KVOMethod;
- (IBAction)KVOMethod:(id)sender;
@property (nonatomic ,strong) NSString* userName;//8.3设置待监听的成员变量

//9.Class
@property (weak, nonatomic) IBOutlet UIButton *classMethod;
- (IBAction)classMethod:(id)sender;//

@end
