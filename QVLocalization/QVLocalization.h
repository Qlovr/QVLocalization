//
//  QVLocalization.h
//

#import <Foundation/Foundation.h>

#define QVLocalizedString(key) \
[[QVLocalization sharedLocalSystem] localizedStringForKey:(key)]

#define LocalizationSetLanguage(language) \
[[QVLocalization sharedLocalSystem] setLanguage:(language)]

#define LocalizationGetLanguage \
[[QVLocalization sharedLocalSystem] getLanguage]

#define LocalizationReset \
[[QVLocalization sharedLocalSystem] resetLocalization]

@interface QVLocalization : NSObject {
	NSString *language;
}

// you really shouldn't care about this functions and use the MACROS
+ (instancetype) sharedLocalSystem;

//gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key;

//sets the language
- (void) setLanguage:(NSString*) language;

//gets the current language
- (NSString*) getLanguage;

//resets this system.
- (void) resetLocalization;

@end