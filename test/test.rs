extern mod re2;

fn main () {
  assert_eq!(re2::version_string(), ~"0.0");
  assert_eq!(re2::version_interface_current(), 0);
  assert_eq!(re2::version_interface_revision(), 0);
  assert_eq!(re2::version_interface_age(), 0);

  let opt = re2::opt_new();
  re2::opt_set_log_errors(opt, 0);
  assert_eq!(re2::opt_encoding(opt), re2::UTF8);

  let pattern = ~"(world) ([0-9]+)";
  let len = pattern.len();
  let regex = re2::new(pattern, len, opt);
  assert_eq!(re2::pattern(regex), pattern);
  assert_eq!(re2::num_capturing_groups(regex), 2);
  assert_eq!(re2::program_size(regex), 16);
  assert_eq!(re2::error_code(regex), re2::NO_ERROR);
  assert_eq!(re2::error_string(regex), ~"");

  let text = ~"hello world 42!";
  //let matches: re2::Matches = ~[~"", ~"", ~""];
  let mut matches: ~[~str] = re2::Matches::new(2u32);
  re2::easy_match(pattern, text, matches);
  assert_eq!(matches[0], ~"world 42");
  assert_eq!(matches[1], ~"world");
  assert_eq!(matches[2], ~"42");
  println!("{:?}", matches);

  re2::delete(regex);
  re2::opt_delete(opt);

  println("tests passed!");
}

