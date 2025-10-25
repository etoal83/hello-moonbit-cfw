///|
test "hello" {
  let greeting = hello()

  // `inspect` is used to check the output of the function
  // Just write `inspect(value)` and execute `moon test --update`
  // to update the expected output, and verify them afterwards
  inspect(greeting, content="Hello Worker from Moonbit!")
}
