//
//  ViewController.h
//  Sudoku
//
//  Created by Deepak Sattiraju on 09/05/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sudoku.h"

@interface ViewController : UIViewController
{
    @public
    UITextField *sudoku[9][9];
    Sudoku *mat;
    int time_count;
    
       NSTimer *_timer ;
    IBOutlet UILabel *mode;
   IBOutlet UILabel *_timeLabel;
    IBOutlet UIViewController *game;
    IBOutlet UIViewController *splash;
}

@property (nonatomic, readwrite, weak) UITextField *textArray;
@property (nonatomic,readwrite) int NumberOfEmptyCells;
-(IBAction)submit:(id)sender;
-(IBAction)reset:(id)sender;
-(IBAction)transition;
@end
