//
//  NfsViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "NfsViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "NfsOverviewViewController.h"
#import "NfsConnectionsViewController.h"
#import "NfsSharePointsViewController.h"
#import "NfsSettingsViewController.h"


@interface NfsViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation NfsViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"NfsNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSNetwork" title:@"Connections"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Share Points"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"NfsNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[NfsOverviewViewController alloc] initWithNibName:@"NfsOverviewViewController"
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
    
    if ([tabTitle isEqualToString:@"Connections"]) {
        if ([self.panels objectForKey:@"connections"]) {
            NSViewController *vc = [self.panels objectForKey:@"connections"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NfsConnectionsViewController alloc] initWithNibName:@"NfsConnectionsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"connections"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Share Points"]) {
        if ([self.panels objectForKey:@"sharepoints"]) {
            NSViewController *vc = [self.panels objectForKey:@"sharepoints"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NfsSharePointsViewController alloc] initWithNibName:@"NfsSharePointsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"sharepoints"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NfsSettingsViewController alloc] initWithNibName:@"NfsSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[NfsOverviewViewController alloc] initWithNibName:@"NfsOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
