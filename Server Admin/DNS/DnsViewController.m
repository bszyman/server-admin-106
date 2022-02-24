//
//  DnsViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "DnsViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "DnsOverviewViewController.h"
#import "DnsLogViewController.h"
#import "DnsZonesViewController.h"
#import "DnsBonjourViewController.h"
#import "DnsSettingsViewController.h"


@interface DnsViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation DnsViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.panels = [[NSMutableDictionary alloc] init];
        
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"DnsNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Log"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Zones"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Bonjour"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"DnsNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[DnsOverviewViewController alloc] initWithNibName:@"DnsOverviewViewController"
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
            NSViewController *vc = [[DnsLogViewController alloc] initWithNibName:@"DnsLogViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"log"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Zones"]) {
        if ([self.panels objectForKey:@"zones"]) {
            NSViewController *vc = [self.panels objectForKey:@"zones"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DnsZonesViewController alloc] initWithNibName:@"DnsZonesViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"zones"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Bonjour"]) {
        if ([self.panels objectForKey:@"bonjour"]) {
            NSViewController *vc = [self.panels objectForKey:@"bonjour"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DnsBonjourViewController alloc] initWithNibName:@"DnsBonjourViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"bonjour"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DnsSettingsViewController alloc] initWithNibName:@"DnsSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[DnsOverviewViewController alloc] initWithNibName:@"DnsOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
