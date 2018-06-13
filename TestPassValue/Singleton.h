//
//  Singleton.h
//  TestPassValue
//
//  Created by Alonso Zhang on 12/18/14.
//  Copyright (c) 2014 Alonso Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
@property (strong, nonatomic) NSString *value;
+(Singleton *)shareData;
@end