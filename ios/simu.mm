//
//  simu.m
//  ios
//
//  Created by wz on 2018/9/30.
//  Copyright © 2018年 wz. All rights reserved.
//

#import "simu.h"
#include <iostream>



@implementation simu

+ (NSString *)logPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"iosSimulatorLog"];
}

+ (BOOL)enableSimLog {
    NSString *path = [self logPath];
    if(![[NSFileManager defaultManager] fileExistsAtPath:path]){
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:true attributes:nil error:nil];
    }
    dispatch_queue_t queue = dispatch_queue_create("Redirect_Sim_Log", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
       system("xcrun simctl spawn booted log stream >> ~/iosSimulatorLog/sim.log");
    });
    
    return true;
}

+ (char *)simLogDir {
    NSString *dir = [[self logPath] stringByAppendingPathComponent:@"sim.log"];
    return (char *)dir.UTF8String;
}

@end

