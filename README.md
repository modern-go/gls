# goroutine local storage

[![Sourcegraph](https://sourcegraph.com/github.com/modern-go/gls/-/badge.svg)](https://sourcegraph.com/github.com/modern-go/gls?badge)
[![GoDoc](http://img.shields.io/badge/go-documentation-blue.svg?style=flat-square)](http://godoc.org/github.com/modern-go/gls)
[![Build Status](https://travis-ci.org/modern-go/gls.svg?branch=master)](https://travis-ci.org/modern-go/gls)
[![codecov](https://codecov.io/gh/modern-go/gls/branch/master/graph/badge.svg)](https://codecov.io/gh/modern-go/gls)
[![rcard](https://goreportcard.com/badge/github.com/modern-go/gls)](https://goreportcard.com/report/github.com/modern-go/gls)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://raw.githubusercontent.com/modern-go/gls/master/LICENSE)

Thanks https://github.com/huandu/go-tls for original idea

* get current goroutine id
* goroutine local storage

require go version >= 1.4

# gls.GoID

get the identifier unique for this goroutine

```go
go func() {
	gls.GoID()
}()
go func() {
	gls.GoID()
}()
```

# gls.Set / gls.Get

goroutine local storage is a `map[interface{}]interface{}` local to current goroutine

It is intended to be used by framworks to simplify context passing.

Use `context.Context` to pass context if possible.

```go
gls.Set("user_id", "abc")
doSomeThing()

func doSomeThing() {
	gls.Get("user_id") // will be "abc"
}
```