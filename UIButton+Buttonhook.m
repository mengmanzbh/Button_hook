//
//  UIButton+Buttonhook.m
//  Button_hook
//
//  Created by 谢霆锋 on 2017/5/1.
//  Copyright © 2017年 zbh. All rights reserved.
//

#import "UIButton+Buttonhook.h"

@implementation UIButton (Buttonhook)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass = [self class];
        SEL oriSEL = @selector(sendAction:to:forEvent:);
        Method oriMethod = class_getInstanceMethod(selfClass, oriSEL);
        SEL cusSEL = @selector(mySendAction:to:forEvent:);
        Method cusMethod = class_getInstanceMethod(selfClass, cusSEL);
        BOOL addSucc = class_addMethod(selfClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSucc) {
            class_replaceMethod(selfClass, cusSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else {
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
}

- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.tag == 124) {
        //    [MobClick event:@"hq_haguiyin"];
    }
    if (self.tag == 125) {
        //    [MobClick event:@"hq_haguiyin"];
    }
    //.....
    [self mySendAction:action to:target forEvent:event];
}

@end
