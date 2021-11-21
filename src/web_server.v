import vweb

struct App {
	vweb.Context
}

["/"]
fn (mut app App) root() vweb.Result {
	return app.text("Hi")
}

// '/hello'로 동작. 함수 이름으로 기본 동작한다.
fn (mut app App) hello() vweb.Result {
	return app.text("Hello, World!")
}

["/hello/:name"]
fn (mut app App) hello_name(name string) vweb.Result {
	return app.text('Hello, $name')
}

fn main() {
	vweb.run(&App{}, 3000)
}
