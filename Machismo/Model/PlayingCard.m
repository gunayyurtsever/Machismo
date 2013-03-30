//
//  PlayingCard.m
//  Machismo
//
//  Created by Gunay Yurtsever on 07/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1){
        id otherCard = [otherCards lastObject];
        if ([otherCard isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherPlayingCard = (PlayingCard *)otherCard;
            if ([otherPlayingCard.suit isEqualToString:self.suit]){
                score = 1;
            }else if (otherPlayingCard.rank == self.rank){
                score = 4;
            }
        }

    }
    return score;
}

@synthesize suit = _suit; // because we provide setter AND getter

// setter suit
- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// getter suit
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

// setter rank
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

// getter contents
- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}



@end