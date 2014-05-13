//
//  Sudoku.h
//  Sudoku
//
//  Created by Deepak Sattiraju on 09/05/14.
//  Copyright (c) 2014 Deepak Sattiraju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sudoku : NSObject
{
    @public
    NSInteger matrix[9][9];
    BOOL visibility[9][9];
    NSInteger small[3][3];
    NSInteger vals[9];
}

-(void)genMatrix ;
-(void)genVisibilityWithNumberOfEmptyCells:(int)Val;
-(void)printMatrix;

@end
