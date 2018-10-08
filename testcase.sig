signature TEST_CASE =
sig
  type testMethod
  val run      : unit -> unit
  val describe : string -> testMethod -> unit
  val it       : string -> testMethod -> unit
end
