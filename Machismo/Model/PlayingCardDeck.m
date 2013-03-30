//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by Gunay Yurtsever on 07/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//


#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init]; // you let superclass initializes itself.
    NSLog(@"Hello from init in PlayingCardDeck");
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
    }
    
    return self;
}

@end