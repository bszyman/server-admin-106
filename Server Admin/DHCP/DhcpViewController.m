//
//  DhcpViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "DhcpViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "DhcpOverviewViewController.h"
#import "DhcpLogViewController.h"
#import "DhcpClientsViewController.h"
#import "DhcpSubnetsViewController.h"
#import "DhcpStaticMapsViewController.h"
#import "DhcpSettingsViewController.h"


@interface DhcpViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation DhcpViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.panels = [[NSMutableDictionary alloc] init];
        
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"DhcpNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Log"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Clients"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Subnets"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Static Maps"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"DhcpNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[DhcpOverviewViewController alloc] initWithNibName:@"DhcpOverviewViewController"
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
            NSViewController *vc = [[DhcpLogViewController alloc] initWithNibName:@"DhcpLogViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"log"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Clients"]) {
        if ([self.panels objectForKey:@"clients"]) {
            NSViewController *vc = [self.panels objectForKey:@"clients"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DhcpClientsViewController alloc] initWithNibName:@"DhcpClientsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"clients"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Subnets"]) {
        if ([self.panels objectForKey:@"subnets"]) {
            NSViewController *vc = [self.panels objectForKey:@"subnets"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DhcpSubnetsViewController alloc] initWithNibName:@"DhcpSubnetsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"subnets"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Static Maps"]) {
        if ([self.panels objectForKey:@"staticmaps"]) {
            NSViewController *vc = [self.panels objectForKey:@"staticmaps"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DhcpStaticMapsViewController alloc] initWithNibName:@"DhcpStaticMapsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"staticmaps"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DhcpSettingsViewController alloc] initWithNibName:@"DhcpSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DhcpOverviewViewController alloc] initWithNibName:@"DhcpOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
