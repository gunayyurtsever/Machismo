//
//  SetCard.h
//  Machismo
//
//  Created by Gunay Yurtsever on 17/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *symbol;
@property (nonatomic) NSUInteger number;
@property (strong, nonatomic) NSString *shading;
@property (strong, nonatomic) NSString *color;


@end
