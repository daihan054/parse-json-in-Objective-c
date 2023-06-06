//
//  CarouselButton.h
//  TestProject2
//
//  Created by REVE Systems on 4/6/23.
//

#import<Foundation/Foundation.h>

@interface CarouselButton : NSObject

@property(nonatomic,strong,nullable) NSString* payload; 
@property(nonatomic,strong,nullable) NSString* title; 
@property(nonatomic,strong,nullable) NSString* type; 
@property(nonatomic,strong,nullable) NSString* url; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
