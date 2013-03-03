//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Gunay Yurtsever on 15/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (id) initWithCardCount:(NSUInteger) cardCount
               usingDeck:(Deck *) deck;

- (void) flipCardAtIndex:(NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger) index;

@property (readonly, nonatomic) int score;

@end
