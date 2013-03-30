//
//  CardGameViewController.m
//  Machismo
//
//  Created by Gunay Yurtsever on 07/02/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "CardGameResult.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutlet UIButton *dealButton;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardGameResult *cardGameResult;
@property (weak, nonatomic) IBOutlet UILabel *feedback;

@end


@implementation CardGameViewController

-(void)setup
{
    //NSLog(@"setup for CardGameViewController");
}

-(void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    [self setup];
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.game = nil;
}

- (CardGameResult *)cardGameResult
{
    if (!_cardGameResult) _cardGameResult = [[CardGameResult  alloc] init];
    return _cardGameResult;
}

@synthesize game = _game;

- (CardMatchingGame *) game
{
    if (!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (void)setGame:(CardMatchingGame *)game
{
    _game = game;
    if (!_game)
        self.feedback.text = @"You started a new game";
}


- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (IBAction)deal:(id)sender {
    self.game = nil;
    self.cardGameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}

- (void) updateUI
{
    //NSLog(@"I am updating UI");
    for (UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        //NSLog(@"cards are %@",card.contents);
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];

}


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game  flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    self.cardGameResult.score = self.game.score;
    //NSLog(@"index of the button is %d", [self.cardButtons indexOfObject:sender]);
}



@end
