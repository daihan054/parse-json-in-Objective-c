//
//  QuickReplies.m
//  TestProject2
//
//  Created by REVE Systems on 1/6/23.
//

#import <Foundation/Foundation.h>
#import "QuickReplies.h"

@implementation QuickReplies

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.contentType = dict[@"content_type"];
        self.payload = dict[@"payload"];
        self.title = dict[@"title"];
    }
    return self;
}

@end
