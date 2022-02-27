//
//  NetBootViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "NetBootViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "NetBootOverviewViewController.h"
#import "NetBootLogViewController.h"
#import "NetBootConnectionsViewController.h"
#import "NetBootClientsViewController.h"
#import "NetBootSettingsViewController.h"


@interface NetBootViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation NetBootViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"NetBootNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Log"];
        [self.tabs addTabWithImageNamed:@"NSNetwork" title:@"Connections"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Clients"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"NetBootNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[NetBootOverviewViewController alloc] initWithNibName:@"NetBootOverviewViewController"
                                                                           bundle:[NSBundle mainBundle]];
        
        [self setActivePanel:vc];
        [self.panels setObject:vc forKey:@"overview"];
        
        [self.panelView addSubview:vc.view];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

- (void)clearAllSubviews
{
    NSArray *subviews = self.panelView.subviews;
    for (NSView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (void)changeModuleSubnavigation:(NSNotification *)n
{
    NSString *tabTitle = [n.userInfo objectForKey:@"tabTitle"];
    
    [self clearAllSubviews];
    
    if ([tabTitle isEqualToString:@"Log"]) {
        if ([self.panels objectForKey:@"log"]) {
            NSViewController *vc = [self.panels objectForKey:@"log"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NetBootLogViewController alloc] initWithNibName:@"NetBootLogViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"log"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Connections"]) {
        if ([self.panels objectForKey:@"connections"]) {
            NSViewController *vc = [self.panels objectForKey:@"connections"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NetBootConnectionsViewController alloc] initWithNibName:@"NetBootConnectionsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"connections"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Clients"]) {
        if ([self.panels objectForKey:@"clients"]) {
            NSViewController *vc = [self.panels objectForKey:@"clients"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NetBootClientsViewController alloc] initWithNibName:@"NetBootClientsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"clients"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NetBootSettingsViewController alloc] initWithNibName:@"NetBootSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NetBootOverviewViewController alloc] initWithNibName:@"NetBootOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
