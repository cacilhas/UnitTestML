signature TEST_CASE =
sig
  type test_method
  val run      : unit -> unit
  val describe : string -> test_method -> unit
  val it       : string -> test_method -> unit
end
