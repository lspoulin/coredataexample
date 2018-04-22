//
//  TableViewController.h
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
@interface TableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *modifyButton;

@property(strong, nonatomic) NSMutableArray * landmarks;
@end
