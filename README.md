![modak-api](./docs/main.png)

<div align="center">
<h1>Modak API with dart</h1>
</div>

Modak API wrapper with dart

- [Examples](#example)
- [Branch](#branch)
- [DTO](#dto)
- [Test](#test)

# Example

Create modak API object

```dart
m = Modak(
    token: Token.parseFromString("accessToken"),
    refreshToken: "refreshToken",
    endpoint: Endpoint(host: "host", port: 1234)
);
```

Get collection list (uuid)

```dart
final collectionsUUID = m.collection.getCollectionsUUID("username", 0, 100);
```

# DTO

DTO use json serialize

```bash
dart run build_runner build --delete-conflicting-outputs
```

# Test

### Test Coverage

Test with coverage

```bash
dart pub global run coverage:test_with_coverage
```

Need genhtml, if Window follow [this steps](https://fredgrott.medium.com/lcov-on-windows-7c58dda07080) to insall genhtml

```bash
genhtml -o coverage/html coverage/lcov.info
```
