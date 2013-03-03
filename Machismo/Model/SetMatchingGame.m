//
//  SetMatchingGame.m
//  Machismo
//
//  Created by Gunay Yurtsever on 17/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "SetMatchingGame.h"

@interface SetMatchingGame()
    @property (strong, nonatomic) NSMutableArray *cards; // of SetCard
    @property (readwrite, nonatomic) int score;
@end


@implementation SetMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(SetCardDeck *)deck
{
    self = [super init]; // when implement a designated initializer, as a rule you call super clases'initializer
    
    if (self){
        for (int i = 0; i < cardCount; i++) {
            SetCard *card = (SetCard*)[deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
                //[self.cards insertObject:card atIndex:i];
               // NSLog(@"card.symbol = %@", card.symbol);
               // NSLog(@"card at index %d is %@", i, [self.cards objectAtIndex:i]);
            }
        }
    }
    
    return self;
    
}

- (int)countCardsFaceUp
{
    return [[self getCardsFaceUp] count];
}

- (NSArray*)getCardsFaceUp
{
    NSMutableArray* cards = [[NSMutableArray alloc] init];
    for (SetCard *c in self.cards){
        if (c.isFaceUp){
            [cards addObject:c];
        }
    }
    return [cards copy];
}

-(BOOL)areShadingsAllIdentical:(NSArray*) cards{
    BOOL result = YES;
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSString* firstCardShading = firstCard.shading;
    for (SetCard *card in cards){
        result = result && ([card.shading isEqualToString:firstCardShading]);
    }
    NSLog(@"areShadingsAllIdentical: %d",result);
    return result;
}

-(BOOL)areShadingsAllDifferent:(NSArray*) cards{
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSString *firstCardShading = firstCard.shading;
    SetCard *secondCard = (SetCard*)[cards objectAtIndex:1];
    NSString *secondCardShading = secondCard.shading;
    SetCard *thirdCard = (SetCard*)[cards objectAtIndex:2];
    NSString *thirdCardShading = thirdCard.shading;
    BOOL result = (![firstCardShading isEqualToString:secondCardShading]) && (![firstCardShading isEqualToString:thirdCardShading]) && (![secondCardShading isEqualToString:thirdCardShading]);
    NSLog(@"areShadingsAllDifferent: %d",result);
    return result;
}


-(BOOL)areShapesAllIdentical:(NSArray*) cards{
    BOOL result = YES;
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSString* firstCardSymbol = firstCard.symbol;
    for (SetCard *card in cards){
        result = result && ([card.symbol isEqualToString:firstCardSymbol]);
    }
    NSLog(@"areShapesAllIdentical: %d",result);
    return result;
}

-(BOOL)areShapesAllDifferent:(NSArray*) cards{
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSString *firstCardSymbol = firstCard.symbol;
    SetCard *secondCard = (SetCard*)[cards objectAtIndex:1];
    NSString *secondCardSymbol = secondCard.symbol;
    SetCard *thirdCard = (SetCard*)[cards objectAtIndex:2];
    NSString *thirdCardSymbol = thirdCard.symbol;
    BOOL result = (![firstCardSymbol isEqualToString:secondCardSymbol]) && (![firstCardSymbol isEqualToString:thirdCardSymbol]) && (![secondCardSymbol isEqualToString:thirdCardSymbol]);
    NSLog(@"areShapesAllDifferent: %d",result);
    return result;
}


-(BOOL)areColorsAllIdentical:(NSArray*) cards{
    BOOL result = YES;
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSString* firstCardColor = firstCard.color;
    for (SetCard *card in cards){
        result = result && ([card.color isEqualToString:firstCardColor]);
    }
    NSLog(@"areColorsAllIdentical: %d",result);
    return result;
}

-(BOOL)areColorsAllDifferent:(NSArray*) cards{
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSString *firstCardColor = firstCard.color;
    SetCard *secondCard = (SetCard*)[cards objectAtIndex:1];
    NSString *secondCardColor = secondCard.color;
    SetCard *thirdCard = (SetCard*)[cards objectAtIndex:2];
    NSString *thirdCardColor = thirdCard.color;
    BOOL result = (![firstCardColor isEqualToString:secondCardColor]) && (![firstCardColor isEqualToString:thirdCardColor]) && (![secondCardColor isEqualToString:thirdCardColor]);
    NSLog(@"areColorsAllDifferent: %d",result);
    return result;
}


-(BOOL)areNumbersAllIdentical:(NSArray*) cards{
    BOOL result = YES;
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSUInteger firstCardNumber = firstCard.number;
    for (SetCard *card in cards){
        result = result && (card.number == firstCardNumber);
    }
    NSLog(@"areNumbersAllIdentical: %d",result);
    return result;
}

-(BOOL)areNumbersAllDifferent:(NSArray*) cards{
    SetCard *firstCard = (SetCard*)[cards objectAtIndex:0];
    NSInteger firstCardNumber = firstCard.number;
    SetCard *secondCard = (SetCard*)[cards objectAtIndex:1];
    NSInteger secondCardNumber = secondCard.number;
    SetCard *thirdCard = (SetCard*)[cards objectAtIndex:2];
    NSInteger thirdCardNumber = thirdCard.number;
    BOOL result = (firstCardNumber != secondCardNumber) && (firstCardNumber != thirdCardNumber) && (secondCardNumber != thirdCardNumber);
    NSLog(@"areNumbersAllDifferent: %d",result);
    return result;
}

#define SET_BONUS 4
#define NOT_A_SET_PENALTY 2
#define FLIP_COST 1

- (void) flipCardAtIndex:(NSUInteger) index
{
    SetCard *card = (SetCard*)[self cardAtIndex:index];
    
    if (card && !card.isUnplayable){
        if (!card.isFaceUp){
            if ([self countCardsFaceUp] <= 2){
                card.FaceUp = YES;
                if ([self countCardsFaceUp] == 3){
                    NSArray* faceUpCards = [self getCardsFaceUp];
                    if ([self areShadingsAllIdentical: faceUpCards] ||  [self areShadingsAllDifferent: faceUpCards]){
                        if ([self areShapesAllIdentical: faceUpCards] || [self areShapesAllDifferent: faceUpCards]){
                            if ([self areNumbersAllIdentical: faceUpCards] || [self areNumbersAllDifferent: faceUpCards]){
                                if ([self areColorsAllIdentical: faceUpCards] || [self areColorsAllDifferent: faceUpCards]){
                                    self.score += SET_BONUS;
                                    NSLog(@"Yeeaaaaaaaaaaahhaaaaa !!! we have aset !!");
                                }else{
                                    self.score -= NOT_A_SET_PENALTY;
                                    NSLog(@"Not a set.");
                                }
                            }else{
                                self.score -= NOT_A_SET_PENALTY;
                                NSLog(@"Not a set.");
                            }
                        }else{
                            self.score -= NOT_A_SET_PENALTY;
                            NSLog(@"Not a set.");
                        }
                    }else{
                        self.score -= NOT_A_SET_PENALTY;
                        NSLog(@"Not a set.");
                    }
                }
            } 
        }else {
            card.faceUp = NO;
        }
        self.score -= FLIP_COST;
    }
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


@end
