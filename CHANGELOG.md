## 3.0.0

- Created final v3 release
- Compatable with Apiraiser v3.0.0.

## 3.0.0-rc.7

- Added getCount API
- Compatable with Apiraiser v3.0.0-rc.7.

## 3.0.0-rc.5

- Added interceptors for unauthorized access
- Added onUnauthenticated function in init method, then passed to interceptors
- Added SaveSessionInSecureStorage function to save both access and refresh token in local storage
- Added loadSessionFromSecureStorage function to load both access and refresh token from local storage
- Added clearSessionFromSecureStorage function to clear local storage
- Added access and refresh tokens in state variable
- Added loadPreviousSession, startRefreshTokenTimer, stopRefreshTokenTimer method in authentication class
- Updated loadSessionUsingJwt, refreshToken, signOut, isSignedIn, getCurrentUser methods in authentication class
- Compatable with Apiraiser v3.0.0-rc.5.

## 3.0.0-rc.3

- Added init function in authentication
- Added sender name in SMTP Controller
- Added validateStatus in ALL APIs

## 3.0.0-rc.2

- Added overwriteFiles(boolean), OutputPathPrefix(enum) in Archive APIs
- Added deleteSourceFolderAfterUpload(boolean) in AWSS3 UploadFolder API
- Added SMTP Send Email API

## 3.0.0-rc.1

- Updated apiraiser version from v2 to v3
- Updated DeleteRow API
- Updated Table, Column, Data APIs
- Added AWSS3 upload folder api

## 2.0.0

- Updated apiraiser version from v1 to v2
- Added Archive APIs
- Added AWSS3 APIs

## 1.0.2

- Added limit, orderBy, orderDescendingBy, offset in get and getByConditions APIs

## 1.0.1

- Implemented platform based Rest classes

## 1.0.0

- Added RefreshToken API.
- Added ResetPassword API.
- Added ForgotPassword API.
- Added Verify API.
- Added Update Media API.
- Added Download Media API.
- Added Upload Storage API.
- Added Update Storage API.
- Added Download Storage API.
- Added Delete Storage API.
- Added OAuth2 APIs.
- Added Feature APIs.
- Added Encryptrion APIs.
- Added GetUserByRole API.
- Added Commerce APIs.

## 0.2.3

- Updated isSignedIn function.

## 0.2.2

- Updated authentication APIs.

## 0.2.1

- Updated isSignedIn function.

## 0.2.0

- Asynchronous improvements.
- Added signOut API.

## 0.1.8

- Updated Token logic.
- Compatable with Apiraiser v0.6.1.

## 0.1.7

- Updated jsonEncode.
- Compatable with Apiraiser v0.6.1.

## 0.1.6

- Bugfixes.
- Compatable with Apiraiser v0.6.1.

## 0.1.5

- Updated User and jsonEncode.
- Compatable with Apiraiser v0.6.1.

## 0.1.4

- Bugfixes.
- Compatable with Apiraiser v0.6.1.

## 0.1.3

- Bugfixes.
- Compatable with Apiraiser v0.6.1.

## 0.1.2

- Added getCurrentUser and loadLastSession functions.
- Compatable with Apiraiser v0.6.1.

## 0.1.1

- Export the models and enums.
- Created a new function isSignedIn.
- Compatable with Apiraiser v0.6.1.

## 0.1.0

- Initial version.
- Compatable with Apiraiser v0.6.1.
