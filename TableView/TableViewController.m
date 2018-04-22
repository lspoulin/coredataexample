//
//  TableViewController.m
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import "TableViewController.h"
#import "DetailsViewController.h"
#import "Landmark.h"
#import "AppDelegate.h"

@interface TableViewController (){
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    NSPersistentStoreCoordinator * coordinator;
    NSArray *dictionnaries;
}

@end

@implementation TableViewController

@synthesize landmarks;

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appDelegate.persistentContainer.viewContext;
    coordinator = appDelegate.persistentContainer.persistentStoreCoordinator;
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"EntityLandmark"];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    NSError *deleteError = nil;
    [coordinator executeRequest:delete withContext:context error:&deleteError];
   
    
    NSManagedObject *entityObj = [NSEntityDescription insertNewObjectForEntityForName:@"EntityLandmark" inManagedObjectContext:context];
    [entityObj setValue:@"Stade Olympique" forKey:@"title"];
    [entityObj setValue:@"4141 Pierre-de Coubertin Ave, Montreal, QC H1V 3N7" forKey:@"titledescription"];
    [entityObj setValue:@"Olympic Stadium[1] (French: Stade olympique) is a multi-purpose stadium in Canada, located at Olympic Park in the Hochelaga-Maisonneuve district of Montreal. Built in the mid-1970s as the main venue for the 1976 Summer Olympics, it is nicknamed \"The Big O\", a reference to both its name and to the doughnut-shape of the permanent component of the stadium's roof. It is also called \"The Big Owe\" to reference the astronomical cost of the stadium and the 1976 Olympics as a whole" forKey:@"details"];
    [entityObj setValue:@"stadeolympique.jpg" forKey:@"image"];
    [entityObj setValue:@45.5579957 forKey:@"latitude"];
    [entityObj setValue:@-73.5518816 forKey:@"longitude"];
    
    [appDelegate saveContext];
    
    entityObj = [NSEntityDescription insertNewObjectForEntityForName:@"EntityLandmark" inManagedObjectContext:context];
    [entityObj setValue:@"Musee Grevin" forKey:@"title"];
    [entityObj setValue:@"4141 Pierre-de Coubertin Ave, Montreal, QC H1V 3N7" forKey:@"titledescription"];
    [entityObj setValue:@"The Musée Grévin Montreal is a waxwork museum in Montreal located in Montreal Eaton Centre in Ville-Marie, Montreal, Canada. It is open daily; an admission fee is charged." forKey:@"details"];
    [entityObj setValue:@"museegrevin.jpg"forKey:@"image"];
    [entityObj setValue:@45.5027511 forKey:@"latitude"];
    [entityObj setValue:@-73.57077979999997 forKey:@"longitude"];
    
    [appDelegate saveContext];
    
    entityObj = [NSEntityDescription insertNewObjectForEntityForName:@"EntityLandmark" inManagedObjectContext:context];
    [entityObj setValue:@"La Ronde" forKey:@"title"];
    [entityObj setValue:@"Ile Jean-Drapeau" forKey:@"titledescription"];
    [entityObj setValue:@"La Ronde (Round) is an amusement park in Montreal, Quebec, Canada, built as the entertainment complex for Expo 67, the 1967 world fair. Today, it is owned and operated by Six Flags. The park is under an emphyteutic lease with the City of Montreal, which expires in 2065. It is the largest amusement park in Quebec, and second largest in Canada." forKey:@"details"];
    [entityObj setValue:@"laronde.jpg"forKey:@"image"];
    [entityObj setValue:@45.521538 forKey:@"latitude"];
    [entityObj setValue:@-73.53601500000002 forKey:@"longitude"];
    
    [appDelegate saveContext];
    
    entityObj = [NSEntityDescription insertNewObjectForEntityForName:@"EntityLandmark" inManagedObjectContext:context];
    [entityObj setValue:@"Insectarium" forKey:@"title"];
    [entityObj setValue:@"4581 Sherbrooke St E, Montreal, QC H1X 2B2" forKey:@"titledescription"];
    [entityObj setValue:@"An insectarium is a live insect zoo, or a museum or exhibit of live insects. Insectariums often display a variety of insects and similar arthropods, such as spiders, beetles, cockroaches, ants, bees, millipedes, centipedes, crickets, grasshoppers, stick insects, scorpions, and mantids. Displays can focus on learning about insects, types of insects, their habitats, why they are important, and the work of entomologists, arachnologists, and other scientists that study terrestrial arthropods and similar animals." forKey:@"details"];
    [entityObj setValue:@"insectarium.jpg"forKey:@"image"];
    [entityObj setValue:@45.56101839999999 forKey:@"latitude"];
    [entityObj setValue:@-73.5578418 forKey:@"longitude"];
    
    [appDelegate saveContext];
    
    
    NSFetchRequest *requestLandmark = [NSFetchRequest fetchRequestWithEntityName:@"EntityLandmark"];
    landmarks = [NSMutableArray arrayWithArray:[context executeFetchRequest:requestLandmark error:nil]];
    
 
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return landmarks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString * title = [[landmarks valueForKey:@"title"] objectAtIndex:[indexPath row]];
    NSString * titledescription = [[landmarks valueForKey:@"titledescription"] objectAtIndex:[indexPath row]];
    NSString * image = [[landmarks valueForKey:@"image"] objectAtIndex:[indexPath row]];
    [[cell cellTitleLabel] setText:title];
    [[cell cellDescriptionLabel] setText:titledescription];
    [[cell cellImageView] setImage:[UIImage imageNamed:image]];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSString * soughtLandmark=[[landmarks valueForKey:@"title"] objectAtIndex:[indexPath row]];
        NSEntityDescription *landmarkEntity=[NSEntityDescription entityForName:@"EntityLandmark" inManagedObjectContext:context];
        NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
        [fetch setEntity:landmarkEntity];

        NSPredicate *p=[NSPredicate predicateWithFormat:@"title == %@", soughtLandmark];
        [fetch setPredicate:p];
        NSError *fetchError;
        NSArray *result = [context executeFetchRequest:fetch error:&fetchError];
        
        for (NSManagedObject *landmark in result) {
            [context deleteObject:landmark];
        }
        
        [appDelegate saveContext];
        [[self landmarks] removeObjectAtIndex:[indexPath row]];
        
        [UIView animateWithDuration:0.3
                         animations:^(void) {
                             [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                         }
                         completion:^(BOOL finished) {
                             [tableView reloadData];
                         }];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showDetails"]){
        DetailsViewController *detail = [segue destinationViewController];
        NSIndexPath *myIndexPath = [[self tableView] indexPathForSelectedRow];
        int row = (int) [myIndexPath row];
        NSString * title = [[landmarks valueForKey:@"title"] objectAtIndex:row];
        NSString * titledescription = [[landmarks valueForKey:@"titledescription"] objectAtIndex:row];
        NSString * image = [[landmarks valueForKey:@"image"] objectAtIndex:row];
        NSString * details = [[landmarks valueForKey:@"details"] objectAtIndex:row];
         float latitude = [[[landmarks valueForKey:@"latitude"] objectAtIndex:row] floatValue];
         float longitude = [[[landmarks valueForKey:@"longitude"] objectAtIndex:row] floatValue];
        
        Landmark *landmark = [[Landmark alloc] initWithTitle:title anddescription:titledescription andimage:image anddetailDescription:details andLatitude:latitude andLongitude:longitude];
        [detail setLandmark:landmark];

    }
    
}

-(IBAction)modifyButton:(id)sender{
    
if([[[self navigationItem] leftBarButtonItem] style] ==  UIBarButtonItemStylePlain) {
    [self modifier];
} else if([[[self navigationItem] leftBarButtonItem] style] ==  UIBarButtonItemStyleDone) {
    [self terminer];
}
}

- (void)modifier {
    UINavigationItem* navigationItem = [self navigationItem];
    [[navigationItem leftBarButtonItem] setStyle:UIBarButtonItemStyleDone];
    [[navigationItem leftBarButtonItem] setTitle:@"Terminer"];
    [[self tableView] setEditing:YES animated:YES];
}

- (void)terminer {
    UINavigationItem* navigationItem = [self navigationItem];
    [[navigationItem leftBarButtonItem] setStyle:UIBarButtonItemStylePlain];
    [[navigationItem leftBarButtonItem] setTitle:@"Modifier"];
    [[self tableView] setEditing:NO animated:YES];
}




@end
