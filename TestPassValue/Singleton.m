//
//  Singleton.m
//  TestPassValue
//
//  Created by Alonso Zhang on 12/18/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
//5.Singleton
static Singleton *SingletonData = nil;

+(Singleton *)shareData
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SingletonData = [Singleton new];
    });
    return SingletonData;
}//5.1建立Singleton类，为这个类实现单例

@end