//
//  ThirdViewController.h
//  TestPassValue
//
//  Created by Alonso Zhang on 12/16/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController

//6.Attribute
@property(nonatomic,retain)NSString *naviTitle;//6.1建立一个naviTitle属性用来存储传递过来的值

@property (weak, nonatomic) IBOutlet UILabel *AttributeLabel;
- (IBAction)goback:(id)sender;

@end