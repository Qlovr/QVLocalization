//
//  QVLocalization.m
//

#import "QVLocalization.h"

@implementation QVLocalization{
    NSBundle *bundle;
    NSString *currentLanguage;
}

//Singleton instance
static QVLocalization *_sharedLocalSystem = nil;


+ (instancetype) sharedLocalSystem
{
	@synchronized([QVLocalization class])
	{
		if (!_sharedLocalSystem){
			_sharedLocalSystem = [[self alloc] init];
		}
		return _sharedLocalSystem;
	}
}

-(instancetype) init
{
    if(self = [super init]){
        [self resetLocalization];
    }
    return self;
}

+(instancetype)alloc
{
	@synchronized([QVLocalization class])
	{
		NSAssert(_sharedLocalSystem == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedLocalSystem = [super alloc];
		return _sharedLocalSystem;
	}
	// to avoid compiler warning
	return nil;
}

// Gets the current localized string as in NSLocalizedString.
//
// example calls:
// QVLocalizedString(@"Text to localize",@"Alternative text, in case hte other is not find");
- (NSString *)localizedStringForKey:(NSString *)key
{
	return [bundle localizedStringForKey:key value:nil table:nil];
}


// Sets the desired language of the ones you have.
// example calls:
// LocalizationSetLanguage(@"Italian");
// LocalizationSetLanguage(@"German");
// LocalizationSetLanguage(@"Spanish");
//
// If this function is not called it will use the default OS language.
// If the language does not exists y returns the default OS language.
- (void) setLanguage:(NSString*) l{
	NSLog(@"preferredLang: %@", l);
	
	NSString *path = [[ NSBundle mainBundle ] pathForResource:l ofType:@"lproj" ];
	
    
	if (path == nil)
		//in case the language does not exists
		[self resetLocalization];
	else {
		bundle = [NSBundle bundleWithPath:path];
        currentLanguage = l;
    }
}

-(NSString *) getLanguage
{
    return currentLanguage;
}

// Just gets the current setted up language.
// returns "es","fr",...
//
// example call:
// NSString * currentL = LocalizationGetLanguage;
- (NSString*) getSystemLanguage{
    
	NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    
	NSString *preferredLang = [languages objectAtIndex:0];
    
	return preferredLang;
}

// Resets the localization system, so it uses the OS default language.
//
// example call:
// LocalizationReset;
- (void) resetLocalization
{
	bundle = [NSBundle mainBundle];
    currentLanguage = [self getSystemLanguage];
}


@end