//
//  RACExtension.m
//  JSPatchDemo
//
//  Created by 符现超 on 2017/3/6.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

// 创建扩展：https://github.com/bang590/JSPatch/wiki/%E5%88%9B%E5%BB%BA%E6%89%A9%E5%B1%95

#import "RACExtension.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <ReactiveObjC/ReactiveObjC.h>

@implementation RACExtension

+ (void)main:(JSContext *)context {
    context[@"RACObserve"] = ^ RACSignal* (id observer, id target, NSString *keyPath) {
        _Pragma("clang diagnostic push")
        _Pragma("clang diagnostic ignored \"-Wreceiver-is-weak\"") 
        __weak id target_ = (target);
        RACSignal *signal = [target_ rac_valuesForKeyPath:keyPath observer:observer];
        _Pragma("clang diagnostic pop")
        return signal;
    };
    
}

@end
