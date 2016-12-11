//
//  NSString+PJR.m
//  Lib
//
//  Created by Paritosh on 15/05/14.
//
// * All rights reserved.
/*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the <organization> nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
   * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*/


#import "NSString+PJR.h"
//#import "CommonCrypto/CommonDigest.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation NSString (PJR)


// Checking if String is Empty//isBlank -》空白的
-(BOOL)isBlank
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}
//Checking if String is empty or nil检查字符串是否为空或者为0
-(BOOL)isValid
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

// remove white spaces from String //从字符串中删除空格
- (NSString *)removeWhiteSpacesFromString
{
	NSString *trimmedString = [self stringByTrimmingCharactersInSet:
							   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	return trimmedString;
}

// Counts number of Words in String //字符串中的个数
- (NSUInteger)countNumberOfWords
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace  intoString: nil]) {
        count++;
    }
	
    return count;
}

// If string contains substring 字符串包含字符串
- (BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

// If my string starts with given string
- (BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

// If my string ends with given string
- (BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}



// Replace particular characters in my string with new character//新字符串代替老的字符串
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

// Get Substring from particular location to given lenght
//从特定的位置给定长度的子字符串

- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
	NSRange r;
	r.location = begin;
	r.length = end - begin;
	return [self substringWithRange:r];
}

// Add substring to main String 
- (NSString *)addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;

    return [self stringByAppendingString:string];
}

// Remove particular sub string from main string 从字符串中删除特定的字符串
-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}


// If my string contains ony letters //字符串仅仅包含字母
- (BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

// If my string contains only numbers //字符串仅仅包含数字
- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

// If my string contains letters and numbers //既有字幕又有数字
- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

// If my string is available in particular array //是否字符串在数组里
- (BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

// Get String from array
+ (NSString *)getStringFromArray:(NSArray *)array
{
    return [array componentsJoinedByString:@" "];
}

// Convert Array from my String
- (NSArray *)getArray
{
    return [self componentsSeparatedByString:@" "];
}

// Get My Application Version number 获取我的应用程序版本号
+ (NSString *)getMyApplicationVersion
{
	NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleVersion = [info objectForKey:@"CFBundleVersion"];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
	return [NSString stringWithFormat:@"%@.%@", shortVersion, bundleVersion];
}

// Get My Application name  获得我的app名字
+ (NSString *)getMyApplicationName
{
	NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
	NSString *name = [info objectForKey:@"CFBundleDisplayName"];
	return name;
}


// Convert string to NSData
- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// Get String from NSData
+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
    
}

// Is Valid Password
- (BOOL)isValidPassword{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
    
}

// Is Valid Email
- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

// Is Valid Phone
- (BOOL)isVAlidPhoneNumber
{
    /*
    支持手机号段:
    移动：139   138   137   136   135   134   147   150   151   152   157   158    159   178  182   183   184   187   188
    联通： 130   131   132   155   156   185   186   145   176
    电信： 133   153   177   180   181   189
     */
    NSString *regex = @"^0?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}

// Is Valid URL

- (BOOL)isValidUrl
{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

+(NSString *)stringEncodingWithMd5:(NSString *)inputString{
    const char *string = [inputString UTF8String];
    
    int length = (int)strlen(string);
    
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(string, length, bytes);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x",bytes[i]];
    }
    return result;

}




@end
