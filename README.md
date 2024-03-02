# Modak API

Modak API

모두의 도감 API wrapper

# Branch

- master: production branch, must be tested
- main: develop branch

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
