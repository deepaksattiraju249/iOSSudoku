//
//  Welcome.m
//  Sudoku
//
//  Created by Deepak Sattiraju on 13/05/14.
//  Copyright (c) 2014 Deepak Sattiraju. All rights reserved.
//

#import "Welcome.h"
#import "ViewController.h"

@interface Welcome ()

@end

@implementation Welcome



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startTimer:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Anim:(id)sender
{
    
    int posOfLetter = time_count %6;
    int posOfWord = (time_count/6)%2;
    CGRect positionS = [S frame];
    CGRect positionU = [U frame];
    CGRect positionD = [D frame];
    CGRect positionO = [O frame];
    CGRect positionK = [K frame];
    CGRect positionU2 = [U2 frame];
    switch (posOfLetter) {
        case 0:
            if(posOfWord == 1)
            {
                positionS.origin.y += 10;
            }
            else
            {
                positionS.origin.y -= 10;
            }
            break;
            
        case 1:
            if(posOfWord == 1)
            {
                positionU.origin.y += 10;
            }
            else
            {
                positionU.origin.y -= 10;
            }
            break;
        case 2:
            if(posOfWord == 1)
            {
                positionD.origin.y += 10;
            }
            else
            {
                positionD.origin.y -= 10;
            }
            break;
        case 3:
            if(posOfWord == 1)
            {
                positionO.origin.y += 10;
            }
            else
            {
                positionO.origin.y -= 10;
            }
            break;
        case 4:
            if(posOfWord == 1)
            {
                positionK.origin.y += 10;
            }
            else
            {
                positionK.origin.y -= 10;
            }
            break;
            
        case 5:
            if(posOfWord == 1)
            {
                positionU2.origin.y += 10;
            }
            else
            {
                positionU2.origin.y -= 10;
            }
            break;
        default:
            break;
    }
    
    S.frame = positionS;
    U.frame = positionU;
    D.frame = positionD;
    O.frame = positionO;
    K.frame = positionK;
    U2.frame = positionU2;
    time_count++;
    
    
}
-(IBAction)startTimer:(id)sender
{
    time_count = 0;
    if(!timer)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.25f
                                                  target:self
                                                selector:@selector(Anim:)
                                                userInfo:nil
                                                 repeats:YES];
    }
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Easy"])
    {
        
        ViewController *vs = [segue destinationViewController];
        vs.NumberOfEmptyCells =  30;
        
    }
    else if([[segue identifier] isEqualToString:@"Hard"])
    {
        
        ViewController *vs = [segue destinationViewController];
        vs.NumberOfEmptyCells =  70;
    }
}


@end
