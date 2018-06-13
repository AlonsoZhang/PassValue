//
//  ZWViewController.h
//  TestPassValue
//
//  Created by Alonso Zhang on 12/9/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "ThirdViewController.h"

//1.Delegate
@interface ZWViewController : UIViewController<secondViewDelegate>//1.5添加代理协议

@property (nonatomic, strong) SecondViewController *second;//8.1指向Sencond视图的成员变量

- (IBAction)showSecondView:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end