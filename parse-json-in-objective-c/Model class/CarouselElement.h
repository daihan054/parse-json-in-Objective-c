//
//  CarouselElement.h
//  TestProject2
//
//  Created by REVE Systems on 1/6/23.
//

#import<Foundation/Foundation.h>
#import "CarouselButton.h"

@interface CarouselElement : NSObject

@property(nonatomic,strong,nullable) NSMutableArray<CarouselButton*> * buttons; 
@property(nonatomic,strong,nullable) NSString* imageUrl; 
@property(nonatomic,strong,nullable) NSString* subtitle; 
@property(nonatomic,strong,nullable) NSString* title; 
@property(nonatomic,strong,nullable) CarouselButton* defaultAction; 

-(nullable instancetype) initWithDictionary:(nullable NSDictionary*) dict;

@end
