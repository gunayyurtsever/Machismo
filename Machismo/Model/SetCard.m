//
//  SetCard.m
//  Machismo
//
//  Created by Gunay Yurtsever on 17/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

// setter 'number'
- (void)setNumber:(NSUInteger)number
{
    if ((number <= 3) && (number>=1)) {
        _number = number;
    }
}

@synthesize symbol = _symbol; // because we provide setter AND getter

// setter symbol
- (void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

// getter symbol
- (NSString *)symbol
{
    return _symbol ? _symbol : @"?";
}

// setter color
- (void)setcolor:(NSString *)color
{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

@synthesize shading = _shading; // because we provide setter AND getter

// setter shading
- (void)setshading:(NSString *)shading
{
    if ([[SetCard validShadings] containsObject:shading]) {
        _shading = shading;
    }
}

// getter shading
- (NSString *)shading
{
    return _shading ? _shading : @"?";
}


+ (NSArray *)validSymbols
{
    //return @[@"△",@"◯",@"☐"];
    return @[@"▲",@"●",@"■"];    
}

+ (NSArray *)validShadings
{
    return @[@"solid",@"striped",@"open"];
}

+ (NSArray *)validColors
{
   return @[@"green",@"red",@"blue"];
}

+ (NSUInteger)maxNumber
{
    return 3;
}

// getter contents
- (NSString *)contents
{
    /*
    NSMutableString *allSymbols = [[NSMutableString alloc] initWithString:self.symbol];
    for (int i = 2; i <= self.number; i++){
       [allSymbols appendString:self.symbol];
    }
    NSMutableAttributedString *dispStr = [[NSMutableAttributedString alloc] initWithString:allSymbols];
    NSRange range = NSMakeRange(0, [dispStr length]);
    float a = 0;
    if ([self.shading isEqualToString:@"solid"]) {
        a = 1;
    }
    else if ([self.shading isEqualToString:@"striped"]){
        a = 0.5;
    }
    else if ([self.shading isEqualToString:@"open"]){
        a = 0;
    }
    [dispStr addAttribute:NSForegroundColorAttributeName value:[self.color colorWithAlphaComponent:a] range:range];
    //[dispStr addAttribute:NSStrokeWidthAttributeName value:@-5 range:range];
    return dispStr;
     */
    return @"ssss";
}


@end
