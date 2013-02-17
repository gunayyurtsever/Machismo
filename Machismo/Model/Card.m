//
//  Card.m
//  Machismo
//
//  Created by Gunay Yurtsever on 07/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "Card.h"

/*
@interface Card()

@end
*/

@implementation Card

- (int) match:(NSArray *) otherCards
{
    int score = 0;
    
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
            break;
        }
    }
    
    return score;
}

@end
