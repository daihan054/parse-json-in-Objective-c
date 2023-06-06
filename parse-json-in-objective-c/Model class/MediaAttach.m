//
//  MediaAttach.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "MediaAttach.h"
#import "QuickReplies.h"
#import "AppointmentEvent.h"

@implementation MediaAttach

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.addEvent = dict[@"addEvent"];
        self.numberOfRepeat = dict[@"numberOfRepeat"];
        self.failedNode = [dict[@"failedNode"] intValue];
        self.transferMsg = dict[@"transferMsg"];
        self.quickReplies = dict[@"quick_replies"];
        self.validationType = dict[@"validationType"];
        self.attributeName = dict[@"attributeName"];
        self.text = dict[@"text"];
        self.failureMessage = dict[@"failureMessage"];
        self.attachment = dict[@"attachment"];
    }
    return self;
}

- (void)setAttachment:(nullable NSDictionary *)attachment {
    _attachment = [[Attachment alloc] initWithDictionary:attachment];
}

- (void)setQuickReplies:(nullable NSArray *)quickReplies {
    _quickReplies = [NSMutableArray array];
    
    for (NSDictionary* dict in quickReplies) {
        QuickReplies* reply = [[QuickReplies alloc]initWithDictionary:dict];
        [_quickReplies addObject:reply];
    }
}

- (void)setAddEvent:(NSDictionary *)addEvent {
    _addEvent = [[AppointmentEvent alloc]initWithDictionary:addEvent];
}

@end
