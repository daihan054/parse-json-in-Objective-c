//
//  CarouselElement.m
//  TestProject2
//
//  Created by REVE Systems on 1/6/23.
//

#import <Foundation/Foundation.h>
#import "CarouselElement.h"

@implementation CarouselElement

- (nullable instancetype)initWithDictionary:(nullable NSDictionary *)dict {
    if (self = [super init]) {
        self.buttons = dict[@"buttons"];
        self.imageUrl = dict[@"image_url"];
        self.subtitle = dict[@"subtitle"];
        self.title = dict[@"title"];
        self.defaultAction = dict[@"default_action"];
    }
    return self;
}

- (void)setButtons:(nullable NSArray *)buttons {
    _buttons = [NSMutableArray array];
    
    for (NSDictionary* dict in buttons) {
        CarouselButton* button = [[CarouselButton alloc]initWithDictionary:dict];
        [_buttons addObject:button];
    }
}

- (void)setDefaultAction:(nullable NSDictionary *)defaultAction {
    _defaultAction = [[CarouselButton alloc]initWithDictionary:defaultAction];
}

@end
