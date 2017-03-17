//
//  JSViewModel.m
//  JSPatchDemo
//
//  Created by 符现超 on 2017/3/6.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "JSViewModel.h"
#import <JSPatch/JPEngine.h>

@implementation JSViewModel

- (void)replaceOCMethod {
    [JPEngine startEngine];
    
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"patch" ofType:@"js"];
    NSString *encodingStr = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    
    [JPEngine evaluateScript:encodingStr];
}

@end
