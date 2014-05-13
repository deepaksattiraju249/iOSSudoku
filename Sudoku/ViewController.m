//
//  ViewController.m
//  Sudoku
//
//  Created by Deepak Sattiraju on 09/05/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Sudoku.h"


@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController
@synthesize textArray = _textArray;
@synthesize NumberOfEmptyCells;

-(IBAction)transition
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if(NumberOfEmptyCells == 70)
    {
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hard.jpg"]];
        [self.view addSubview:backgroundImage];
        [self.view sendSubviewToBack:backgroundImage];
        backgroundImage = nil;
        mode.text = @"Hard";
    }
    if(NumberOfEmptyCells == 30)
    {
        UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"easy.jpg"]];
        [self.view addSubview:backgroundImage];
        [self.view sendSubviewToBack:backgroundImage];
        backgroundImage = nil;
        mode.text = @"Easy";
        
    }
    
    
	// Do any additional setup after loading the view, typically from a nib.
    int x = 75, y = 150;
    [self Timer:self];
    mat = [[Sudoku alloc]init];
    [mat genMatrix];


    [mat genVisibilityWithNumberOfEmptyCells:NumberOfEmptyCells];
    for(int i = 0; i< 9; i++)
    {
        if( i == 3 || i == 6)
        {
            y+=2;
        }
        for(int j =0 ; j<9; j++)
        {
            //Making the text box for each block
            if(j == 3 || j == 6 )
            {
                x+=2;
            }
        CGRect c = CGRectMake(x + j*20, y + i*20, 20, 20);
            UITextField *a = [[UITextField alloc] initWithFrame:c];
            a.backgroundColor = [UIColor whiteColor];
            a.borderStyle = UITextBorderStyleRoundedRect;
            a.font = [UIFont systemFontOfSize: 10];
            
            a.keyboardType = UIKeyboardTypeNumberPad;
            a.delegate =self;
            
            
            //if Visible add the value should be displayed
            if(mat->visibility[i][j])
            {
                a.text = [NSString stringWithFormat:@"%d",mat->matrix[i][j]];
                a.backgroundColor = [UIColor lightGrayColor];
                sudoku[i][j] = a;
                [self.view addSubview:sudoku[i][j]];
                [a resignFirstResponder];
                continue;
            }
            //adding the text box to our array
            a.clearsOnBeginEditing = YES;
            sudoku[i][j] = a;
        
        [self.view addSubview:sudoku[i][j]];
            [a resignFirstResponder];
        }
        x -=4;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
{
    //making sure that the number of characters in one box is only 1
    if([textField.text length] == 0)
        return YES;
    
      textField.text = [textField.text substringToIndex:1];
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if (![[touch view] isKindOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}
-(IBAction)submit:(id)sender
{
    //Checking all positions with the matrix
    NSLog(@"Here I Submit");
    for(int i = 0 ; i<9 ; i++)
    {
        NSLog(@"%@ %@ %@ %@ %@ %@ %@ %@ %@",sudoku[i][0].text,sudoku[i][1].text,sudoku[i][2].text,sudoku[i][3].text,sudoku[i][4].text,sudoku[i][5].text,sudoku[i][6].text,sudoku[i][7].text,sudoku[i][8].text);    }
    for(int i = 0 ; i<9 ; i++)
    {
        for(int j =0; j<9; j++)
        {
            NSInteger cellVal = [sudoku[i][j].text intValue] ;
            NSInteger matVal = (NSInteger)self->mat->matrix[i][j];
            if( cellVal!= matVal)
            {
                // the Condition where the cells dont match is true
                // Pop up stating you lose!
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lose"
                                                                message:@"Try again"
                                                               delegate:self
                                                      cancelButtonTitle:@"Ok!"
                                                      otherButtonTitles:nil];
                [alert show];
                return;
            }
        }
    }
    int minutes = time_count / 60;
    int seconds = time_count %60;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You WIN"
                                                    message:[NSString stringWithFormat: @"Congratulations!\n You have completed in %02i:%02i",minutes,seconds]
                                                   delegate:self
                                          cancelButtonTitle:@"Ok!"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction)Timer:(id)sender
{
    time_count = 0;
    if(!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(UpdateTimerOnScreen:)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

-(IBAction)transition:(id)sender
{
    
    [self viewDidLoad];
}

- (void)UpdateTimerOnScreen:(id)sender  {
    time_count++;
    int minutes = time_count / 60;
    int seconds = time_count %60;
    _timeLabel.text = [NSString stringWithFormat:@"%02i : %02i",minutes,seconds];
}
-(IBAction)reset:(id)sender
{
    [self Timer:self];
    for(int i = 0 ; i<9 ; i++)
    {
        for(int j =0; j<9; j++)
        {
            //setting all cells to null
                sudoku[i][j].text = @"";
            
            //showing only those cells whose visibility is true
                if(mat->visibility[i][j])
                {
                    sudoku[i][j].text = [NSString stringWithFormat:@"%d",mat->matrix[i][j]];
                }
        }
    }
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//}

@end
