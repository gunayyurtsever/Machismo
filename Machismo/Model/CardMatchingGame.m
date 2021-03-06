//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Gunay Yurtsever on 15/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@property (readwrite, nonatomic) int score;

@property (readwrite, nonatomic) NSString* matchingInfo;


@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init]; // when implement a designated initializer, as a rule you call super clases'initializer
    
    if (self){
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    //NSLog(@"returned card at index %d is %@", index, [self.cards objectAtIndex:index]);
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    //NSLog(@"I am here 1");
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnplayable){
        if (!card.isFaceUp){
            self.score -= FLIP_COST;
            self.matchingInfo = [NSString stringWithFormat: @"You flipped %@, cost of %d", card.contents, FLIP_COST];
            for (Card *otherCard in self.cards){
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        self.matchingInfo = [NSString stringWithFormat: @"You matched %@ and %@ for %d points", card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                    } else {
                        otherCard.faceUp = NO;
                        self.score += -MISMATCH_PENALTY;
                        self.matchingInfo = [NSString stringWithFormat: @"%@ and %@ don't match, penalty of %d", card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }
                    break;
                }
            }
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
