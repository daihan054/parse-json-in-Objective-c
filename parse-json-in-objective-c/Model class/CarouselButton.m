//
//  CarouselButton.m
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import <Foundation/Foundation.h>
#import "CarouselButton.h"

@implementation CarouselButton

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.payload = dict[@"payload"];
        self.title = dict[@"title"];
        self.type = dict[@"type"];
        self.url = dict[@"url"];
    }
    return self;
}

@end
