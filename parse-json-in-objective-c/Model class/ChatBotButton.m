//
//  ChatBotButton.m
//  TestProject2
//
//  Created by REVE Systems on 29/5/23.
//

#import <Foundation/Foundation.h>
#import "ChatBotButton.h"

@implementation ChatBotButton

-(nullable instancetype) initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.payload = dict[@"payload"];
        self.title = dict[@"title"];
        self.type = dict[@"type"];
        self.url = dict[@"url"];
    }
    return self;
}

@end
