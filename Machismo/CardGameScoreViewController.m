//
//  CardGameScoreViewController.m
//  Machismo
//
//  Created by Gunay Yurtsever on 03/03/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "CardGameScoreViewController.h"
#import "CardGameResult.h"

@interface CardGameScoreViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation CardGameScoreViewController

// setup , awakeFromNib, initWithNib does not do anything in this class, shown for the systax in the class for
// initialization that can't wait until viewDidLoad

- (void) setup{
    // initialization that can't wait until viewDidLoad
}

- (void) awakeFromNib{
    [self setup];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setup];
    }
    return self;
}

- (void)updateUI{
    NSString *displayText = @"";
    for (CardGameResult *result in [CardGameResult allGameResults]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0g)\n", result.score, result.end, round(result.duration)];
    }
    self.display.text = displayText;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
