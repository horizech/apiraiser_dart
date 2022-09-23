# Apiraiser Library for Dart

## Introduction
Apiraiser is a headless CMS which provides easy-to-use backend for various kinds of applications like E-commerce, blogs, CMS etc. This library is meant to provide Apiraiser APIs access

## Features
Provides easy to use APIs access when using Apiraiser as backend

## Getting started
To use this library, you need to have Apiraiser healess CMS running at a public accessible server

## Usage

```dart
  /// Initialize the library
  Apiraiser.init("https://apiraiser-api-endpoint.com");

  /// Authentication
  Apiraiser.authentication
      .login(LoginRequest(username: "test", password: "P@ssword1"));
  // or
  Apiraiser.authentication
      .login(LoginRequest(email: "test@example.com", password: "P@ssword1"));

  /// Get table rows
  Apiraiser.data.get("my-table", -1);
```

## Additional information
To learn more: go to [https://apiraiser.com](https://apiraiser.com)
