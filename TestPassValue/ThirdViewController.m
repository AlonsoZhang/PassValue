//
//  ThirdViewController.m
//  TestPassValue
//
//  Created by Alonso Zhang on 12/16/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    
    //6.Attribute
    self.AttributeLabel.text = self.naviTitle;//6.4保存传过来的值
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goback:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
