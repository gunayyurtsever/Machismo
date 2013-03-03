//
//  SetMatchingGame.h
//  Machismo
//
//  Created by Gunay Yurtsever on 17/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetMatchingGame : NSObject

//designated initializer
- (id) initWithCardCount:(NSUInteger) cardCount
               usingDeck:(Deck *) deck;

- (void) flipCardAtIndex:(NSUInteger) index;
- (SetCard *) cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) int score;

@end
