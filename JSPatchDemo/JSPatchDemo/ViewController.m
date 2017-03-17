//
//  ViewController.m
//  JSPatchDemo
//
//  Created by 符现超 on 2017/3/6.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, copy) NSString *text;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self jsPatchWithRac];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (void)jsPatchWithRac {
    [[RACObserve(self, text) ignore:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    @weakify(self);
    [[[self.textView.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return (value && value.length > 0);
    }] distinctUntilChanged] subscribeNext:^(NSString * _Nullable x) {
        @strongify(self);
        self.text = x;
    }];
    
}



@end
