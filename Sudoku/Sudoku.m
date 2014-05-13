//
//  Sudoku.m
//  Sudoku
//
//  Created by Deepak Sattiraju on 09/05/14.
//  Copyright (c) 2014 Deepak Sattiraju. All rights reserved.
//


#import "Sudoku.h"
#import <time.h>
#import <stdlib.h>

int numOfVals = 9;
@implementation Sudoku
int l = 0;
-(id)init
{
    self = [super init];
    if(self)
    {
        for(int i = 0; i<9; i++)
        {
            for(int j = 0 ; j<9 ; j++)
            {
                matrix[i][j] = 0;
            }
        }
        for(int i = 0; i<9; i++)
        {
            for(int j = 0 ; j<9 ; j++)
            {
                visibility[i][j] = YES;
            }
        }
    }
    else
    {
        return nil;
    }
    return self;
}

-(void) sortForRandom
{
    //selection sort
    int min = 10 , indexAt=0, temp;
    for(int i = 0 ; i<9 ; i++)
    {
        min = vals[i];
        temp = min;
        indexAt = i;
        for(int j = i; j < 9; j++)
        {
            if(min > vals[j])
            {
                min = vals[j];
                indexAt = j;
            }
        }
        vals[i] = min;
        vals[indexAt] = temp;
    }
}

-(NSInteger)randomWithCurrentTime:(long) Time
{
    int val;
    if(numOfVals == 0)
        numOfVals = 100;
    //Generating a matrix with Current Time
    long int i =rand()*Time;
    i = abs(i%numOfVals);
    val = vals[i];
    vals[i] = 200 + i;
    [self sortForRandom];
    numOfVals--;
    return val;

}


-(void)printSmallSquare
{
    for(int i = 0 ; i < 3; i++)
    {
        NSLog(@"%ld %ld %ld",(long)small[i][0],(long)small[i][1],(long)small[i][2]);
    }
}

-(void)rotateVertically
{
    
    NSLog(@"rotateVertically \n");
    NSInteger temp[3];
    temp[0] = small[0][0];
    temp[1] = small[0][1];
    temp[2] = small[0][2];
    for(int i = 0 ; i < 2 ; i++)
    {
        for(int j = 0 ; j <3 ; j++)
        {
            small[i][j] = small[i+1][j];
        }
    }
    small[2][0] = temp[0];
    small[2][1] = temp[1];
    small[2][2] = temp[2];
}



-(void)rotateHorizontally
{
    NSLog(@"rotateHorizontally \n");
    
    NSInteger temp[3];
    temp[0] = small[0][0];
    temp[1] = small[1][0];
    temp[2] = small[2][0];
    for(int i = 0 ; i < 3 ; i++)
    {
        for(int j = 0 ; j <2 ; j++)
        {
            small[i][j] = small[i][j+1];
        }
    }
    small[0][2] = temp[0];
    small[1][2] = temp[1];
    small[2][2] = temp[2];
}

-(void)printMatrix
{
    for(int i = 0 ; i < 9 ; i++)
    {
        NSLog(@"%ld %ld %ld %ld %ld %ld %ld %ld %ld",(long)matrix[i][0],(long)matrix[i][1],(long)matrix[i][2],(long)matrix[i][3],(long)matrix[i][4],(long)matrix[i][5],(long)matrix[i][6],(long)matrix[i][7],(long)matrix[i][8]);
    }
}


-(void)writeBoxRowRowNumber:(int)rVal andColumnNumber:(int)cVal
{
    for(int k = 0 ; k<3; k++)
    {
        for(int i = 0 ; i < 3 ; i++)
        {
            for(int j = 0 ; j < 3 ; j++)
            {
                matrix[rVal + i][cVal+j]= small[i][j];
            }
        }
        [self rotateVertically];
        cVal += 3;
    }
    [self rotateVertically];
}

-(void) writeMatrix
{
    int rVal =0 ;
    
    for(int l = 0; l<3; l++)
    {
        
        [self writeBoxRowRowNumber:rVal andColumnNumber:0];
        [self rotateHorizontally];
        rVal +=3;
    }
    [self printMatrix];
}

-(void)genMatrix
{
    numOfVals = 9;
    for(int i = 0 ; i <9 ; i++)
    {
        vals[i] = i+1;
    }
    time_t a ;
    time(&a);
    NSLog(@"%ld",a);
    long ran = (long)a;
    for(int i = 0 ; i <3; i++)
    {
        for(int j = 0; j<3; j++)
        {
            small[i][j]= [self randomWithCurrentTime:ran];
        }
    }
    [self printSmallSquare];
    [self writeMatrix];
    
  
}

-(void)genVisibilityWithNumberOfEmptyCells:(int)Val
{
    long i, j;
    for(int k = 0 ; k < Val ; k++)
    {
     
        i = rand()%9;
        j = rand()%9;
        visibility[i][j]=NO;
    }
}
@end