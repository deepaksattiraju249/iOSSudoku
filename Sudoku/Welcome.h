//
//  Welcome.h
//  Sudoku
//
//  Created by Deepak Sattiraju on 13/05/14.
//  Copyright (c) 2014 Deepak Sattiraju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface Welcome : UIViewController
{
    @public
//    int NumberOfEmptyCells;
    IBOutlet UILabel *S;
    IBOutlet UILabel *U;
    IBOutlet UILabel *D;
    IBOutlet UILabel *O;
    IBOutlet UILabel *K;
    IBOutlet UILabel *U2;
    NSInteger time_count;
    NSTimer *timer;
    
    
}

//
//-(IBAction)EasyMode:(id)sender;
//-(IBAction)HardMode:(id)sender;
@end
