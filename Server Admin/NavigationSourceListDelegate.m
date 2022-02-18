//
//  NavigationSourceListDelegate.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "NavigationSourceListDelegate.h"
#import "Models/ServiceNavigationItem.h"

@interface NavigationSourceListDelegate ()

@property (weak) IBOutlet NSTreeController *treeController;

@end

@implementation NavigationSourceListDelegate

- (BOOL)outlineView:(NSOutlineView *)outlineView
        isGroupItem:(id)item
{
    NSTreeNode *node = (NSTreeNode *)item;
    BOOL isLeaf = [[node.representedObject valueForKey:@"isLeaf"] boolValue];
    
    return !isLeaf;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
   shouldSelectItem:(id)item
{
    return YES;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
   shouldExpandItem:(id)item
{
    NSTreeNode *node = (NSTreeNode *)item;
    BOOL isLeaf = [[node.representedObject valueForKey:@"isLeaf"] boolValue];
    
    return !isLeaf;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView
     viewForTableColumn:(NSTableColumn *)tableColumn
                   item:(id)item
{
    NSTreeNode *node = (NSTreeNode *)item;
    
    if (node.childNodes.count > 0) {
        return [outlineView makeViewWithIdentifier:@"HeaderCell" owner:self];
    } else {
        return [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
    }
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification
{
    NSTreeNode *selectedNode = [self.treeController.selectedObjects objectAtIndex:0];
    ServiceNavigationItem *navigationItem = selectedNode.representedObject;

    [[NSNotificationCenter defaultCenter] postNotificationName:@"changedNavigation"
                                                        object:self
                                                      userInfo:@{@"navigationItem": navigationItem}];
}

@end
