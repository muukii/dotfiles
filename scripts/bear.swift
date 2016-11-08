#!/usr/bin/swift -target x86_64-apple-macosx10.10

import Cocoa

let args = CommandLine.arguments
print(args)

guard args.count > 1 else {
  print("")
  print("Usage: bear [daily, memo]")
  print(" daily --name [your name] (required)")
  print(" memo  --tag [tags (comma separated)] (optional)")
  exit(1)
}

func createURLComponents() -> URLComponents {

  var urlComponent = URLComponents()
  urlComponent.scheme = "bear"
  urlComponent.host = "x-callback-url"
  urlComponent.path = "/create"
  return urlComponent
}

func daily() {

  guard let index = args.index(of: "--name")?.advanced(by: 1), index < args.indices.count else {
    print("Required --name [your name]")
    exit(1)
  }

  let name = args[index]
  let date = Date()

  let formatter = DateFormatter()
  formatter.dateFormat = "MM/d"

  let dateString = formatter.string(from: date)

  let title = "【日報】\(dateString) \(name)"
  let body = ""
    + "# 10:00 出社\n"
    + "\n"
    + "# 19:00 退勤\n"
    + "\n"
    + "# 明日のタスク\n"
    + "\n"
    + "# 一言\n"

  var urlComponent = createURLComponents()

  urlComponent.queryItems = [
    URLQueryItem(name: "title", value: title),
    URLQueryItem(name: "text", value: body),
    URLQueryItem(name: "tags", value: "daily"),
  ]

  guard let url = urlComponent.url else {
    fatalError("Oops. Something went wrong.")
  }

  NSWorkspace.shared().open(url)
}

func memo() {

  let tag: String

  if let index = args.index(of: "--tag")?.advanced(by: 1), index < args.indices.count {
    tag = args[index]
  } else {
    tag = "temporary/memo"
  }

  var urlComponent = createURLComponents()

  urlComponent.queryItems = [
    URLQueryItem(name: "tags", value: tag),
  ]

  guard let url = urlComponent.url else {
    fatalError("Oops. Something went wrong.")
  }

  NSWorkspace.shared().open(url)
}

let mode = args[1]

switch mode {
case "memo":
  memo()
case "daily":
  daily()
default:
  print("Unknown mode")
}
