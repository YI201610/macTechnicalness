//
//  MTTopViewTableDataSource.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2014/12/04.
//
//

#import "MTTopViewTableDataSource.h"


@implementation MTTopViewTableDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = [_dataController numberOfSection];
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionName = [_dataController sectionNameStringWithIndex:section];
    NSInteger count = [_dataController numberOfItemForSection:sectionName];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger sectionNo = indexPath.section;
    NSInteger rowNo = indexPath.row;

    NSString *sectionName = [_dataController sectionNameStringWithIndex:sectionNo];
    NSString* itemNameString = [_dataController itemForSection:sectionName index:rowNo];
    
    static NSString* cellID = @"techphone";
    UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = itemNameString;

    return cell;
}


@end
