//
//  CardGameScoreViewController.m
//  Machismo
//
//  Created by Gunay Yurtsever on 03/03/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "CardGameScoreViewController.h"

@interface CardGameScoreViewController ()

@end

@implementation CardGameScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)updateUI{
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:<#animated#>];
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
