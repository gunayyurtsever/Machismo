//
//  SetCardDeck.m
//  Machismo
//
//  Created by Gunay Yurtsever on 17/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"


@interface SetCardDeck()
    @property (strong, nonatomic) NSMutableArray *cards; // of Card
@end


@implementation SetCardDeck


- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


- (id)init
{
    self = [super init]; // you let superclass initializes itself.
    
    if (self) {
        for (NSString *symbol in [SetCard validSymbols]) {
            for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
                for (NSString* shading in [SetCard validShadings]) {
                    for (UIColor* color in [SetCard validColors]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.number = number;
                        card.symbol = symbol;
                        card.shading = shading;
                        card.color = color;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    
    return self;
}

/*
- (SetCard *) drawRandomCard
{
    SetCard *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
 
}*/

@end
