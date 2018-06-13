//
//  ClassMethod.m
//  TestPassValue
//
//  Created by Alonso Zhang on 1/9/15.
//  Copyright (c) 2015 Alonso Zhang. All rights reserved.
//

#import "ClassMethod.h"

@implementation ClassMethod

NSString *tempString;

+(void)passValue:(NSString *)string
{
    tempString=string;
}

+(NSString *)getValue
{
    NSString *string=[[NSString alloc] init];
    string=tempString;
    return string;
}

@end