//
//  ChatBotPayload.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "AttachmentPayload.h"

@implementation AttachmentPayload

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *) dict {
    if (self = [super init]) {
        self.elements = dict[@"elements"];
        self.buttons = dict[@"buttons"];
        self.templateType = dict[@"template_type"];
        self.text = dict[@"text"];
        self.url = dict[@"url"];
    }
    return self;
}

- (void)setButtons:(nullable NSArray *)buttons {
    _buttons = [[NSMutableArray alloc]init];
    for (NSDictionary* dict in buttons) {
        ChatBotButton* button = [[ChatBotButton alloc]initWithDictionary:dict];
        [_buttons addObject:button];
    }
}

- (void)setElements:(nullable NSArray *)elements {    
    _elements = [NSMutableArray array];
    
    for (NSDictionary* dict in elements) {
        CarouselElement* element = [[CarouselElement alloc]initWithDictionary:dict];
        [_elements addObject:element];
    }
}

@end
