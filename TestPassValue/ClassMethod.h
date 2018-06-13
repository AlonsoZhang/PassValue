//
//  ClassMethod.h
//  TestPassValue
//
//  Created by Alonso Zhang on 1/9/15.
//  Copyright (c) 2015 Alonso Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassMethod : NSObject
//9.Class
+(void)passValue:(NSString *)string;

+(NSString *)getValue;//9.1新建类添加pass和get的方法

@end
