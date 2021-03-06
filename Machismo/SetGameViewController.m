//
//  SetGameViewController.m
//  Machismo
//
//  Created by Gunay Yurtsever on 17/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) SetMatchingGame *game;
@property (nonatomic) int flipCount;
//@property (strong, nonatomic) SetCardDeck *deck;

@end

@implementation SetGameViewController

- (void) setCardButtons:(NSArray *)cardButtons
{
    
    _cardButtons = cardButtons;
    [self updateUI];
    /*
     for (UIButton *cardButton in cardButtons){
     Card *card = [self.deck drawRandomCard];
     [cardButton setTitle:card.contents forState:UIControlStateSelected];
     }
     */
}

- (SetMatchingGame *) game
{
    if (!_game){
        _game = [[SetMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[SetCardDeck alloc] init]];
    }
    
    return _game;
}



- (IBAction)flipCard:(UIButton *)sender
{
    [self.game  flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    //NSLog(@"index of the button is %d", [self.cardButtons indexOfObject:sender]);
    
}


- (void) updateUI
{
    NSLog(@"I am updating UI");
    for (UIButton *cardButton in self.cardButtons){
        
        
        SetCard *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        [cardButton setAttributedTitle:[self AttributedCardTitle:card]
                    forState:UIControlStateSelected];
        
        [cardButton setAttributedTitle:[self AttributedCardTitle:card]
                              forState:UIControlStateNormal];
        
        [cardButton setAttributedTitle:[self AttributedCardTitle:card]
                    forState:UIControlStateSelected|UIControlStateDisabled];
        
        UIImage *img = [UIImage imageNamed:@"lightgrey.jpg"];
        [cardButton setBackgroundImage:img
                              forState:UIControlStateSelected];
        
    
        cardButton.selected = card.isFaceUp;
       // cardButton.enabled = !card.isUnplayable;
        //cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    //self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];

}


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}




- (NSMutableAttributedString *) AttributedCardTitle:(SetCard *) card
{
    NSMutableString *allSymbols = [[NSMutableString alloc] initWithString:card.symbol];
    for (int i = 2; i <= card.number; i++){
        [allSymbols appendString:card.symbol];
    }
    NSMutableAttributedString *dispStr = [[NSMutableAttributedString alloc] initWithString:allSymbols];
    NSRange range = NSMakeRange(0, [dispStr length]);
    float a = 1;
    NSMutableDictionary *stringAttributes = [NSMutableDictionary dictionary];
    NSDictionary *colors = @{ @"green" : [UIColor greenColor],
                                @"blue" : [UIColor blueColor],
                                @"red" : [UIColor redColor] };

    UIColor *uicolor = colors[card.color];
    if ([card.shading isEqualToString:@"solid"]) {
        a = 1.0;
        [stringAttributes setObject: [uicolor colorWithAlphaComponent:a]
                             forKey: NSForegroundColorAttributeName];
        
        // Set a negative width so we get both stroke and fill to show
        [stringAttributes setObject: [NSNumber numberWithFloat:-1]
                             forKey: NSStrokeWidthAttributeName];
        
    }
    else if ([card.shading isEqualToString:@"striped"]){
        a = 0.3;
        [stringAttributes setObject: [uicolor colorWithAlphaComponent:a]
                             forKey: NSForegroundColorAttributeName];
        
        // Set a negative width so we get both stroke and fill to show
        [stringAttributes setObject: [NSNumber numberWithFloat:-1]
                             forKey: NSStrokeWidthAttributeName];
    }
    else if ([card.shading isEqualToString:@"open"]){
        a = 1.0;
        [stringAttributes setObject: [uicolor colorWithAlphaComponent:a]
                             forKey: NSForegroundColorAttributeName];
        // Set a negative width so we get both stroke and fill to show
        
        [stringAttributes setObject: [NSNumber numberWithFloat:5]
                             forKey: NSStrokeWidthAttributeName];
    }

   [dispStr addAttributes:stringAttributes range:range];
    return dispStr;
}
 

@end
