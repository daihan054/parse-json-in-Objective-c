//
//  BotMessageAttachment.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "Attachment.h"

@implementation Attachment

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.payload = dict[@"payload"];
        self.type = dict[@"type"];
    }
    return self;
}

- (void)setPayload:(nullable NSDictionary *)payload {
    _payload = [[AttachmentPayload alloc]initWithDictionary:payload];
}

@end
