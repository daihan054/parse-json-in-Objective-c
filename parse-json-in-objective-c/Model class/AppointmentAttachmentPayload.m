//
//  AppointmentAttachmentPayload.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "AppointmentAttachmentPayload.h"
#import "AppointmentButton.h"

@implementation AppointmentAttachmentPayload

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.buttons = dict[@"buttons"];
        self.templateType = dict[@"template_type"];
        self.text = dict[@"text"];
    }
    return self;
}

- (void)setButtons:(nullable NSArray *)buttons {    
    _buttons = [NSMutableArray array];
    
    for(NSDictionary* dict in buttons) {
        AppointmentButton* button = [[AppointmentButton alloc]initWithDictionary:dict];
        [_buttons addObject:button];
    }
}

@end
